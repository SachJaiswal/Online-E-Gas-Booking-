<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gas E-Seva</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background: url('img/33 copy.png') center/cover no-repeat;
        }

        .container {
            width: 80%;
            max-width: 600px;
            margin: 20px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 1, 0.5);
            background-color: #ffffff;
            text-align: center;
            color: #333;
        }

        h1 {
            font-weight: bold;
            color: #007BFF;
        }

        .links a {
            margin: 0 10px;
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            background-color: #007BFF;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .links a:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Welcome to Online Gas E-Seva</h1>

        <div class="links">
            <a href="login.jsp">Login</a>
            <a href="registertion.jsp">Register</a>
        </div>
    </div>
</body>

</html>
