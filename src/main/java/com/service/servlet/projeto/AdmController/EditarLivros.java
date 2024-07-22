package com.service.servlet.projeto.AdmController;

import com.service.servlet.projeto.DAO.LivroDAOImpl;
import com.service.servlet.projeto.Model.Livros;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/editbooks")
public class EditarLivros extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LivroDAOImpl livroDAO = new LivroDAOImpl();
        Livros livro = new Livros();

        try{
            Long id = Long.parseLong(request.getParameter("id"));
            String nomeLivro = request.getParameter("nomeLivro");
            String ISBN = request.getParameter("isbnLivro");
            int quantidade = Integer.parseInt(request.getParameter("qtdLivro"));

            livro.setId(id);
            livro.setNome(nomeLivro);
            livro.setIsbn(ISBN);
            livro.setQuantidade(quantidade);

            boolean verificar = livroDAO.update(livro);

            HttpSession session = request.getSession();

            if(verificar){
                session.setAttribute("sucessMsg", "Livro atualizado com sucesso...");
                response.sendRedirect("admin/all_books.jsp");
            }else{
                session.setAttribute("failMsg", "Ocorreu um erro ao tentar atualizar o livro...");
                response.sendRedirect("admin/all_books.jsp");
            }


        }catch (Exception e){
            e.printStackTrace();
        }
    }
}