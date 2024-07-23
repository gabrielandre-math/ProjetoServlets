package com.service.servlet.projeto.AdmController;

import com.service.servlet.projeto.DAO.CategoriaDAOImpl;
import com.service.servlet.projeto.Model.Categorias;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/delete-category")
public class DeletarCategoria extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            CategoriaDAOImpl catDAO = new CategoriaDAOImpl();
            HttpSession session = request.getSession();
            Categorias categoria = catDAO.findById(id);

            if(categoria != null){
                session.setAttribute("failMsg", "Categoria vinculada, impossível excluir!");
                response.sendRedirect("admin/all_categories.jsp");
            }else{
                boolean verificar = catDAO.delete(id);

                if(verificar){
                    session.setAttribute("sucessMsg", "Categoria excluída com sucesso!");
                    response.sendRedirect("admin/all_categories.jsp");
                }else{
                    session.setAttribute("failMsg", "Ocorreu um erro ao tentar excluir a categoria...");
                    response.sendRedirect("admin/all_categories.jsp");
                }
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
