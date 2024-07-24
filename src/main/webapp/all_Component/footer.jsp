<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
    try {
        // Verifica se a sessão já existe
        HttpSession currentSession = request.getSession(false);
        System.out.println("Sessão atual: " + currentSession);

        // Se a sessão não existir, cria uma nova e define 'loggedIn' como false
        if (currentSession == null) {
            currentSession = request.getSession(true);
            currentSession.setAttribute("loggedIn", false);
            System.out.println("Nova sessao criada. loggedIn definido como false");
        }

        // Obtém o valor do atributo 'loggedIn'
        Boolean loggedIn = (Boolean) currentSession.getAttribute("loggedIn");
        System.out.println("Valor de loggedIn: " + loggedIn);

        // Se 'loggedIn' for nulo, define como false
        if (loggedIn == null) {
            loggedIn = false;
            currentSession.setAttribute("loggedIn", loggedIn);
            System.out.println("loggedIn era nulo. Definido como false");
        }

        // Define o atributo 'loggedIn' na requisição
        request.setAttribute("loggedIn", loggedIn);
        System.out.println("loggedIn definido na requisição: " + loggedIn);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<footer>
    <div class="container text-center py-4">
        <div class="footer-logo mb-3">
            <a class="navbar-brand font-style ms-2" id="main-logo" href="#">
                ServletBook <i class="bi bi-layers-fill"></i>
            </a>
        </div>
        <div class="footer-pages mb-3">
            <h4>Páginas</h4>
            <ul class="footer-links list-unstyled">
                <li><a href="../index.jsp">Início</a></li>
                <c:choose>
                    <c:when test="${loggedIn == false}">
                    <li><a href="../login.jsp">Login</a></li>
                    <li><a href="../register.jsp">Cadastro</a></li>
                    </c:when>
                </c:choose>
            </ul>
        </div>
        <div class="footer-bottom">
            Este é um projeto desenvolvido por alunos da UFN 7ª Academia Java Atos
        </div>
    </div>
</footer>

<style>

    footer {
        background-color: #6E49D7;
        color: white;
        padding: 15px 0;
        text-align: center;
    }
    .footer-logo {
        font-size: 24px;
        font-weight: bold;
    }
    .footer-logo a {
        color: white;
        transition: color 0.3s ease;
    }
    .footer-logo a:hover {
        color: black;
    }
    .footer-pages h4 {
        margin-bottom: 10px;
    }
    .footer-links {
        list-style: none;
        padding: 0;
        margin: 10px 0;
    }
    .footer-links li {
        margin: 5px 0;
    }
    .footer-links a {
        color: white;
        text-decoration: none;
        transition: opacity 1s ease;
    }
    .footer-links a:hover {
        color: #dcdcdc;
    }
    .footer-bottom {
        margin-top: 20px;
        font-size: 14px;
    }
</style>
