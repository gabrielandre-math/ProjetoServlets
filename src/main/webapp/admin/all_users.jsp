<%@ page import="java.util.List" %>
<%@ page import="com.service.servlet.projeto.Database.DAO.UsuarioDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Database.Model.Usuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Todos os Usuários</title>
    <%@include file="allCss.jsp" %>
    <style>
        /* Estilos mobile-first */
        .table td, .table th {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .shorten-name {
            display: block;
        }
        .full-name {
            display: none;
        }

        /* Estilos para dispositivos maiores */
        @media (min-width: 769px) {
            .shorten-name {
                display: none;
            }
            .full-name {
                display: block;
            }
        }

        /* Estilos específicos para a tabela */
        .table-responsive {
            overflow-x: auto;
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

<div class="container mt-4">
    <h3 class="text-center">Todos os Usuários</h3>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead class="bg-primary text-white">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Email</th>
                <th scope="col">Senha</th>
                <th scope="col">Ação</th>
            </tr>
            </thead>
            <tbody>
            <%
                UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl();
                List<Usuarios> usuarios = usuarioDAO.findAll();
                for (Usuarios usuario : usuarios) {
            %>
            <c:set var="usuarioAtual" value="<%=usuario%>" />
            <tr class="el">
                <td><%=usuario.getId()%></td>
                <td><%=usuario.getNome()%></td>
                <td><%=usuario.getEmail()%></td>
                <td>
                    <c:choose>
                        <c:when test="${usuarioAtual.id == 1}">
                            ********
                        </c:when>
                        <c:otherwise>
                            <%=usuario.getSenha()%>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>

                    <a href="edit_users.jsp?id=<%=usuario.getId()%>" class="btn btn-sm btn-primary">Editar</a>
                    <a href="../delete-user?id=<%=usuario.getId()%>" class="btn btn-sm btn-danger">Excluir</a>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
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
