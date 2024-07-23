package com.service.servlet.projeto.AdmController;

import com.service.servlet.projeto.DAO.CategoriaDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete-category")
public class DeletarCategoria extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            CategoriaDAOImpl catDAO = new CategoriaDAOImpl();

            boolean verificar = catDAO.delete(id);

            HttpSession session = request.getSession();

            if(verificar){
                session.setAttribute("sucessMsg", "Categoria excluída com sucesso...");
                response.sendRedirect("admin/all_categories.jsp");
            }else{
                session.setAttribute("failMsg", "Ocorreu um erro ao tentar excluir a categoria...");
                response.sendRedirect("admin/all_categories.jsp");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
