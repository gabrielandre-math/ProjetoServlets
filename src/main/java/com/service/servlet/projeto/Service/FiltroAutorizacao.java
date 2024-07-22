package com.service.servlet.projeto.Service;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class FiltroAutorizacao implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        // Obtém o papel do usuário da sessão
        String role = (session != null) ? (String) session.getAttribute("userRole") : null;

        // URL solicitada
        String requestURI = httpRequest.getRequestURI();

        // Verifica se o usuário é administrador ou se está acessando páginas permitidas
        if (role != null && role.equals("admin")) {
            chain.doFilter(request, response); // Admin tem acesso total
        } else if (isUserPageAllowed(requestURI, role)) {
            chain.doFilter(request, response); // Páginas permitidas para usuários comuns
        } else {
            httpResponse.sendError(HttpServletResponse.SC_NOT_FOUND); // Retorna erro 404
        }
    }

    // Verifica se a página solicitada é permitida para usuários comuns
    private boolean isUserPageAllowed(String requestURI, String role) {
        // Lista de URLs permitidas para usuários comuns
        return requestURI.contains("/home.jsp") || requestURI.contains("/index.jsp") ||
                requestURI.contains("/my_books_user.jsp") || requestURI.contains("/orders_user.jsp") ||
                requestURI.contains("/logout.jsp") || requestURI.contains("/add_books_user.jsp") ||
                requestURI.contains("/login.jsp") || requestURI.contains("/register.jsp") ||
                requestURI.contains("/login") || requestURI.contains("/register") || requestURI.contains("/logout");
    }
}
