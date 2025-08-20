<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Login Page</title>
    <style>
    #form{border-size:2px soild red;
       width:300px;
     text-align: center;
    }  
     fieldset{  width:300px;
         margin-left: 500px;
          border-radius: 20px;
         background:white;
     
 }
 body{ background:pink;
          text-align: center;
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
	       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/students_info", "root", "root");
	       PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM student WHERE s_email = ?");
	       
	       pstmt.setString(1, email);
	       
	       ResultSet resultSet = pstmt.executeQuery();
	       if (resultSet.next()) {
	    	   
	           String dbPassword = resultSet.getString("s_password");
	           if (dbPassword.equals(password)) {
	               session.setAttribute("email", email);
	               session.setAttribute("password", password);
	               session.setAttribute("id", resultSet.getInt("s_id"));
	               session.setAttribute("name", resultSet.getString("s_name"));
	               conn.close();
	               
	               RequestDispatcher dispatcher = request.getRequestDispatcher("studentHome.jsp");
	               dispatcher.forward(request, response);
	           } else {
	               session.setAttribute("errorPassword", "Wrong password");
	               response.sendRedirect("studentlogin.jsp");
	           }
			} else {
	            session.setAttribute("errorEmail", "Wrong Email");
				response.sendRedirect("studentlogin.jsp");
	        }
		}
	%>

<fieldset >
<legend>Student Login</legend>
<form id="form" action="studentlogin.jsp" method="post">
    <% 
        if (errorEmail != null) { 
            out.println("<h4 style='color:red;'>" + errorEmail + "</h4>");
            session.removeAttribute("errorEmail");
        } 
    %>
 Email:<input type="email" name="email" value="example@gmail.com"><br><br>
    <% 
        if (errorPassword != null) { 
            out.println("<h4 style='color:red;'>" + errorPassword + "</h4>");
            session.removeAttribute("errorPassword");
        } 
    %>
Password:<input type="password" name="password" value="example@12345"><br><br>
<button type="submit">login</button>
<p><a href="studentSignup.jsp">Not have an account? Sign up here</a></p>

</form>
</fieldset>

</body>
</html>
