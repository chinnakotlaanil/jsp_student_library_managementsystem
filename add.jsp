<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <% 

 String number1=request.getParameter("number1");
 String number2=request.getParameter("number2");
 int r1 = 0, r2 = 0;
 int result = 0;
 try {
     if (number1 != null && number2 != null && !number1.isEmpty() && !number2.isEmpty()) {
         r1 = Integer.parseInt(number1);
         r2 = Integer.parseInt(number2);
         result = r1 + r2;
     }
 } catch (NumberFormatException e) {
     out.println("<h2     style='color:red;'>Invalid input! Please enter valid numbers.</h2>");
 }
 String   message = "<h1> " + r1 + " + " + r2 + " = " + result + "</h1>";
 
  out.println("<h1>Result: " + message + "</h1>");
  
  out.println("<form action='add' method='get'>");
  out.println("Number 1: <input type='number' name='number1'> <br><br>");
  out.println("Number 2: <input type='number' name='number2'> <br><br>");
  out.println("<button type='submit'>Add</button>");
  out.println("</form>");
  out.println("<h3>Other Operations:</h3>");
  out.println("<a href='add'>addition</a><br>");
  out.println("<a href='sub'>Subtract</a><br>");
  out.println("<a href='mul'>Multiply</a><br>");
  out.println("<a href='div'>Divide</a><br>");

   %>
</body>
</html>