<%@ page language="java"  pageEncoding="UTF-8"%>

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
                <li><a href="index.jsp">Início</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Cadastro</a></li>
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
