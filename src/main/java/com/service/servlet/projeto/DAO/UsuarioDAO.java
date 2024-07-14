package com.service.servlet.projeto.DAO;

import com.service.servlet.projeto.Model.Usuarios;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

public class UsuarioDAO extends GenericDAO<Usuarios> {
    public UsuarioDAO() {
        super();
    }

    public void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();

            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String name = request.getParameter("name");

            Usuarios newUser = new Usuarios(name, email, password);

            // Fetch all users to check for existing email
            List<Usuarios> existingUsers = findAll(Usuarios.class);

            // Authenticate against existing users
            Usuarios existingUser = autenticar(newUser, existingUsers);
            if (existingUser != null) {
                request.setAttribute("error", "Usuário já existe com este email.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            em.persist(newUser);
            em.getTransaction().commit();

            request.getSession().setAttribute("user", newUser);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            request.setAttribute("error", "Erro ao registrar usuário.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } finally {
            em.close();
        }
    }

    public boolean logar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Usuarios loginAttempt = new Usuarios(null, email, password);

            // Fetch all users to authenticate against
            List<Usuarios> users = findAll(Usuarios.class);

            // Authenticate the login attempt
            Usuarios authUser = autenticar(loginAttempt, users);
            if (authUser != null) {
                request.getSession().setAttribute("user", authUser);
                request.getRequestDispatcher("home_adm.jsp").forward(request, response);
                return true;
            } else {
                request.getSession().setAttribute("error", "Credenciais inválidas.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Erro ao fazer login.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return false;
        } finally {
            em.close();
        }
    }

    public Usuarios autenticar(Usuarios user, List<Usuarios> userList) {
        if (userList.contains(user)) {
            return userList.get(userList.indexOf(user));
        }
        return null;
    }

    public Usuarios findByEmailAndPassword(String email, String password) {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("SELECT u FROM Usuarios u WHERE u.email = :email AND u.senha = :password", Usuarios.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null; // Usuário não encontrado com o email e senha fornecidos
        } finally {
            em.close();
        }
    }

    public Usuarios findAdmin(String email, String password) {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("SELECT u FROM Usuarios u WHERE u.email = :email AND u.senha = :password AND u.isAdmin = true", Usuarios.class)
                    .setParameter("email", email)
                    .setParameter("password", password)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null; // Usuário administrador não encontrado com o email e senha fornecidos
        } finally {
            em.close();
        }
    }
}
