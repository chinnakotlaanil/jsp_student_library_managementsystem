<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Book</title>
</head>
<body>

<h2>Edit Book Details</h2>

<%
    String bookId = request.getParameter("id");
    String name = "";
    String author = "";

    if (bookId != null && !"".equals(bookId)) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey", "root", "root");

            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String newName = request.getParameter("name");
                String newAuthor = request.getParameter("author");

                PreparedStatement update = con.prepareStatement("UPDATE library SET Book_Name = ?, Book_Auther = ? WHERE Book_id = ?");
                update.setString(1, newName);
                update.setString(2, newAuthor);
                update.setInt(3, Integer.parseInt(bookId));

                int result = update.executeUpdate();
                if (result > 0) {
                    out.println("<p style='color:green;'>Book updated successfully!</p>");
                } else {
                    out.println("<p style='color:red;'>Update failed.</p>");
                }
            }

            PreparedStatement ps = con.prepareStatement("SELECT * FROM library WHERE Book_id = ?");
            ps.setInt(1, Integer.parseInt(bookId));
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("Book_Name");
                author = rs.getString("Book_Auther");
            } else {
                out.println("<p style='color:red;'>Book not found!</p>");
            }

            con.close();
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    } else {
%>
        <form method="get">
            <label>Enter Book ID to Edit:</label><br>
            <input type="text" name="id" required><br><br>
            <button type="submit">Load Book</button>
        </form>
<%
        return;
    }
%>

<form method="post">
    <input type="hidden" name="id" value="<%= bookId %>">

    <label>Book Name:</label><br>
    <input type="text" name="name" value="<%= name %>" required><br><br>

    <label>Book Author:</label><br>
    <input type="text" name="author" value="<%= author %>" required><br><br>

    <button type="submit">Update Book</button>
</form>

<br><br><br>
<a href="librarianHome.jsp">Go to Home Page</a>

</body>
</html>
