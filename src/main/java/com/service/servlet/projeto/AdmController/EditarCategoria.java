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

@WebServlet("/editcategories")
public class EditarCategoria extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoriaDAOImpl catDAO = new CategoriaDAOImpl();
        Categorias categoria = new Categorias();

        try {
            Long id = Long.parseLong(request.getParameter("id"));
            String nome = request.getParameter("nomeCat");

            categoria.setId(id);

            categoria.setNome(nome);

            boolean verificar = catDAO.update(categoria);

            HttpSession session = request.getSession();

            if (verificar) {
                session.setAttribute("sucessMsg", "Categoria atualizada com sucesso!");
                response.sendRedirect("admin/all_categories.jsp");
            } else {
                session.setAttribute("failMsg", "Ocorreu um erro ao tentar atualizar a categoria...");
                response.sendRedirect("admin/all_categories.jsp");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
