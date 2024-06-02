<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.HashMap, java.sql.*" %>
<%
// Obter o carrinho da sessão
ArrayList<HashMap<String, String>> cart = (ArrayList<HashMap<String, String>>) session.getAttribute("cart");
String email = (String) session.getAttribute("email");
double totalPrice = 0;

if (cart != null && !cart.isEmpty() && email != null) {
    try {
        // Conectar ao banco de dados
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/agencia_viagens", "root", "");

        // Obter o ID do usuário
        PreparedStatement stmt = conn.prepareStatement("SELECT id_cliente FROM clientes	 WHERE email = ?");
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();

        int userId;
        if (rs.next()) {
            userId = rs.getInt("id_cliente");
        } else {
            // Inserir novo usuário se não existir
            stmt = conn.prepareStatement("INSERT INTO clientes (email) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, email);
            stmt.executeUpdate();
            rs = stmt.getGeneratedKeys();
            rs.next();
            userId = rs.getInt(1);
        }

        // Inserir ordem
        for (HashMap<String, String> item : cart) {
            totalPrice += Double.parseDouble(item.get("price").replaceAll("[^\\d.]", ""));
        }
        stmt = conn.prepareStatement("INSERT INTO Orders (user_id, total_price) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS);
        stmt.setInt(1, userId);
        stmt.setDouble(2, totalPrice);
        stmt.executeUpdate();
        rs = stmt.getGeneratedKeys();
        rs.next();
        int orderId = rs.getInt(1);

        // Inserir itens da ordem
        stmt = conn.prepareStatement("INSERT INTO OrderItems (order_id, product_name, product_price) VALUES (?, ?, ?)");
        for (HashMap<String, String> item : cart) {
            stmt.setInt(1, orderId);
            stmt.setString(2, item.get("name"));
            stmt.setDouble(3, Double.parseDouble(item.get("price").replaceAll("[^\\d.]", "")));
            stmt.executeUpdate();
        }

        // Limpar o carrinho após a finalização da compra
        session.setAttribute("cart", new ArrayList<HashMap<String, String>>());

        // Fechar a conexão
        conn.close();
        out.println("Compra finalizada com sucesso!");
    } catch (Exception e) {
        e.printStackTrace();	
        out.println("Erro ao finalizar a compra!");
    }
} else {
	response.sendRedirect("shop_hotel.jsp");
}
%>
