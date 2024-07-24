<%@ page import="com.service.servlet.projeto.DB.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.service.servlet.projeto.DAO.LivroDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Livros" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Biblioteca Servlet</title>

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

    <%
       Long id = Long.parseLong(request.getParameter("bid"));
       LivroDAOImpl livroDAO = new LivroDAOImpl();
       Livros livro = livroDAO.findById(id);
    %>

<div class="container mt-4">
    <div class="row basic-staggering-demo">
        <div class="col-md-6 text-center p-5 border bg-white">
            <img src="books/<%=livro.getImagem()%>" style="height: 150px; width: 100px" class="img-fluid"><br/>
            <h4 class="mt-3">Nome do livro: <span class="text-success"><%=livro.getNome()%></span></h4>
            <h4>Categoria: <span class="text-success"><%=livro.getCategoria().getNome()%></span></h4>
            <h4>Estado: <span class="text-success"><%=livro.getNovoVelho()%></span></h4>
            <%
                if("Velho".equalsIgnoreCase(livro.getNovoVelho()))
                {%>
            <h4 class="text-danger">Indisponível no momento!</h4>
            <%
                }
            %>
        </div>

        <div class="col-md-6 text-center p-5 border bg-white">
            <h2><%=livro.getNome()%></h2>

            <%
            if("Velho".equalsIgnoreCase(livro.getNovoVelho()))
            {%>
            <div class="row basic-staggering-demo">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-regular fa-star fa-2x"></i>
                    <p>Avaliações</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-regular fa-hand fa-2x"></i>
                    <p>Empréstimos</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-book fa-2x"></i>
                    <p>Qualidade</p>
                </div>

                <div class="row basic-staggering-demo text-center p-3">
                    <a href="index.jsp" class="btn btn-primary">Ver outros livros</a>
                </div>
            </div>
            <%
                }else{
            %>

            <div class="row basic-staggering-demo">
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-regular fa-star fa-2x"></i>
                    <p>Avaliações</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-regular fa-hand fa-2x"></i>
                    <p>Empréstimos</p>
                </div>
                <div class="col-md-4 text-danger text-center p-2">
                    <i class="fa-solid fa-book fa-2x"></i>
                    <p>Qualidade</p>
                </div>
            </div>
            <div class="row basic-staggering-demo text-center p-3">
                <a href="" class="btn btn-primary">Pegar emprestado</a>
            </div>
            <%
                }
            %>
    </div>
</div>
</div>

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
