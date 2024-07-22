<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Todos os Usuários</title>
    <%@include file="allCss.jsp" %>
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
<div class="container my-4">
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead class="bg-primary text-white">
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Email</th>
                <th scope="col">Data de Registro</th>
                <th scope="col">Ações</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>
                    <span class="full-name">João Silva</span>
                    <span class="shorten-name">João S.</span>
                </td>
                <td>joao.silva@example.com</td>
                <td>2023-01-15</td>
                <td>
                    <a href="#" class="btn btn-sm btn-primary">Editar</a>
                    <a href="#" class="btn btn-sm btn-danger">Excluir</a>
                </td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>
                    <span class="full-name">Maria Oliveira</span>
                    <span class="shorten-name">Maria O.</span>
                </td>
                <td>maria.oliveira@example.com</td>
                <td>2023-02-20</td>
                <td>
                    <a href="#" class="btn btn-sm btn-primary">Editar</a>
                    <a href="#" class="btn btn-sm btn-danger">Excluir</a>
                </td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>
                    <span class="full-name">Carlos Pereira</span>
                    <span class="shorten-name">Carlos P.</span>
                </td>
                <td>carlos.pereira@example.com</td>
                <td>2023-03-05</td>
                <td>
                    <a href="#" class="btn btn-sm btn-primary">Editar</a>
                    <a href="#" class="btn btn-sm btn-danger">Excluir</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>

</html>
