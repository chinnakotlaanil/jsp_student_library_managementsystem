<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
</head>
<body>
<%
    HttpSession sec = request.getSession(false);
    if (sec == null || sec.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String name = (String) sec.getAttribute("name");
%>

<h2>Welcome, <%= name %></h2>

<form action="displayBooks.jsp" method="get">
    <button type="submit">Display Book Details</button>
</form>

<form action="addBook.jsp" method="get">
    <button type="submit">Add Book Details</button>
</form>

<form action="editBook.jsp" method="get">
    <button type="submit">Edit Book Details</button>
</form>

<form action="deleteBook.jsp" method="get">
    <button type="submit">Delete Book Details</button>
</form>

</body>
</html>
	