package com.service.servlet.projeto.Util;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class FiltroAutorizacao implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialização do filtro, se necessário
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        String role = (session != null) ? (String) session.getAttribute("userRole") : null;

        String requestURI = httpRequest.getRequestURI();

        // Verifica se o usuário é administrador ou se está acessando páginas permitidas
        if (isPublicPage(requestURI)) {
            chain.doFilter(request, response);
        } else if (role != null && role.equals("admin")) {
            chain.doFilter(request, response);
        } else if (role != null && role.equals("user") && isUserPageAllowed(requestURI)) {
            chain.doFilter(request, response);
        } else {
            httpResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    public void destroy() {
        // Destruição do filtro, se necessário
    }

    private boolean isPublicPage(String requestURI) {
        return requestURI.contains("/index.jsp") || requestURI.contains("/login.jsp") ||
                requestURI.contains("/register.jsp") || requestURI.contains("/login") ||
                requestURI.contains("/register") || requestURI.contains("/all_new_books.jsp") ||
                requestURI.contains("/all_recent_books.jsp") || requestURI.contains("/all_old_books.jsp") ||
                requestURI.contains("/view_books.jsp");
    }

    private boolean isUserPageAllowed(String requestURI) {
        // Lista de URLs permitidas para usuários comuns
        return requestURI.contains("/home.jsp") || requestURI.contains("/my_books_user.jsp") ||
                requestURI.contains("/orders_user.jsp") || requestURI.contains("/logout.jsp") ||
                requestURI.contains("/add_books_user.jsp");
    }
}
