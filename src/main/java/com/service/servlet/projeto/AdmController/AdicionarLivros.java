package com.service.servlet.projeto.AdmController;

import com.service.servlet.projeto.DAO.CategoriaDAOImpl;
import com.service.servlet.projeto.DAO.LivroDAOImpl;
import com.service.servlet.projeto.Model.Categorias;
import com.service.servlet.projeto.Model.Livros;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;

@WebServlet("/add_books")
@MultipartConfig
public class AdicionarLivros extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Categorias categoria = new Categorias();
        CategoriaDAOImpl categoriaDAO = new CategoriaDAOImpl();
        Livros livro = new Livros();
        LivroDAOImpl livroDAO = new LivroDAOImpl();

        try {
            String nomeLivro = request.getParameter("nomeLivro");
            String ISBN = request.getParameter("isbnLivro");
            String cat = request.getParameter("categoriaLivro");
            String novoVelho = request.getParameter("novoVelho");
            String status = request.getParameter("status");
            int quantidade = Integer.parseInt(request.getParameter("qtdLivro"));
            Part part = request.getPart("imagemLivro");
            String fileName = part.getSubmittedFileName();

            HttpSession session = request.getSession();

            if (livroDAO.existsByName(nomeLivro)) {
                session.setAttribute("failMsg", "Livro já existe!");
                response.sendRedirect("admin/add_books.jsp");
                return;
            }

            categoria = categoriaDAO.findById(Long.parseLong(cat));
            livro.setImagem(fileName);
            livro.setCategoria(categoria);
            livro.setNome(nomeLivro);
            livro.setStatus(status);
            livro.setIsbn(ISBN);
            livro.setNovoVelho(novoVelho);
            livro.setQuantidade(quantidade);

            boolean verificar = livroDAO.save(livro);
            if (verificar) {
                String path = "C:\\Users\\luucc\\OneDrive\\Documentos\\GitHub\\ProjetoServlets\\src\\main\\webapp\\books";
                //String path = getServletContext().getRealPath("/books"); Caso precise que não salve as imagens no projeto. Precisa de uma tabela imagem.
                File file = new File(path);
                //Verifica se a pasta /books existe
                if (!file.exists()) {
                    file.mkdirs();
                }

                part.write(path + File.separator + fileName);

                session.setAttribute("sucessMsg", "Livro adicionado com sucesso!");
                response.sendRedirect("admin/add_books.jsp");
            } else {
                session.setAttribute("failMsg", "Erro ao tentar adicionar livro!");
                response.sendRedirect("admin/add_books.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
