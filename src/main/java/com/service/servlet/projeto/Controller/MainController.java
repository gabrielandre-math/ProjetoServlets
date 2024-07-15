package com.service.servlet.projeto.Controller;

import java.io.*;
import java.util.List;

import com.service.servlet.projeto.DAO.CategoriaDAO;
import com.service.servlet.projeto.DAO.LivroDAO;
import com.service.servlet.projeto.DAO.UsuarioDAO;
import com.service.servlet.projeto.Model.Categorias;
import com.service.servlet.projeto.Model.Livros;
import com.service.servlet.projeto.Model.Usuarios;
import com.service.servlet.projeto.Service.UserConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/index")
public class MainController extends HttpServlet {
    private UserConfig userConfig;
    private LivroDAO livroDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userConfig = new UserConfig(); // Inicializa o UserConfig
        livroDAO = new LivroDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // implementar lógica para lidar com requisições GET, se necessário
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getServletPath();

        switch (action) {
            case "/login":
                logar(request, response);
                break;
            case "/register":
                registrar(request, response);
                break;
            case "/loadBooks":
                loadBooksFromCSV();
                break;
            default:
                // Implementar o que fazer em outras rotas, se necessário
                break;
        }
    }

    private void registrar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userConfig.registrar(request, response); // Chama o método registrar do UserDAO
    }

    private void logar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Verifica se é o administrador
        Usuarios adminUser = userConfig.findAdmin(email, password);
        if (adminUser != null) {
            // Usuário autenticado como administrador
            request.getSession().setAttribute("user", adminUser);
            request.getRequestDispatcher("home_adm.jsp").forward(request, response);
        } else {
            // Verifica se é um usuário comum
            Usuarios normalUser = userConfig.findByEmailAndPassword(email, password);
            if (normalUser != null) {
                // Usuário autenticado como usuário normal
                request.getSession().setAttribute("user", normalUser);
                request.getRequestDispatcher("welcome.jsp").forward(request, response);
            } else {
                // Usuário não encontrado ou credenciais inválidas
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    }

    private void loadBooksFromCSV(){
        livroDAO.loadBooksFromCSV();
    }

    @Override
    public void destroy() {
        super.destroy();
        userConfig.close(); // Fecha o EntityManagerFactory do UserDAO ao destruir o servlet
    }
}