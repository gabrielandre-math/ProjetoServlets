<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Adm: Adicionar Livros</title>
    <%@include file="allCss.jsp"%>

    <style>
        body {
            background-color: #f7f7f7;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 0.5rem;
            box-shadow: none;
            transition: none;
        }
        .card-body {
            padding: 2rem;
        }
        .form-group label {
            font-weight: normal;
            color: #353538;
        }
        .form-group label.title {
            font-weight: bold;
            color: #353538;
        }
        .form-control, .form-select, .form-control-file {
            border-radius: 0.25rem;
        }
        .btn-primary {
            border-radius: 0.25rem;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #00408a;
        }
        .text-success, .text-danger {
            font-weight: bold;
        }
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease-out, transform 0.5s ease-out;
        }
        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
        .custom-file-upload {
            border: 1px solid #ced4da;
            display: inline-block;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 0.25rem;
            background-color: #fff;
            transition: background-color 0.3s, border-color 0.3s;
        }
        .custom-file-upload:hover {
            background-color: #f1f1f1;
            border-color: #adadad;
        }
        .custom-file-input {
            display: none;
        }
        .bg-custom {
            background-color: #6E49D7;
        }
    </style>
</head>
<body>
<%@include file="/all_Component/navbar.jsp" %>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <div class="card fade-in" id="form-card">
                <div class="card-body">
                    <h4 class="text-center title">Adicionar Livros</h4>
                    <c:if test="${not empty sucessMsg}">
                        <div class="alert alert-success text-center">
                                ${sucessMsg}
                            <c:remove var="sucessMsg" scope="session"/>
                        </div>
                    </c:if>
                    <c:if test="${not empty failMsg}">
                        <div class="alert alert-danger text-center">
                                ${failMsg}
                            <c:remove var="failMsg" scope="session"/>
                        </div>
                    </c:if>
                    <form action="../add_books" method="post" enctype="multipart/form-data">
                        <div class="form-group mb-3">
                            <label for="nomeLivro">Nome do Livro</label>
                            <input name="nomeLivro" type="text" class="form-control" id="nomeLivro" placeholder="Digite o nome do livro" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="isbnLivro">ISBN</label>
                            <input name="isbnLivro" type="text" class="form-control" id="isbnLivro" placeholder="Digite o ISBN" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="categoriaLivro">Categoria</label>
                            <select id="categoriaLivro" name="categoriaLivro" class="form-select" required>
                                <option value="" disabled selected>Selecione</option>
                                <!-- As opções de categoria -->
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
                        <div class="form-group mb-3">
                            <label for="qtdLivro">Quantidade</label>
                            <input name="qtdLivro" type="number" class="form-control" id="qtdLivro" placeholder="Digite a quantidade" min="1" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="imagemLivro">Imagem</label>
                            <label class="custom-file-upload">
                                <input type="file" name="imagemLivro" id="imagemLivro" class="custom-file-input">
                                Escolher Arquivo
                            </label>
                        </div>
                        <button type="submit" class="btn bg-custom text-white w-100 d-block">Adicionar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        setTimeout(function() {
            document.getElementById('form-card').classList.add('visible');
        }, 200);
    });
</script>
</body>
</html>
