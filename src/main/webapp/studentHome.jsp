<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
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
	
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey", "root", "root");
	
	    String sql = "SELECT l.Book_id, l.Book_Name, l.Book_Auther " +
                "FROM library l " +
                "JOIN book_status b ON l.Book_id = b.book_id " +
                "WHERE b.taken_by = ?";
	    PreparedStatement ps = con.prepareStatement(sql);
	    ps.setInt(1, studentId);
	    ResultSet rs = ps.executeQuery();
	%>
	
<h2>Your Book(s):</h2>
	<%
		boolean hasBooks = false;
	    while (rs.next()) {
	        hasBooks = true;
	%>
<form action="returnBook.jsp" method="post">
	<p><b><%= rs.getString("Book_Name") %></b> by <%= rs.getString("Book_Auther") %></p>
    <input type="hidden" name="bookId" value="<%= rs.getInt("Book_id") %>">
	<button type="submit">Return Book</button>
</form>
	<%
	    }
	
	    if (!hasBooks) {
	        out.println("<p>You haven't taken any book.</p>");
	    }
	
	    con.close();
	%>
	
<h2>Welcome Student</h2>


<form action="studentViewBooks.jsp" method="get">
    <button type="submit">View Available Books</button>
</form>
</body>
</html>