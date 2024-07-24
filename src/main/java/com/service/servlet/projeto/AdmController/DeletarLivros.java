package com.service.servlet.projeto.AdmController;

import com.service.servlet.projeto.Database.DAO.LivroDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete")
public class DeletarLivros extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            LivroDAOImpl livroDAO = new LivroDAOImpl();
            boolean verificar = livroDAO.delete(id);

            HttpSession session = request.getSession();

            if(verificar){
                session.setAttribute("sucessMsg", "Livro excluído com sucesso...");
                response.sendRedirect("admin/all_books.jsp");
            }else{
                session.setAttribute("failMsg", "Ocorreu um erro ao tentar excluir o livro...");
                response.sendRedirect("admin/all_books.jsp");
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

}