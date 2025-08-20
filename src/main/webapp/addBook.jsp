<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
</head>
<body>

<h2>Add Book Details</h2>

<%
    if (request.getMethod().equals("POST")) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String author = request.getParameter("author");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey", "root", "root");

            PreparedStatement ps = con.prepareStatement("INSERT INTO library (Book_id,Book_Name, Book_Auther) VALUES (?,?, ?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, author);

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<p style='color:green;'>Book added successfully!</p>");
            } else {
                out.println("<p style='color:red;'>Failed to add book.</p>");
            }

            con.close();
        
    }
%>

<form method="post">
	<label>Book Id:</label><br>
    <input type="number" name="id" required><br><br>
    
    <label>Book Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Book Author:</label><br>
    <input type="text" name="author" required><br><br>

    <button type="submit">Add Book</button>
</form> 
<br><br><br>
<a href="librarianHome.jsp">Go to Home Page</a>

</body>
</html>
