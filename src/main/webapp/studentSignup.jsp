<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up Page</title>
<style>  
 #form{ border-size:2px soild red;
     width:300px;
     text-align: center;
     
    
 }
 fieldset{  width:300px;
  margin-left: 500px;
  border-radius: 20px;
   background:white;
 }
 body{ background:pink;
 }
</style>
</head>
<body>


  <fieldset >
  <legend>Student signup</legend>
  <form id="form"  action="studentSignup.jsp" method="post">
    Name: <input type="text" name="name" required><br><br>
    Email: <input type="email" name="email" required><br><br>
    Password: <input type="password" name="password" required><br><br>
    <button type="submit">Sign up</button> <br><br>
    <p><a href="studentlogin.jsp"> if account exist Login here</a></p>
    </form>
  </fieldset>


	<%
		if (request.getMethod().equals("POST")){
		    String name = request.getParameter("name");
		    String email = request.getParameter("email");
		    String password = request.getParameter("password");
		
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/students_info", "root", "root");
		
		    PreparedStatement ps = con.prepareStatement("INSERT INTO student (s_name, s_email, s_password) VALUES (?, ?, ?)");
		    ps.setString(1, name);
		    ps.setString(2, email);
		    ps.setString(3, password);
		    ps.executeUpdate();
		    con.close();
		    response.sendRedirect("studentlogin.jsp");
		}
	%>
	
</body>
</html>