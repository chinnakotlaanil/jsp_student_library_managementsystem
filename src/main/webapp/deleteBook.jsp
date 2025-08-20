<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Book</title>
</head>
<body>

<h2>Delete Book</h2>

<%
    if (request.getMethod().equals("POST")) {
        String bookId = request.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey", "root", "root");

            PreparedStatement ps = con.prepareStatement("DELETE FROM library WHERE Book_id = ?");
            ps.setInt(1, Integer.parseInt(bookId));

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<p style='color:green;'>Book deleted successfully!</p>");
            } else {
                out.println("<p style='color:red;'>Book not found or delete failed.</p>");
            }

            con.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    }
%>

<form method="post">
    <label>Enter Book ID to Delete:</label><br>
    <input type="text" name="id" required><br><br>

    <button type="submit">Delete Book</button>
</form>

<br><br><br>
<a href="librarianHome.jsp">Go to Home Page</a>

</body>
</html>
