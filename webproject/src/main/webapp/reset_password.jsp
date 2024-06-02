<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String message = "";
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String email = (String) session.getAttribute("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword != null && confirmPassword != null && newPassword.equals(confirmPassword)) {
            try {
                // Conecte-se ao banco de dados e atualize a senha
                Class.forName("com.mysql.cj.jdbc.Driver"); // Use o driver apropriado para o seu banco de dados
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencia_viagens", "root", "");

                String sql = "UPDATE clientes SET senha = ? WHERE email = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, newPassword);
                ps.setString(2, email);

                int rows = ps.executeUpdate();
                if (rows > 0) {
                    message = "Senha redefinida com sucesso!";
                } else {
                    message = "Erro ao redefinir a senha!";
                }

                ps.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                message = "Ocorreu um erro: " + e.getMessage();
            }
        } else {
            message = "As senhas não coincidem!";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Redefinir Senha</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h2 class="mt-5">Redefinir Senha</h2>
        <%
        if (!message.isEmpty()) {
        %>
            <div class="alert alert-info mt-3"><%= message %></div>
        <%
        }
        %>
        <a href="index.jsp" class="btn btn-primary mt-3">Voltar ao Perfil</a>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
