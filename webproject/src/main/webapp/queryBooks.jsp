<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>BOOKS</title>
</head>
<body>
    <h3>Select Query</h3>
    <form method="get" action="queryBooks.jsp">
        <p>Author</p>
        <input type="text" name="gauthor">
        <input type="submit" value="query">
    </form>
    <%  
    Class.forName("com.mysql.cj.jdbc.Driver");
	String author = request.getParameter("gauthor");
	if(author != null) {
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/universidade", "root", "martimlra");
		Statement stmt = conn.createStatement();
		
		String str = "";
		if (author.isEmpty()){
			str = "SELECT * FROM books";
		}
		else{
			str = "SELECT * FROM books WHERE author IN (";
			str += "'" + author + "'";
			str += ") AND qty > 0 ORDER BY author ASC, title ASC";
		}
		System.out.println("Query statement is" + str);
		ResultSet rset = stmt.executeQuery(str);
	
    %>

   
            <% while (rset.next()) { %>
                
            <% } %>
     

    <% 
            // Closing database resources
            rset.close();
            stmt.close();
            conn.close();
        }
    %>
</body>
</html>
