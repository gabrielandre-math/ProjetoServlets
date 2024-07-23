<%@ page import="java.util.List" %>
<%@ page import="com.service.servlet.projeto.DAO.CategoriaDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Categorias" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Todos as Categorias</title>
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
    <h5 class="text-center text-sucess">${sucessMsg}</h5>
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
    </tr>
    </thead>
    <tbody>
    <%
        CategoriaDAOImpl catDAO = new CategoriaDAOImpl();
        List<Categorias> categorias = catDAO.findAll();
        for(Categorias categoria : categorias) {
    %>
    <tr>
        <td><%=categoria.getId()%></td>
        <td><%=categoria.getNome()%></td>
        <td>
            <a href="edit_category.jsp?id=<%=categoria.getId()%>" class="btn btn-sm btn-primary">Editar</a>
            <a href="../delete-category?id=<%=categoria.getId()%>" class="btn btn-sm btn-danger">Excluir</a>
        </td>
    </tr>
    <%
        }
    %>

    </tbody>
</table>

<%@include file="/all_Component/navbar.jsp" %>

<div class="container my-4">
</div>
</body>

</html>
