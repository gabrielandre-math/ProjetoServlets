<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <title>Página de Registro</title>
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
<div class="container mb-5 p-4"> <!-- Adicionado mb-5 para margem inferior -->
    <div class="row">
        <div class="col-md-4 offset-md-4 fade-in" id="register-card">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center mb-4">Registrar</h4>

                    <c:if test="${not empty sucessMsg}">
                        <p class="text-center text-sucess">${sucessMsg}</p>
                        <c:remove var="sucessMsg" scope="session"/>
                    </c:if>
                    <c:if test="${not empty failRegister}">
                        <p class="text-center text-danger">${failRegister}</p>
                        <c:remove var="failRegister" scope="session"/>
                    </c:if>
                    <c:if test="${not empty existUserMsg}">
                        <p class="text-center text-danger">${existUserMsg}</p>
                        <c:remove var="existUserMsg" scope="session"/>
                    </c:if>

                    <form action="register" method="post">
                        <div class="form-group mb-3">
                            <label for="exampleInputName1" class="form-label">Nome</label>
                            <input type="text" class="form-control" id="exampleInputName1" required="required" name="uname">
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleInputEmail1" class="form-label">E-mail</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
                        </div>
                        <div class="form-group mb-3">
                            <label for="exampleInputPassword1" class="form-label">Senha</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
                        </div>
                        <div class="form-group form-check mb-4">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" required="required" name="check">
                            <label class="form-check-label" for="exampleCheck1">Li e concordo com os termos de serviço.</label>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn bg-custom">Enviar</button>
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
            $('#register-card').addClass('visible');
        }, 200); // 200ms delay before starting the animation
    });
</script>
<footer>
    <%@ include file="all_Component/footer.jsp"%>
</footer>
</body>
</html>
