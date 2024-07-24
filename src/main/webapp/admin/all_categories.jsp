<%@ page import="java.util.List" %>
<%@ page import="com.service.servlet.projeto.DAO.CategoriaDAOImpl" %>
<%@ page import="com.service.servlet.projeto.Model.Categorias" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Todas as Categorias</title>
    <%@include file="allCss.jsp" %>

    <style>
        body {
            background-color: #f7f7f7;
        }
        .table-responsive {
            margin-bottom: 80px; /* Espaçamento inferior aumentado para evitar colagem com o footer */
        }
        .table td, .table th {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
        .bg-custom {
            background-color: #6E49D7;
        }
        @media (max-width: 768px) {
            .shorten-name {
                display: block;
            }
            .full-name {
                display: none;
            }
        }
        @media (min-width: 769px) {
            .shorten-name {
                display: none;
            }
            .full-name {
                display: block;
            }
        }
    </style>
</head>
<body>
<%@include file="/all_Component/navbar.jsp" %>

<div class="container mt-5 fade-in" id="form-card">
    <div class="row justify-content-center">
        <div class="col-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center title">Todas as Categorias</h4>

                    <c:if test="${not empty sucessMsg}">
                        <h5 class="text-center text-success">${sucessMsg}</h5>
                        <c:remove var="sucessMsg" scope="session"/>
                    </c:if>

                    <c:if test="${not empty failMsg}">
                        <h5 class="text-center text-danger">${failMsg}</h5>
                        <c:remove var="failMsg" scope="session"/>
                    </c:if>

                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="bg-custom text-white">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nome</th>
                                <th scope="col">Ações</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                CategoriaDAOImpl catDAO = new CategoriaDAOImpl();
                                List<Categorias> categorias = catDAO.findAll();
                                for(Categorias categoria : categorias) {
                            %>
                            <tr>
                                <td><%=categoria.getId()%></td>
                                <td><%=categoria.getNome()%></td>
                                <td>
                                    <a href="edit_category.jsp?id=<%=categoria.getId()%>" class="btn btn-sm btn-primary">Editar</a>
                                    <a href="../delete-category?id=<%=categoria.getId()%>" class="btn btn-sm btn-danger">Excluir</a>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
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
    <%@ include file="/all_Component/footer.jsp"%>
</footer>
</html>
