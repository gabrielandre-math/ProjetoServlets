package com.service.servlet.projeto.Controller;

import com.service.servlet.projeto.DAO.UsuarioDAOImpl;
import com.service.servlet.projeto.Model.Usuarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    Usuarios usuario;
    private UsuarioDAOImpl usuarioDAOImpl;
    HttpSession session;

    public void init() throws ServletException {
        super.init();
        usuario = new Usuarios();
        usuarioDAOImpl = new UsuarioDAOImpl();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String nome = request.getParameter("uname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            if(usuarioDAOImpl.findByEmail(email).getEmail() == null){
                usuario.setNome(nome);
                usuario.setEmail(email);
                usuario.setSenha(password);
                usuario.setAdmin(false);

                session = request.getSession();
                boolean retorno = usuarioDAOImpl.save(usuario);

                if (retorno) {
                    session.setAttribute("sucessMsg", "Registrado com sucesso...");
                    response.sendRedirect("register.jsp");
                } else {
                    session.setAttribute("failMsg", "Registro falhou...");
                    response.sendRedirect("register.jsp");
                }
            }else{
                session = request.getSession();
                session.setAttribute("existUserMsg", "Email já está cadastrado...");
                response.sendRedirect("register.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
