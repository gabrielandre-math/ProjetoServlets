package com.service.servlet.projeto.Controller;

import com.service.servlet.projeto.DAO.UsuarioDAOImpl;
import com.service.servlet.projeto.Model.Usuarios;
import com.service.servlet.projeto.Service.UserAuthenticate;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static com.service.servlet.projeto.Constantes.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    List<Usuarios> usuarios;
    Usuarios usuario;
    private UsuarioDAOImpl usuarioDAOImpl;
    HttpSession session;
    UserAuthenticate authenticate;

    public void init() throws ServletException {
        super.init();
        usuario = new Usuarios();
        usuarioDAOImpl = new UsuarioDAOImpl();
        authenticate = new UserAuthenticate();
        usuarios = new ArrayList<>();

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            session = request.getSession();

            if(email.equals(admEmail) && password.equals(admPassword)){
                session.setAttribute("usuario", usuario);
                response.sendRedirect("admin/home-admin.jsp");
            }else{
                usuario.setEmail(email);
                usuario.setSenha(password);

                usuarios = usuarioDAOImpl.findAll();

                var authUser = authenticate.authenticate(usuario,usuarios);
                if(authUser != null){
                    session.setAttribute("usuario", authUser);
                    response.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("loginFail", "Email ou Senha incorretos...");
                    response.sendRedirect("login.jsp");
                }
            }

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
