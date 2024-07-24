<%@ page import="com.service.servlet.projeto.DAO.LivroDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Livros" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 22/07/2024
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Todos: Livros recentes</title>
    <%@include file="all_Component/allCss.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.css"/>
</head>
<body>
<%@ include file="all_Component/navbar.jsp"%>
<style type="text/css">
    body {
        background-color: #f7f7f7;
    }
    h2 {
        margin-top: 30px;
        text-align: center;
        font-weight: bold;
    }
    .diagonal-button {
        border-radius: 5px;
    }
    .diagonal-books {
        border-radius: 20px;
    }
    .card-bg:hover {
        background-color: #fcf7f7;
    }
    .card-body img {
        max-width: 100%;
        height: auto;
    }
    .btn-group {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }
    .btn-group .btn {
        margin: 5px;
        flex: 1 1 auto;
        border-radius: 5px; /* Adiciona bordas arredondadas */
    }
    @media (max-width: 768px) {
        .btn-group {
            flex-direction: column;
            align-items: center;
        }
        .btn-group .btn {
            width: 100%;
        }
    }
    .el {
        opacity: 0; /* Definir a opacidade inicial como 0 */
        transform: translateX(-300px); /* Definir a posição inicial fora da viewport */
    }
</style>

<div class="container mt-4">
    <div class="row basic-staggering-demo">
            <%
                LivroDAOImpl livroDAO = new LivroDAOImpl();
                List<Livros> livros = livroDAO.getAllOldBooks();
                for (Livros livro : livros) {
            %>
            <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
                <div class="card diagonal-books card-bg">
                    <div class="card-body text-center">
                        <img src="books/<%=livro.getImagem()%>" alt="<%=livro.getImagem()%>" style="width: 100px; height: 150px;" class="img-thumblin">
                        <p><%=livro.getNome()%></p>
                        <p>Categoria: <%=livro.getCategoria().getNome()%></p>
                        <div class="btn-group d-flex justify-content-center mt-4">
                            <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
</div>
<hr>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
<script>
    $(document).ready(function(){
        function animateOnScroll() {
            $('.el').each(function(){
                var elementPos = $(this).offset().top;
                var topOfWindow = $(window).scrollTop();
                var windowHeight = $(window).height();
                if (elementPos < topOfWindow + windowHeight - 100) {
                    anime({
                        targets: this,
                        translateX: [300, 0],
                        opacity: [0, 1],
                        easing: 'easeOutExpo',
                        delay: anime.stagger(100) // incrementa o delay em 100ms para cada elemento
                    });
                    $(this).removeClass('el'); // Remove a classe para evitar a repetição da animação
                }
            });
        }

        // Verifica a animação na rolagem
        $(window).on('scroll', animateOnScroll);
        // Verifica a animação ao carregar a página
        animateOnScroll();
    });
</script>
</body>
<footer style="margin-top: 130px;">
    <%@include file="/all_Component/footer.jsp" %>
</footer>
</html>
