<%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 15/07/2024
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                            <h4 class="text-center">Adicionar Livros</h4>
                            <form action="../AdminAddBooksServlet" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="exampleInputBookName">Nome do Livro</label>
                                    <input name="nomeLivro" type="text" class="form-control"
                                           id="exampleInputBookName">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputBookISBN">ISBN</label>
                                    <input name="isbnLivro" type="text" class="form-control"
                                           id="exampleInputBookISBN">
                                </div>
                                <div class="form-group">
                                    <label for="inputState">Categoria do Livro</label>
                                    <select id="inputState" name="categoriaLivro" class="form-control">
                                        <option selected>Selecione</option>
                                        <option value="categoria"></option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputBookQuantity">Quantidade</label>
                                    <input name="qtdLivro" type="text" class="form-control"
                                           id="exampleInputBookQuantity">
                                </div>
                                <button type="submit" class="btn btn-primary">Adicionar</button>
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
