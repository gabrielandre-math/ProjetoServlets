<%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 15/07/2024
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin: Todos os Livros</title>
    <%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<table class="table table-striped">
    <thead class="bg-primary text-white">
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Nome</th>
        <th scope="col">Categoria</th>
        <th scope="col">Quantidade</th>
        <th scope="col">Atualizar</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>
            <a href="#" class="btn btn-sm btn-primary">Editar</a>
            <a href="#" class="btn btn-sm btn-danger">Excluir</a>
        </td>
    </tr>
    <tr>
        <th scope="row">2</th>
        <td>Jacob</td>
        <td>Thornton</td>
        <td>@fat</td>
        <td>@mdo</td>
        <td>
            <a href="#" class="btn btn-sm btn-primary">Editar</a>
            <a href="#" class="btn btn-sm btn-danger">Excluir</a>
        </td>
    </tr>
    <tr>
        <th scope="row">3</th>
        <td>Larry</td>
        <td>the Bird</td>
        <td>@twitter</td>
        <td>@mdo</td>
        <td>
            <a href="#" class="btn btn-sm btn-primary">Editar</a>
            <a href="#" class="btn btn-sm btn-danger">Excluir</a>
        </td>
    </tr>
    </tbody>
</table>
</body>
</html>
