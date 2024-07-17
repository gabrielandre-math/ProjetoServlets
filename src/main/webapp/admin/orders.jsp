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
    <title>Admin: Todos os Pedidos</title>
    <%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<table class="table table-striped">
    <thead class="bg-primary text-white">
    <tr>
        <th scope="col">Pedido ID</th>
        <th scope="col">Nome</th>
        <th scope="col">Email</th>
        <th scope="col">Nome do Livro</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
    </tr>
    <tr>
        <th scope="row">2</th>
        <td>Jacob</td>
        <td>Thornton</td>
        <td>@fat</td>
    </tr>
    <tr>
        <th scope="row">3</th>
        <td>Larry</td>
        <td>the Bird</td>
        <td>@twitter</td>
    </tr>
    </tbody>
</table>
<div style="margin-top: 130px;">
    <%@include file="footer.jsp"%>
</div>
</body>
</html>
