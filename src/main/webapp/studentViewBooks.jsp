<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	    HttpSession sec = request.getSession(false);
	    int studentId = (int) sec.getAttribute("id");
	%>

<h2>Available Books</h2>
	<%
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey", "root", "root");
	
	    String sql = "SELECT * FROM library WHERE Book_id NOT IN (SELECT book_id FROM book_status)";
	    PreparedStatement ps = con.prepareStatement(sql);
	    ResultSet rs = ps.executeQuery();
	
	    boolean hasBooks = false;
	    while (rs.next()) {
	        hasBooks = true;
	%>
 <form action="bookTaken.jsp" method="post">
	<p><b><%= rs.getString("Book_Name") %></b> by <%= rs.getString("Book_Auther") %></p>
	<input type="hidden" name="bookId" value="<%= rs.getInt("Book_id") %>">
	<button type="submit">Take this Book</button>
</form>
	<%
	    }
	
	    if (!hasBooks) {
	        out.println("<p>No available books. All are taken.</p>");
	    }
	
	    con.close();
	%>

	
</body>
</html>