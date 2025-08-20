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
<style>
#form{ border-size:2px soild red;
     width:300px;
     text-align: center;
 }
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

  <fieldset>
  <legend></legend>
  <h2>Librarian Sign up</h2>
   <form id="form" action="librarianSignup.jsp" method="post">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password"required><br><br>
    <button type="submit">Sign up</button> <br><br>
    <p><a href="librarianlogin.jsp">Already have an account? Login here</a></p>
  </fieldset>
    
    <%
	    if (request.getMethod().equals("POST")){
	    	
	    	String name=request.getParameter("name");
	    	String email=request.getParameter("email");
	    	String password=request.getParameter("password");
	    	
	    	Class.forName("com.mysql.cj.jdbc.Driver");
	    	
	    	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/liberey","root","root");
	    	PreparedStatement ps=con.prepareStatement("INSERT INTO librarian (librarian_Name,librarian_Email,librarian_Password)VALUES(?,?,?)");
	    	ps.setString(1, name);
	    	ps.setString(2, email);
	    	ps.setString(3, password);
	    	
	    	ps.executeUpdate();
	    	con.close();
	    	
	    	
	    	response.sendRedirect("librarianlogin.jsp");
	    }
    %>
</form>
</body>
</html>