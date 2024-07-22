
package com.service.servlet.projeto.Controller;

import java.io.*;
import com.service.servlet.projeto.DAO.UsuarioDAOImpl;
import com.service.servlet.projeto.Model.Usuarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/index")
public class InitialPage extends HttpServlet {
    HttpSession session;

    @Override
    public void init() throws ServletException {
        super.init();
        session.setAttribute("userRole", "user");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

    }

}
