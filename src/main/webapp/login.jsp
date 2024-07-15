<%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 13/07/2024
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <%@include file="all_Component/allCss.jsp" %>
</head>
<body style="background-color: #f0f1f2">
<%@include file="all_Component/navbar.jsp" %>
<div class="container">
    <div class="row mt-2">
        <div class="col-md-4 offset-md-4">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center">Login</h3>
                    <form>
                        <h4 class="text-center">Login</h4>
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email</label>
                            <input type="email" class="form-control" id="exampleInputEmail1"
                                   aria-describedby="emailHelp" required="required">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" required="required">
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Login</button><br/>
                            <a href="register.jsp">Criar uma conta</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
