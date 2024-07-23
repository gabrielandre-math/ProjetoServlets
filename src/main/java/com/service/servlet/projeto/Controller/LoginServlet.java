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

    public void init() throws ServletException {
        super.init();
        usuarioDAOImpl = new UsuarioDAOImpl();
        authenticate = new UserAuthenticate();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Connection connection = DBConnection.getConnection();
            usuarioDAOImpl.setConnection(connection);

            Usuarios usuario = usuarioDAOImpl.findByEmail(email);

            if (usuario != null && usuario.getSenha().equals(password)) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedIn", true);
                session.setAttribute("usuario", usuario);

                if (usuario.isAdmin()) {
                    session.setAttribute("userRole", "admin");
                    response.sendRedirect("admin/home-admin.jsp");
                } else {
                    session.setAttribute("userRole", "user");
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
