<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Todos os Livros</title>
    <%@include file="/all_Component/allCss.jsp" %>

    <style>
        /* Estilos adicionais para garantir a responsividade */
        .table td, .table th {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* Estilos específicos para dispositivos móveis */
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

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6">
            <div class="card fade-in" id="form-card">
                <div class="card-body">
                    <h4 class="text-center title">Livros do Usuário</h4>
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

                    <table class="table table-striped">
                        <thead class="bg-primary text-white">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Quantidade</th>
                            <th scope="col">Ação</th>
                        </tr>
                        </thead>
                    </table>

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

</html>
