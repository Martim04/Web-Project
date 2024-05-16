<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
// Recupere os parâmetros do formulário
String nome = request.getParameter("nome");
String sobrenome = request.getParameter("sobrenome");
String data_n = request.getParameter("data_n");
String email = request.getParameter("email");
String telefone = request.getParameter("telefone");
String morada = request.getParameter("morada");
String senha = request.getParameter("senha");

try {
    // Carregar a classe do driver JDBC
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Estabelecer conexão com o banco de dados
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencia_viagens", "root", "");

    // Inserir o novo cliente na tabela
    String insertQuery = "INSERT INTO clientes (nome, sobrenome, data_nasc, email, tefone, morada, senha, cargo, data_registo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, CURDATE())";
    PreparedStatement insertPs = conn.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
    insertPs.setString(1, nome);
    insertPs.setString(2, sobrenome);
    insertPs.setString(3, data_n);
    insertPs.setString(4, email);
    insertPs.setString(5, telefone);
    insertPs.setString(6, morada);
    insertPs.setString(7, senha);
    insertPs.setString(8, "Cliente");

    int rowsInserted = insertPs.executeUpdate();

    if (rowsInserted > 0) {
        ResultSet generatedKeys = insertPs.getGeneratedKeys();
        if (generatedKeys.next()) {
            int id_cliente = generatedKeys.getInt(1); // Obtém o ID gerado automaticamente
            // Faça o que precisar com o ID gerado
        }
        response.sendRedirect("logins.jsp");
    } else {
        out.println("Erro ao registrar cliente. Tente novamente.");
    }

    insertPs.close();
    conn.close();
} catch (Exception e) {
    // Exibir qualquer exceção ocorrida durante o processo
    out.println("Erro: " + e.getMessage());
}
%>