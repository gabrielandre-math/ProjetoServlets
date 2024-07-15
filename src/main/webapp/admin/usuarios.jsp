<%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 14/07/2024
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Usuarios</title>
</head>
<body>
<h1>Lista de Usuarios</h1>
<a href="usuario?action=new">Novo Usuario</a>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Nome</th>
        <th>Email</th>
        <th>Admin</th>
        <th>Ações</th>
    </tr>
    <c:forEach var="usuario" items="${listUsuarios}">
        <tr>
            <td>${usuario.id}</td>
            <td>${usuario.nome}</td>
            <td>${usuario.email}</td>
            <td>${usuario.admin}</td>
            <td>
                <a href="usuario?action=edit&id=${usuario.id}">Editar</a>
                <a href="usuario?action=delete&id=${usuario.id}">Deletar</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

