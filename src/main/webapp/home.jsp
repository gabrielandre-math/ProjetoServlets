<%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 13/07/2024
  Time: 13:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Página Inicial</title>
</head>
<body>
<h1><%= "Welcome!" %>
</h1>
<c:if test="${not empty usuario}">
    <h1>Name: ${usuario.nome}</h1>
    <h1>E-mail: ${usuario.email}</h1>
</c:if>
<br/>
</body>
</html>
