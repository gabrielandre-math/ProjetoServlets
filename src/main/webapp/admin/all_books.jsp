<%@ page import="com.service.servlet.projeto.DAO.LivroDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Livros" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 15/07/2024
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Admin: Todos os Livros</title>
    <%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<h3 class="text-center">Bem-vindo Admin!</h3>

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
        <tr>
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
</body>
</html>
