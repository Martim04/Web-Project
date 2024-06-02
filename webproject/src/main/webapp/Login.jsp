<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
<%
String email = request.getParameter("email");
String senha = request.getParameter("senha");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Agencia_viagens", "root", "");
    String query = "SELECT * FROM clientes WHERE email=? AND senha=?";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, email);
    ps.setString(2, senha);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        // Login successful
        String nome = rs.getString("nome"); // Obtenha o nome do resultado do conjunto
        session.setAttribute("nome", nome); // Armazene o nome na sessão
        String emailshow = rs.getString("email"); // Obtenha o nome do resultado do conjunto
        session.setAttribute("email", emailshow); // Armazene o nome na sessão
        rs.close();
        ps.close();
        conn.close();
        response.sendRedirect("index.jsp"); // Redireciona para a página de boas-vindas
    }else {
        // Login failed due to invalid credentials
        rs.close();
        ps.close();
        conn.close();
        response.sendRedirect("logins.jsp?error=1"); // Redireciona de volta para a página de login com um erro
    }

} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
</body>
</html>