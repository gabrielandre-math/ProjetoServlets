<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Todos os Pedidos</title>
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
                <th scope="col">Pedido ID</th>
                <th scope="col">Nome</th>
                <th scope="col">Email</th>
                <th scope="col">Nome do Livro</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>
                    <span class="full-name">Mark Otto</span>
                    <span class="shorten-name">Mark O.</span>
                </td>
                <td>mark.otto@example.com</td>
                <td>Livro Exemplo 1</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>
                    <span class="full-name">Jacob Thornton</span>
                    <span class="shorten-name">Jacob T.</span>
                </td>
                <td>jacob.thornton@example.com</td>
                <td>Livro Exemplo 2</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>
                    <span class="full-name">Larry the Bird</span>
                    <span class="shorten-name">Larry B.</span>
                </td>
                <td>larry.bird@example.com</td>
                <td>Livro Exemplo 3</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
<footer style="margin-top: 130px;">
    <%@include file="/all_Component/footer.jsp" %>
</footer>
</html>
