<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Biblioteca Servlet</title>

    <%@include file="allCss.jsp" %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.css"/>
</head>
<body>
<%@ include file="navbar.jsp"%>
<style type="text/css">
    body {
        background-color: #f7f7f7;
    }
    h2 {
        margin-top: 30px;
        text-align: center;
        font-weight: bold;
    }
    .diagonal-button {
        border-radius: 5px;
    }
    .diagonal-books {
        border-radius: 20px;
    }
    .card-bg:hover {
        background-color: #fcf7f7;
    }
    .card-body img {
        max-width: 100%;
        height: auto;
    }
    .btn-group {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
    }
    .btn-group .btn {
        margin: 5px;
        flex: 1 1 auto;
        border-radius: 5px; /* Adiciona bordas arredondadas */
    }
    @media (max-width: 768px) {
        .btn-group {
            flex-direction: column;
            align-items: center;
        }
        .btn-group .btn {
            width: 100%;
        }
    }
    .el {
        opacity: 0; /* Definir a opacidade inicial como 0 */
        transform: translateX(-300px); /* Definir a posição inicial fora da viewport */
    }
</style>
<div class="container-fluid back-img">
    <h2>Sistema de Gerenciamento de Livros</h2>
</div>
<div class="container mt-4">
    <h3 class="text-center">Livros Recentes</h3>
    <div class="row basic-staggering-demo">
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center mt-1">
        <a href="" class="btn btn-dark btn-sm text-white">Ver mais</a>
    </div>
</div>

<div class="container mt-4">
    <h3 class="text-center">Livros Novos</h3>
    <div class="row basic-staggering-demo">
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-danger btn-sm diagonal-button">Adicionar</a>
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        <a href="" class="btn btn-danger btn-sm diagonal-button">199,00</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-danger btn-sm diagonal-button">Adicionar</a>
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        <a href="" class="btn btn-danger btn-sm diagonal-button">199,00</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-danger btn-sm diagonal-button">Adicionar</a>
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        <a href="" class="btn btn-danger btn-sm diagonal-button">199,00</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-danger btn-sm diagonal-button">Adicionar</a>
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        <a href="" class="btn btn-danger btn-sm diagonal-button">199,00</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center mt-1">
        <a href="" class="btn btn-dark btn-sm text-white">Ver mais</a>
    </div>
</div>

<hr>
<div class="container mt-4">
    <h3 class="text-center">Livros Antigos</h3>
    <div class="row basic-staggering-demo">
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        <a href="" class="btn btn-danger btn-sm diagonal-button">199,00</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        <a href="" class="btn btn-danger btn-sm diagonal-button">199,00</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        <a href="" class="btn btn-danger btn-sm diagonal-button">199,00</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6 col-12 mb-4 el">
            <div class="card diagonal-books card-bg">
                <div class="card-body text-center">
                    <img src="img/datastruct.png" alt="Livro sobre estrutura de dados em inglês" class="img-fluid">
                    <p>Data Structures and Algorithms</p>
                    <p>Autor: Jay Wengrow</p>
                    <p>Categoria: Algoritmos e Estrutura de Dados</p>
                    <div class="btn-group d-flex justify-content-center mt-4">
                        <a href="" class="btn btn-success btn-sm diagonal-button">Visualizar</a>
                        <a href="" class="btn btn-danger btn-sm diagonal-button">199,00</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center mt-1">
        <a href="" class="btn btn-dark btn-sm text-white">Ver mais</a>
    </div>
</div>
<hr>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
<script>
    $(document).ready(function(){
        function animateOnScroll() {
            $('.el').each(function(){
                var elementPos = $(this).offset().top;
                var topOfWindow = $(window).scrollTop();
                var windowHeight = $(window).height();
                if (elementPos < topOfWindow + windowHeight - 100) {
                    anime({
                        targets: this,
                        translateX: [300, 0],
                        opacity: [0, 1],
                        easing: 'easeOutExpo',
                        delay: anime.stagger(100) // incrementa o delay em 100ms para cada elemento
                    });
                    $(this).removeClass('el'); // Remove a classe para evitar a repetição da animação
                }
            });
        }

        // Verifica a animação na rolagem
        $(window).on('scroll', animateOnScroll);
        // Verifica a animação ao carregar a página
        animateOnScroll();
    });
</script>
</body>
<footer>
    <%@ include file="all_Component/footer.jsp"%>
</footer>
</html>
