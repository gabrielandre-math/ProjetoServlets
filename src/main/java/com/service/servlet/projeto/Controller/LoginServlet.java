package com.service.servlet.projeto.Controller;

import com.service.servlet.projeto.DAO.UsuarioDAOImpl;
import com.service.servlet.projeto.DB.DBConnection;
import com.service.servlet.projeto.Model.Usuarios;
import com.service.servlet.projeto.Service.UserAuthenticate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UsuarioDAOImpl usuarioDAOImpl;
    UserAuthenticate authenticate;
    Boolean loggedIn = false;
    public void init() throws ServletException {
        super.init();
        usuarioDAOImpl = new UsuarioDAOImpl();
        authenticate = new UserAuthenticate();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Obter a conexão com o banco de dados
            Connection connection = DBConnection.getConnection();
            usuarioDAOImpl.setConnection(connection);

            // Verificar se o usuário existe no banco de dados
            Usuarios usuario = usuarioDAOImpl.findByEmail(email);

            if (usuario != null && usuario.getSenha().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("usuario", usuario);

                // Verificar se o usuário é administrador
                if (usuario.isAdmin()) {
                    session.setAttribute("userRole", "admin");
                    response.sendRedirect("admin/home-admin.jsp");
                } else {
                    response.sendRedirect("home.jsp");
                }
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("loginFail", "Email ou Senha incorretos...");
                session.setAttribute("loggedIn", false);
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp");
        }
    }
}
