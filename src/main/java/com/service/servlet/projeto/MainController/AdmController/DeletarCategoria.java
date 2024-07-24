package com.service.servlet.projeto.MainController.AdmController;

import com.service.servlet.projeto.Database.DAO.CategoriaDAOImpl;
import com.service.servlet.projeto.Database.Model.Categorias;
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
            HttpSession session = request.getSession();
            Categorias categoria = catDAO.findById(id);

            if (categoria == null) {
                session.setAttribute("failMsg", "Categoria não encontrada!");
                response.sendRedirect("admin/all_categories.jsp");
                return;
            }

            boolean isVinculada = catDAO.isCategoriaVinculada(id);

            if (isVinculada) {
                session.setAttribute("failMsg", "Categoria vinculada, impossível excluir!");
                response.sendRedirect("admin/all_categories.jsp");
            } else {
                boolean verificar = catDAO.delete(id);

                if (verificar) {
                    session.setAttribute("sucessMsg", "Categoria excluída com sucesso!");
                    response.sendRedirect("admin/all_categories.jsp");
                } else {
                    session.setAttribute("failMsg", "Ocorreu um erro ao tentar excluir a categoria...");
                    response.sendRedirect("admin/all_categories.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "Erro ao tentar excluir a categoria.");
            response.sendRedirect("admin/all_categories.jsp");
        }
    }
}
