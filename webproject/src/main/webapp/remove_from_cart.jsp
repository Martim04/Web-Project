<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>

<%
	try {
	    Thread.sleep(1300); // Atraso de 3 segundos
	} catch (InterruptedException e) {
	    e.printStackTrace();
	}

    // Obtém o índice do item a ser removido
    int index = Integer.parseInt(request.getParameter("index"));
    
    // Recupera o carrinho da sessão
    ArrayList<HashMap<String, String>> cart = (ArrayList<HashMap<String, String>>) session.getAttribute("cart");
    
    // Remove o item do carrinho com base no índice
    if (cart != null && index >= 0 && index < cart.size()) {
        cart.remove(index);
    }
    
    response.sendRedirect("shop_hotel.jsp");
%>