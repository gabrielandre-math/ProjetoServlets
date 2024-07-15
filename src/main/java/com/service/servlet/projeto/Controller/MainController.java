package com.service.servlet.projeto.Controller;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.service.servlet.projeto.DAO.CategoriaDAO;
import com.service.servlet.projeto.DAO.LivroDAO;
import com.service.servlet.projeto.DAO.UsuarioDAO;
import com.service.servlet.projeto.Model.Categorias;
import com.service.servlet.projeto.Model.Livros;
import com.service.servlet.projeto.Model.Usuarios;
import com.service.servlet.projeto.Service.UserAuthenticate;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/index")
public class MainController extends HttpServlet {
    private LivroDAO livroDAO;
    private CategoriaDAO categoriaDAO;
    private UsuarioDAO usuarioDAO;
    Usuarios user;
    List<Usuarios> users = new ArrayList<>();
    UserAuthenticate authenticator;

    @Override
    public void init() throws ServletException {
        super.init();
        livroDAO = new LivroDAO();
        categoriaDAO = new CategoriaDAO();
        usuarioDAO = new UsuarioDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/login":
                logarUsuario(request, response);
                break;
            case "/livros":
                listarLivros(request, response);
                break;
            case "/categorias":
                listarCategorias(request, response);
                break;
            case "/usuarios":
                listarUsuarios(request, response);
                break;
            default:
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/register":{
                registrarUsuario(request, response);}
                break;
            case "/salvarLivro":{
                salvarLivro(request, response);}
                break;
            case "/salvarCategoria":{
                salvarCategoria(request, response);}
                break;
            default:{
                request.getRequestDispatcher("index.jsp").forward(request, response);}
                break;
        }
    }

    private void listarLivros(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listaLivros", livroDAO.findAll());
        request.setAttribute("listaCategorias", categoriaDAO.findAll());
        request.getRequestDispatcher("livros.jsp").forward(request, response);
    }

    private void listarCategorias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listaCategorias", categoriaDAO.findAll());
        request.getRequestDispatcher("categorias.jsp").forward(request, response);
    }

    private void listarUsuarios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listaUsuarios", usuarioDAO.findAll());
        request.getRequestDispatcher("usuarios.jsp").forward(request, response);
    }

    private void salvarLivro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String isbn = request.getParameter("isbn");
        String nome = request.getParameter("nome");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        Long categoriaId = Long.parseLong(request.getParameter("categoria"));

        Categorias categoria = categoriaDAO.findById(categoriaId);
        Livros livro = new Livros(isbn, nome, categoria, quantidade);

        livroDAO.save(livro);
        response.sendRedirect("livros");
    }

    private void salvarCategoria(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");

        Categorias categoria = new Categorias(nome);
        categoriaDAO.save(categoria);
        response.sendRedirect("categorias");
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Usuarios usuario = new Usuarios(nome, email, senha);
        usuarioDAO.save(usuario);
        response.sendRedirect("usuarios");
    }

    private void logarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        user = new Usuarios(password, email);
        var authUser = authenticator.authenticate(user, users);
        if(user.isAdmin()) {
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }else{
            if (authUser != null) {
                request.getSession().setAttribute("usuarios", authUser);
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {
                request.getSession().setAttribute("usuarios", user);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

}
