<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style >
fieldset{  width:300px;
  margin-left: 500px;
  border-radius: 20px;
   background:white;
  text-align: center;
 }
 body{ background:orange;
 }
</style>
</head>
<body>
	<%
		String errorEmail = (String) session.getAttribute("errorEmail");
	   	String errorPassword = (String) session.getAttribute("errorPassword");
	   	String email = request.getParameter("email");
	   	String password = request.getParameter("password");
	   
	  	if (request.getMethod().equals("POST") && email != null && password != null) {
	  		Class.forName("com.mysql.cj.jdbc.Driver");
	       	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey", "root", "root");
	       	PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM librarian WHERE librarian_Email = ?");
	       
	       	pstmt.setString(1, email);
	       
	       	ResultSet resultSet = pstmt.executeQuery();
	       	if (resultSet.next()) {
	       		String dbPassword = resultSet.getString("librarian_password");
	           	if (dbPassword.equals(password)) {
	           		session.setAttribute("email", email);
	               	session.setAttribute("password", password);
	               	session.setAttribute("id", resultSet.getInt("librarian_id"));
	               	session.setAttribute("name", resultSet.getString("librarian_name"));
	               	conn.close();
	               
	               	RequestDispatcher dispatcher = request.getRequestDispatcher("librarianHome.jsp");
	               	dispatcher.forward(request, response);
	           	} else {
	               	session.setAttribute("errorPassword", "Wrong password");
	               	response.sendRedirect("librarianlogin.jsp");
	           	}
			} else {
	       		session.setAttribute("errorEmail", "Wrong Email");
				response.sendRedirect("librarianlogin.jsp");
	        }
		}
	%>
<fieldset>
<legend></legend>
<h2>Librarian Login</h2>
<form action="librarianlogin.jsp" method="post">
	<% 
    	if (errorEmail != null) { 
       		out.println("<h4 style='color:red;'>" + errorEmail + "</h4>");
            session.removeAttribute("errorEmail");
        } 
    %>
	Email: <input type="email" name="email" value="hello@gmail.com"><br><br>
	<% 
		if (errorPassword != null) { 
	        out.println("<h4 style='color:red;'>" + errorPassword + "</h4>");
	        session.removeAttribute("errorPassword");
	    }
	%>
		 
	Password: <input type="password" name="password" value="hello@123"><br><br>
	<button type="submit">Log in</button> <br><br>
    <p><a href="librarianSignup.jsp">Don't have an account? Sign up here</a></p>
</form>
</fieldset>
</body>
</html>