<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Display Book Details</title>
</head>
<body>

<h2>Book Details:</h2>

	<%
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/liberey", "root", "root");

        PreparedStatement ps = con.prepareStatement("SELECT * FROM library");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int bookId = rs.getInt("Book_id");
            String bookName = rs.getString("Book_Name");
            String bookAuthor = rs.getString("Book_Auther");
	%>
    <div>
        <p><strong>Book ID:</strong> <%= bookId %></p>
        <p><strong>Book Name:</strong> <%= bookName %></p>
        <p><strong>Book Author:</strong> <%= bookAuthor %></p>

        <form action="deleteBook.jsp" method="post">
            <input type="hidden" name="bookId" value="<%= bookId %>"/>
            <button type="submit">Delete</button>
        </form>

        <form action="updateBookForm.jsp" method="post">
            <input type="hidden" name="bookId" value="<%= bookId %>"/>
            <button type="submit">Edit</button>
        </form>

    </div>
    <hr>
	<%
        }
        con.close();
	%>

<br><br><br>
<a href="librarianHome.jsp">Go to Home Page</a>

</body>
</html>
