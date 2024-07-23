<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Admin: Home</title>
    <%@include file="all_Component/allCss.jsp"%>
    <style type="text/css">
        body {
            background-color: #f7f7f7;
        }
        a {
            text-decoration: none;
            color: black;
        }
        a:hover {
            text-decoration: none;
            color: black;
        }
        .card-body i {
            font-size: 2rem; /* Reduzindo o tamanho dos ícones */
        }
        .card {
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
    </style>

</head>
<body>
<%@include file="/all_Component/navbar.jsp"%>
<div class="container">
    <div class="row p-5">
        <!-- Usando col-12 col-md-6 col-lg-4 para responsividade -->
        <div class="col-12 col-md-6 col-lg-4 mb-4">
            <a href="add_books_user.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-plus-square text-primary"></i><br/>
                        <h4>Pegar livro emprestado</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-12 col-md-6 col-lg-4 mb-4">
            <a href="my_books_user.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-book-open text-warning"></i><br/>
                        <h4>Meus Livros</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-12 col-md-6 col-lg-4 mb-4">
            <a href="logout.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <i class="fas fa-sign-out-alt text-primary"></i><br/>
                        <h4>Logout</h4>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
<div style="margin-top: 130px;">
    <%@include file="/all_Component/footer.jsp"%>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.card');
        cards.forEach(card => {
            card.addEventListener('mouseover', () => {
                anime({
                    targets: card,
                    scale: 1.0,
                    duration: 150,
                    easing: 'easeInOutQuad'
                });
            });
            card.addEventListener('mouseout', () => {
                anime({
                    targets: card,
                    scale: 1,
                    duration: 300,
                    easing: 'easeInOutQuad'
                });
            });
        });
    });
</script>
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

