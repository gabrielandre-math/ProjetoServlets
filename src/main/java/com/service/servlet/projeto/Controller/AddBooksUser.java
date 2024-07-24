package com.service.servlet.projeto.Controller;

import com.service.servlet.projeto.Database.DAO.LivroDAOImpl;
import com.service.servlet.projeto.Database.DAO.UsuarioDAOImpl;
import com.service.servlet.projeto.Database.Model.Livros;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
//NOT FINISHED
@WebServlet("/add_books_user")
public class AddBooksUser extends HttpServlet {
    private LivroDAOImpl livroDAO = new LivroDAOImpl();
    private UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Livros> livros = livroDAO.findAll();
        request.setAttribute("livros", livros);
        request.getRequestDispatcher("add_books_user.jsp").forward(request, response);
    }
}

