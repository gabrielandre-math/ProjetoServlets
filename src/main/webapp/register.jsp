<%--
  Created by IntelliJ IDEA.
  User: luucc
  Date: 13/07/2024
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Servlet</title>
</head>
<body>
<h1>Register</h1>
<form action="register" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required />
    <br/>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required />
    <br/>
    <button type="submit">Register</button>
</form>

</body>
</html>
