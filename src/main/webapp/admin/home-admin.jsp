<%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 13/07/2024
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Admin: Home</title>
    <%@include file="allCss.jsp"%>
    <style type="text/css">
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <div class="container">
        <div class="row p-5">

            <div class="col-md-3">
                <a href="add_books.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-plus-square fa-3x text-primary"></i><br/>
                            <h4>Adicionar Livro</h4>
                                ---------------
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="all_books.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-book-open fa-3x text-warning"></i><br/>
                            <h4>Todos os Livros</h4>
                                ---------------
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="orders.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-box-open fa-3x text-warning"></i><br/>
                            <h4>Pedidos</h4>
                                ---------------
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="all_users.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-user fa-3x text-primary"></i><br/>
                            <h4>Usuarios</h4>
                            ---------------
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="all_categories.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-list fa-3x text-primary"></i><br/>
                            <h4>Categorias</h4>
                            ---------------
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-md-3">
                <a href="webapp/logout.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fas fa-sign-out-alt fa-3x text-primary"></i><br/>
                            <h4>Logout</h4>
                            ---------------
                        </div>
                    </div>
                </a>
            </div>

        </div>
    </div>
    <div style="margin-top: 130px;">
        <%@include file="footer.jsp"%>
    </div>
</body>
</html>
