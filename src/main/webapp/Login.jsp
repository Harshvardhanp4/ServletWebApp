<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>

<div align="center">
    <h1>Student Details</h1>
</div>

<form action="LoginServlet" method="post">
    <table>
        <tr><td>Enter Name:</td><td><input type="text" name="txtName" required></td></tr>
        <tr><td>Enter PRN:</td><td><input type="number" name="txtNumber" required></td></tr>
        <tr><td>Enter Password:</td><td><input type="password" name="txtPwd" required></td></tr>
        <tr><td><input type="submit" value="Login"></td><td><input type="reset"></td></tr>
    </table>
</form>

<% 
   
    String studentName = (String) request.getAttribute("studentName");
    String studentPRN = (String) request.getAttribute("studentPRN");

    if (studentName != null && studentPRN != null) { 
%>
    <div align="center">
        <h2>Registered Student</h2>
        <table border="1">
            <tr>
                <th>Student Name</th>
                <th>PRN</th>
            </tr>
            <tr>
                <td><%= studentName %></td>
                <td><%= studentPRN %></td>
            </tr>
        </table>
    </div>
<% } %>

</body>
</html>
