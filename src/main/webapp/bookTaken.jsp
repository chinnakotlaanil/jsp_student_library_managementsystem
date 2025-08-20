<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    int bookId = Integer.parseInt(request.getParameter("bookId"));
    HttpSession sec = request.getSession(false);
    int studentId = (int) sec.getAttribute("id");
    String studentName = (String) sec.getAttribute("name");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey", "root", "root");

    PreparedStatement ps = con.prepareStatement("INSERT INTO book_status (book_id, taken_by, by_name) VALUES (?, ?, ?)");
    ps.setInt(1, bookId);
    ps.setInt(2, studentId);
    ps.setString(3, studentName);
    ps.executeUpdate();
    con.close();
%>
<h3>Book taken successfully!</h3>
<a href="studentHome.jsp">Back to Home</a>

	
</body>
</html>