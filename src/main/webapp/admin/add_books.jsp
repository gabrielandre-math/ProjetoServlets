<%--
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
                            <h4 class="text-center">Adicionar Livros</h4>

                            <c:if test="${not empty sucessMsg}">
                                <h5 class="text-center text-sucess">${sucessMsg}</h5>
                                <c:remove var="sucessMsg" scope="session"/>
                            </c:if>

                            <c:if test="${not empty failMsg}">
                                <h5 class="text-center text-danger">${failMsg}</h5>
                                <c:remove var="failMsg" scope="session"/>
                            </c:if>

                            <form action="../add_books" method="post" enctype="multipart/form-data">

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
                                    <label for="inputState">Categoria</label>
                                    <select id="inputState" name="categoriaLivro" class="form-control">
                                        <option selected>Selecione</option>
                                        <option value="1">Romance</option>
                                        <option value="2">Clássico</option>
                                        <option value="3">Tragédia</option>
                                        <option value="4">Estratégia</option>
                                        <option value="5">Fantasia</option>
                                        <option value="6">Ficção Científica</option>
                                        <option value="7">Épico</option>
                                        <option value="8">Literatura Brasileira</option>
                                        <option value="9">Mágico Realismo</option>
                                        <option value="10">Filosofia</option>
                                        <option value="11">Política</option>
                                        <option value="12">Ficção</option>
                                        <option value="13">Alemã</option>
                                        <option value="14">Biografia</option>
                                        <option value="15">Finanças</option>
                                        <option value="16">Infantil</option>
                                        <option value="17">Suspense</option>
                                        <option value="18">Romance Brasileiro</option>
                                        <option value="19">Policial</option>
                                        <option value="20">Aventura</option>
                                        <option value="21">Ficção Cristã</option>
                                        <option value="22">Teatro</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputBookQuantity">Quantidade</label>
                                    <input name="qtdLivro" type="text" class="form-control"
                                           id="exampleInputBookQuantity">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlFile1">Imagem</label>
                                    <input name="imagemLivro" type="file" class="form-control-file"
                                           id="exampleFormControlFile1">
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
