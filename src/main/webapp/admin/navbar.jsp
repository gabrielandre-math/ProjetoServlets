
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&family=M+PLUS+Rounded+1c:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nunito', 'M PLUS Rounded 1c', sans-serif;
        }
        .font-style {
            font-weight: bold;
        }
        .search-bar {
            width: 100%;
        }
        @media (min-width: 768px) {
            .search-bar {
                width: 300px;
            }
        }
        .bg-custom {
            background-color: #6E49D7;
            color: white;
        }
        .bg-custom:hover {
            background-color: #5939a7;
            color: white;
        }
        .nav-link {
            padding-left: 20px;
            transition: color 1.0s ease; /* Transição suave de cor */
        }
        .nav-link:hover {
            color: rgba(255, 255, 255, 0.8); /* Cor ao passar o mouse */
        }
        .icon {
            margin-right: 4px;
        }
        .content {
            margin-right: 6px;
        }
        .navbar-brand {
            color: #6E49D7;
            transition: opacity 1s ease; /* Transição suave de opacidade */
        }
        .navbar-brand.hidden {
            opacity: 0;
        }
        .navbar-brand.visible {
            opacity: 1;
            color: white; /* Cor do logo no segundo navbar */
        }
        @media (max-width: 767.98px) {
            .nav-item-spacer {
                display: block;
                height: 4px;
                width: 100%;
            }
        }
        .diagonal-2 {
            border-radius: 20px;
            margin-right: 6px;
            margin-left: 6px;
        }
        .diagonal-1 {
            margin-right: 6px;
            margin-left: 6px;
        }
    </style>
</head>
<body>
<!-- Navbar 1 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light diagonal-1" id="navbar1">
    <div class="container-fluid">
        <a class="navbar-brand font-style ms-2" id="main-logo" href="home-admin.jsp">
            ServletBook <i class="bi bi-layers-fill"></i>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <form class="d-flex mx-auto my-2 my-lg-0">
                <input class="form-control me-2 search-bar" type="search" placeholder="Buscar livro" aria-label="Buscar livro">
                <button class="btn bg-custom text-white" type="submit">Buscar</button>
            </form>
            <div class="navbar-nav ms-auto d-flex">
                <a class="btn bg-custom text-white me-2 mb-2 mb-lg-0" href="login.jsp">Entrar</a>
                <a class="btn btn-primary text-white me-2 mb-lg-0" href="register.jsp">Registrar</a>
            </div>
        </div>
    </div>
</nav>
<!-- Navbar 2 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-custom mt-3 sticky-top diagonal-2" id="navbar2">
    <div class="container-fluid d-flex align-items-center">
        <a class="navbar-brand font-style hidden ms-2" id="secondary-logo" href="#">
            ServletBook <i class="bi bi-layers-fill"></i>
        </a>
        <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item nav-item-spacer">
                    <div></div>
                </li>
                <li class="nav-item content">
                    <a class="nav-link active" aria-current="page" href="home-admin.jsp"><i class="fas fa-home icon"></i>Inicio</a>
                </li>
                <li class="nav-item content">
                    <a class="nav-link" href="add_books.jsp"><i class="fas fa-add icon"></i>Novo Livro</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script>
    $(document).ready(function() {
        var mainLogo = $('#main-logo');
        var secondaryLogo = $('#secondary-logo');
        var navbar1 = $('#navbar1');

        $(window).scroll(function() {
            var navbar1Height = navbar1.outerHeight();
            if ($(this).scrollTop() > navbar1Height) {
                mainLogo.addClass('hidden');
                secondaryLogo.removeClass('hidden').addClass('visible');
            } else {
                mainLogo.removeClass('hidden');
                secondaryLogo.removeClass('visible').addClass('hidden');
            }
        });
    });
</script>
</body>
</html>
