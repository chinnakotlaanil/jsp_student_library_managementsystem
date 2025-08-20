<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   	<%@ page import="java.sql.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    int bookId = Integer.parseInt(request.getParameter("bookId"));
	
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey", "root", "root");
	
	    PreparedStatement ps = con.prepareStatement("DELETE FROM book_status WHERE book_id = ?");
	    ps.setInt(1, bookId);
	    ps.executeUpdate();
	
	    con.close();
	%>
<h3>Book returned successfully!</h3>
<a href="studentHome.jsp">Back to Home</a>
	
</body>
</html>