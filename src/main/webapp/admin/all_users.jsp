<%@ page import="java.util.List" %>
<%@ page import="com.service.servlet.projeto.DAO.UsuarioDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Usuarios" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Todos os Livros</title>
    <%@include file="allCss.jsp" %>

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

<table class="table table-striped">
    <thead class="bg-primary text-white">
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Nome</th>
        <th scope="col">Email</th>
        <th scope="col">Ação</th>
    </tr>
    </thead>
    <tbody>
    <%
        UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl();
        List<Usuarios> usuarios = usuarioDAO.findAll();
        for(Usuarios usuario : usuarios) {
    %>
    <tr>
        <td><%=usuario.getId()%></td>
        <td><%=usuario.getNome()%></td>
        <td><%=usuario.getEmail()%></td>
        <td><%=usuario.getSenha()%></td>

        <%
            if(usuario.getId() == 1){
        %>
        <%
            }else{
        %>
        <td>
            <a href="edit_users.jsp?id=<%=usuario.getId()%>" class="btn btn-sm btn-primary">Editar</a>
            <a href="../delete-user?id=<%=usuario.getId()%>" class="btn btn-sm btn-danger">Excluir</a>
        </td>
        <%
            }
        %>
    </tr>
    <%
        }
    %>

    </tbody>
</table>

<div class="container my-4">
</div>
</body>

</html>
