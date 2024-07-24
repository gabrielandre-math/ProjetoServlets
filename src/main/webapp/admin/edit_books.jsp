<%@ page import="com.service.servlet.projeto.DAO.LivroDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Livros" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <title>Adm: Editar Livro</title>
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
<%@include file="/all_Component/navbar.jsp"%>
<div class="container mt-5 container-spacing">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <div class="card fade-in" id="form-card">
                <div class="card-body">
                    <h4 class="text-center title">Editar Livro</h4>

                    <%
                        Long id = Long.parseLong(request.getParameter("id"));
                        LivroDAOImpl livroDAO = new LivroDAOImpl();
                        Livros livro = livroDAO.findById(id);
                    %>

                    <form action="../editbooks" method="post">
                        <input type="hidden" name="id" value="<%=livro.getId()%>">

                        <div class="form-group mb-3">
                            <label for="exampleInputBookName">Nome do Livro</label>
                            <input name="nomeLivro" type="text" class="form-control"
                                   id="exampleInputBookName" value="<%=livro.getNome()%>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleInputBookISBN">ISBN</label>
                            <input name="isbnLivro" type="text" class="form-control"
                                   id="exampleInputBookISBN" value="<%=livro.getIsbn()%>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="novoVelho">Estado</label>
                            <select id="novoVelho" name="novoVelho" class="form-select" required>
                                <option value="Novo" <%= "Novo".equalsIgnoreCase(livro.getNovoVelho()) ? "selected" : "" %>>Livro Novo</option>
                                <option value="Velho" <%= "Velho".equalsIgnoreCase(livro.getNovoVelho()) ? "selected" : "" %>>Livro Velho</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputState">Status</label>
                            <select id="inputState" name="status" class="form-control" required>
                                <option value="Ativo" <%= "Ativo".equals(livro.getStatus()) ? "selected" : "" %>>Ativo</option>
                                <option value="Inativo" <%= "Inativo".equals(livro.getStatus()) ? "selected" : "" %>>Inativo</option>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleInputBookQuantity">Quantidade</label>
                            <input name="qtdLivro" type="number" class="form-control"
                                   id="exampleInputBookQuantity" value="<%=livro.getQuantidade()%>" required>
                        </div>
                        <button type="submit" class="btn bg-custom text-white w-100 d-block">Atualizar</button>
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
<footer style="margin-top: 130px;">
    <%@include file="/all_Component/footer.jsp" %>
</footer>
</html>
