package com.service.servlet.projeto.Controller;

import com.service.servlet.projeto.Database.Connection.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/index")
public class InitialPage extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
        DBConnection.getConnection();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("userRole") == null) {
            session.setAttribute("userRole", "null");
        }
        // Redirecionar para a página inicial
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Manter a mesma lógica do doGet
        doGet(request, response);
    }
}
