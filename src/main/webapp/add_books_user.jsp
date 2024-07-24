<%@ page import="com.service.servlet.projeto.DAO.LivroDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Livros" %>
<%@ page import="com.service.servlet.projeto.Model.Usuarios" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Adicionar Livros</title>
    <%@ include file="all_Component/allCss.jsp" %>

    <style>
        /* Seus estilos */
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
<%@ include file="/all_Component/navbar.jsp" %>
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

                    <%-- Lista todos os livros disponíveis --%>
                    <%
                        LivroDAOImpl livroDAO = new LivroDAOImpl();
                        List<Livros> livros = livroDAO.findAll();
                    %>
                    <form action="../add_books_user" method="post">
                        <input type="hidden" name="userId" value="${usuario.id}">
                        <div class="form-group mb-3">
                            <label for="livroSelecionado">Selecione um Livro</label>
                            <select name="livroId" id="livroSelecionado" class="form-select" required>
                                <%
                                    for(Livros livro : livros){
                                %>
                                <option value="<%=livro.getId()%>"><%=livro.getNome()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group mb-3">
                            <label for="qtdLivro">Quantidade</label>
                            <input name="qtdLivro" type="number" class="form-control" id="qtdLivro" value="1" min="1" required>
                        </div>
                        <button type="submit" class="btn bg-custom text-white w-100 d-block">Adicionar Livro</button>
                    </form>

                    <script>
                        document.addEventListener("DOMContentLoaded", function() {
                            setTimeout(function() {
                                document.getElementById('form-card').classList.add('visible');
                            }, 200);
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<footer style="margin-top: 130px;">
    <%@include file="/all_Component/footer.jsp" %>
</footer>
</html>
