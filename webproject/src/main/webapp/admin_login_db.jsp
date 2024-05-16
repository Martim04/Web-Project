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
String nome = request.getParameter("nome");
String senha = request.getParameter("senha");

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Agencia_viagens", "root", "");
    String query = "SELECT * FROM clientes WHERE nome=? AND senha=? AND cargo='admin'";
    PreparedStatement ps = conn.prepareStatement(query);
    ps.setString(1, nome);
    ps.setString(2, senha);
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
        // Login successful
        session.setAttribute("nome", nome);
        rs.close();
        ps.close();
        conn.close();
        response.sendRedirect("admin_page.jsp"); // Redireciona para a página de boas-vindas
    } else {
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
