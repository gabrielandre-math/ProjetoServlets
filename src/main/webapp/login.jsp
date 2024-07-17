<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <%@include file="all_Component/allCss.jsp" %>
    <style>
        .fade-in {
            opacity: 0;
            transform: translateY(20px);
            transition: opacity 0.5s ease-out, transform 0.5s ease-out;
        }

        .fade-in.visible {
            opacity: 1;
            transform: translateY(0);
        }
    </style>
</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_Component/navbar.jsp" %>
<div class="container mb-5"> <!-- Adicionado mb-5 para margem inferior -->
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4 fade-in" id="login-card">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center mb-4">Login</h3>

                    <c:if test="${not empty loginFail}">
                        <h5 class="text-center text-danger">${loginFail}</h5>
                        <c:remove var="loginFail" scope="session"/>
                    </c:if>

                    <form action="login" method="post">
                        <div class="form-group mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
                        </div>
                        <div class="form-group mb-4">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn bg-custom text-white">Login</button>
                            <a href="register.jsp" class="btn btn-link">Criar uma conta</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script>
    $(document).ready(function() {
        setTimeout(function() {
            $('#login-card').addClass('visible');
        }, 200); // 200ms delay before starting the animation
    });
</script>
<footer>
    <%@ include file="all_Component/footer.jsp"%>
</footer>
</body>
</html>
