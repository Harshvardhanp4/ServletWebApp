<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #00c6ff, #0072ff);
            color: #333;
        }

        h1, h2 {
            color: white;
            text-align: center;
            margin-top: 30px;
        }

        form {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        table {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        input[type="text"], input[type="number"], input[type="password"] {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        input[type="submit"], input[type="reset"] {
            padding: 6px 15px;
            margin-top: 10px;
            border-radius: 6px;
            border: none;
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #218838;
        }

        .result-table {
            margin: 30px auto;
            width: 50%;
            background-color: white;
            border-collapse: collapse;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .result-table th, .result-table td {
            padding: 10px 15px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .result-table th {
            background-color: #0072ff;
            color: white;
        }
    </style>
</head>
<body>

    <h1>Student Details</h1>

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
        <h2>Registered Student</h2>
        <table class="result-table">
            <tr>
                <th>Student Name</th>
                <th>PRN</th>
            </tr>
            <tr>
                <td><%= studentName %></td>
                <td><%= studentPRN %></td>
            </tr>
        </table>
    <% } %>

</body>
</html>
