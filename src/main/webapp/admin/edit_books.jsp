<%@ page import="com.service.servlet.projeto.DAO.LivroDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Livros" %><%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 15/07/2024
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Adm: Adicionar Livros</title>
    <%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Editar Livro</h4>

                    <%
                    Long id = Long.parseLong(request.getParameter("id"));
                    LivroDAOImpl livroDAO = new LivroDAOImpl();
                    Livros livro = livroDAO.findById(id);
                    %>

                    <form action="../editbooks" method="post">

                        <input type="hidden" name="id" value="<%=livro.getId()%>">

                        <div class="form-group">
                            <label for="exampleInputBookName">Nome do Livro</label>
                            <input name="nomeLivro" type="text" class="form-control"
                                   id="exampleInputBookName" value="<%=livro.getNome()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputBookISBN">ISBN</label>
                            <input name="isbnLivro" type="text" class="form-control"
                                   id="exampleInputBookISBN" value="<%=livro.getIsbn()%>">
                        </div>

                        <div class="form-group">
                            <label for="exampleInputBookQuantity">Quantidade</label>
                            <input name="qtdLivro" type="text" class="form-control"
                                   id="exampleInputBookQuantity" value="<%=livro.getQuantidade()%>">
                        </div>
                        <button type="submit" class="btn btn-primary">Atualizar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-top: 40px;">
    <%@include file="footer.jsp"%>
</div>
</body>
</html>
