package com.service.servlet.projeto.MainController.AdmController;

import com.service.servlet.projeto.Database.DAO.UsuarioDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete-user")
public class DeletarUsuarios extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            UsuarioDAOImpl userDAO = new UsuarioDAOImpl();
            boolean verificar = userDAO.delete(id);

            HttpSession session = request.getSession();

            if(verificar){
                session.setAttribute("sucessMsg", "Usuário excluído com sucesso...");
                response.sendRedirect("admin/all_users.jsp");
            }else{
                session.setAttribute("failMsg", "Ocorreu um erro ao tentar excluir o usuário...");
                response.sendRedirect("admin/all_users.jsp");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
