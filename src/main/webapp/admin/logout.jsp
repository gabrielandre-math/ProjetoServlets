<%
    // Invalida a sessão atual
    HttpSession currentSession = request.getSession(false);
    if (currentSession != null) {
        currentSession.invalidate();
    }
    // Redireciona para a página inicial ou de login
    response.sendRedirect("../login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
</head>
<body>
<p>Você foi deslogado com sucesso. Redirecionando...</p>
</body>
</html>