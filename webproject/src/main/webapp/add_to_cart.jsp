<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.io.*" %>

<%
    try {
        Thread.sleep(1300); // Atraso de 3 segundos
    } catch (InterruptedException e) {
        e.printStackTrace();
    }

    // Recupera ou cria o carrinho na sessão
    ArrayList<HashMap<String, String>> cart = (ArrayList<HashMap<String, String>>) session.getAttribute("cart");
    if (cart == null) {
        cart = new ArrayList<HashMap<String, String>>();
        session.setAttribute("cart", cart);
    }
    
    // Obtém os parâmetros do formulário
    String productName = request.getParameter("product_name");
    String productPrice = request.getParameter("product_price");
    
    // Cria um novo item para adicionar ao carrinho
    HashMap<String, String> item = new HashMap<String, String>();
    item.put("name", productName);
    item.put("price", productPrice);
    
    // Adiciona o item ao carrinho
    cart.add(item);
    
    response.sendRedirect("shop_hotel.jsp");
%>
