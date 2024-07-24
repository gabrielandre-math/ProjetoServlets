<%@ page import="com.service.servlet.projeto.DAO.LivroDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Livros" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Todos os Livros</title>
    <%@include file="allCss.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.css"/>

    <style>
        /* Estilos adicionais para garantir a responsividade */
        .table td, .table th {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* Estilos específicos para dispositivos móveis */
        @media (max-width: 768px) {
            .shorten-name {
                display: block;
            }
            .full-name {
                display: none;
            }
        }
        @media (min-width: 769px) {
            .shorten-name {
                display: none;
            }
            .full-name {
                display: block;
            }
        }
        .el {
            opacity: 0; /* Definir a opacidade inicial como 0 */
            transform: translateX(-300px); /* Definir a posição inicial fora da viewport */
        }
    </style>
</head>
<body>
<%@include file="/all_Component/navbar.jsp" %>

<c:if test="${not empty sucessMsg}">
    <h5 class="text-center text-success">${sucessMsg}</h5>
    <c:remove var="sucessMsg" scope="session"/>
</c:if>

<c:if test="${not empty failMsg}">
    <h5 class="text-center text-danger">${failMsg}</h5>
    <c:remove var="failMsg" scope="session"/>
</c:if>

<div class="container">
    <table class="table table-striped">
        <thead class="bg-primary text-white">
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Imagem</th>
            <th scope="col">Nome</th>
            <th scope="col">Categoria</th>
            <th scope="col">Quantidade</th>
            <th scope="col">Ação</th>
        </tr>
        </thead>
        <tbody>
        <%
            LivroDAOImpl livroDAO = new LivroDAOImpl();
            List<Livros> livros = livroDAO.findAll();
            for(Livros livro : livros) {
        %>
        <tr class="el">
            <td><%=livro.getId()%></td>
            <td><img src="../books/<%=livro.getImagem()%>"
                     style="width: 50px; height: 50px;"></td>
            <td><%=livro.getNome()%></td>
            <td><%=livro.getCategoria().getNome()%></td>
            <td><%=livro.getQuantidade()%></td>
            <td>
                <a href="edit_books.jsp?id=<%=livro.getId()%>" class="btn btn-sm btn-primary">Editar</a>
                <a href="../delete?id=<%=livro.getId()%>" class="btn btn-sm btn-danger">Excluir</a>
            </td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
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
    <%@ include file="/all_Component/footer.jsp"%>
</footer>
</html>
