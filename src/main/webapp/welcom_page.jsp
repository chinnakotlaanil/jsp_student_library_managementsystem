<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Welcome to Library</title>
    <style>
    body{  background:yellow; 
       text-align:center;
   }
   .c{
       border:2px solid green;
       font-size:30px;
        border-radius:20px;
        
   }
  button:hover{
   border-radius:2px; 
   }
    </style>
</head>

<body>
    <h1>Qspiders Library System</h1>
    
    <form  action="studentSignup.jsp" method="get">
        <button class="c" type="submit" style="color:red ">Student</button>
    </form><br>
    <form   action="librarianSignup.jsp" method="get">
        <button class="c" type="submit" style="color:blue ">Librarian</button>
    </form>
</body>
</html>
