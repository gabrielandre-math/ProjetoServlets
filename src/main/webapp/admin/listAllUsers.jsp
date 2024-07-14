<%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 14/07/2024
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Usuários</title>
</head>
<body>
<h1>Lista de Usuários</h1>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Senha</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="usuarios" items="${usuarios}">
        <tr>
            <td>${usuarios.id}</td>
            <td>${usuarios.nome}</td>
            <td>${usuarios.email}</td>
            <td>${usuarios.senha}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>

