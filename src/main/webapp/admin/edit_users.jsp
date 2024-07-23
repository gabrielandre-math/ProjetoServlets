<%@ page import="com.service.servlet.projeto.DAO.UsuarioDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Usuarios" %>
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

    <title>Adm: Adicionar Livros</title>
    <%@include file="allCss.jsp"%>
</head>
<body>
<%@include file="/all_Component/navbar.jsp"%>
<div class="container">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Editar Usuario</h4>

                    <%
                        Long id = Long.parseLong(request.getParameter("id"));
                        UsuarioDAOImpl usuarioDAO = new UsuarioDAOImpl();
                        Usuarios usuario = usuarioDAO.findById(id);
                    %>

                    <form action="../edituser" method="post">

                        <input type="hidden" name="id" value="<%=usuario.getId()%>">

                        <div class="form-group">
                            <label for="exampleInputName">Nome do Livro</label>
                            <input name="nome" type="text" class="form-control"
                                   id="exampleInputName" value="<%=usuario.getNome()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail">Email</label>
                            <input name="email" type="text" class="form-control"
                                   id="exampleInputEmail" value="<%=usuario.getEmail()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword">ISBN</label>
                            <input name="password" type="text" class="form-control"
                                   id="exampleInputPassword" value="<%=usuario.getSenha()%>">
                        </div>

                        <button type="submit" class="btn btn-primary">Atualizar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="margin-top: 40px;">
    <%@include file="/all_Component/footer.jsp"%>
</div>
</body>
</html>