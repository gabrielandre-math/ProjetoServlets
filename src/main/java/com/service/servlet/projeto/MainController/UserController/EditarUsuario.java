package com.service.servlet.projeto.MainController.UserController;

import com.service.servlet.projeto.Database.DAO.UsuarioDAOImpl;
import com.service.servlet.projeto.Database.Model.Usuarios;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/editusersingle")
public class EditarUsuario extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsuarioDAOImpl userDAO = new UsuarioDAOImpl();
        Usuarios usuario = new Usuarios();

        try {
            Long id = Long.parseLong(request.getParameter("id"));
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String senha = request.getParameter("password");

            HttpSession session = request.getSession();

            usuario.setId(id);
            usuario.setNome(nome);
            usuario.setEmail(email);
            usuario.setSenha(senha);


            boolean verificar = userDAO.update(usuario);

            if (verificar) {
                session.setAttribute("sucessMsg", "Usuário atualizado com sucesso!");
                response.sendRedirect("edit_user.jsp");
            } else {
                session.setAttribute("failMsg", "Ocorreu um erro ao tentar atualizar o usuário...");
                response.sendRedirect("edit_user.jsp");
            }


        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("failMsg", "Erro ao processar a atualização do usuário.");
            response.sendRedirect("edit_user.jsp");
        }
    }
}
