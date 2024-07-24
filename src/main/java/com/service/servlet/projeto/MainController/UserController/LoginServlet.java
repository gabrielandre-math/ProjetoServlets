package com.service.servlet.projeto.MainController.UserController;

import com.service.servlet.projeto.Database.DAO.UsuarioDAOImpl;
import com.service.servlet.projeto.Database.Connection.DBConnection;
import com.service.servlet.projeto.Database.Model.Usuarios;
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

    public void init() throws ServletException {
        super.init();
        usuarioDAOImpl = new UsuarioDAOImpl();
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = null;
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            connection = DBConnection.getConnection();
            usuarioDAOImpl.setConnection(connection);

            Usuarios usuario = usuarioDAOImpl.findByEmail(email);

            HttpSession session = request.getSession();

            if (usuario != null && usuario.getSenha().equals(password)) {
                session.setAttribute("loggedIn", true);
                session.setAttribute("usuario", usuario);
                session.setAttribute("userId", usuario.getId());

                if (usuario.isAdmin()) {
                    session.setAttribute("userRole", "admin");
                    response.sendRedirect("admin/home-admin.jsp");
                } else {
                    session.setAttribute("userRole", "user");
                    response.sendRedirect("home.jsp");
                }
            } else {
                session.setAttribute("loginFail", "Email ou Senha incorretos...");
                session.setAttribute("loggedIn", false);
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("loginFail", "Ocorreu um erro. Por favor, tente novamente.");
            response.sendRedirect("login.jsp");
        }
    }
}
