<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Categorias de Livros</title>
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

<div class="container my-4">
    <h1 class="mb-4">Categorias de Livros</h1>
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead class="bg-primary text-white">
            <tr>
                <th scope="col">Categoria ID</th>
                <th scope="col">Nome</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row">1</th>
                <td>Romance</td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>Clássico</td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>Tragédia</td>
            </tr>
            <tr>
                <th scope="row">4</th>
                <td>Estratégia</td>
            </tr>
            <tr>
                <th scope="row">5</th>
                <td>Fantasia</td>
            </tr>
            <tr>
                <th scope="row">6</th>
                <td>Ficção Científica</td>
            </tr>
            <tr>
                <th scope="row">7</th>
                <td>Épico</td>
            </tr>
            <tr>
                <th scope="row">8</th>
                <td>Literatura Brasileira</td>
            </tr>
            <tr>
                <th scope="row">9</th>
                <td>Mágico Realismo</td>
            </tr>
            <tr>
                <th scope="row">10</th>
                <td>Filosofia</td>
            </tr>
            <tr>
                <th scope="row">11</th>
                <td>Política</td>
            </tr>
            <tr>
                <th scope="row">12</th>
                <td>Ficção</td>
            </tr>
            <tr>
                <th scope="row">13</th>
                <td>Alemã</td>
            </tr>
            <tr>
                <th scope="row">14</th>
                <td>Biografia</td>
            </tr>
            <tr>
                <th scope="row">15</th>
                <td>Finanças</td>
            </tr>
            <tr>
                <th scope="row">16</th>
                <td>Infantil</td>
            </tr>
            <tr>
                <th scope="row">17</th>
                <td>Suspense</td>
            </tr>
            <tr>
                <th scope="row">18</th>
                <td>Romance Brasileiro</td>
            </tr>
            <tr>
                <th scope="row">19</th>
                <td>Policial</td>
            </tr>
            <tr>
                <th scope="row">20</th>
                <td>Aventura</td>
            </tr>
            <tr>
                <th scope="row">21</th>
                <td>Ficção Cristã</td>
            </tr>
            <tr>
                <th scope="row">22</th>
                <td>Teatro</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
