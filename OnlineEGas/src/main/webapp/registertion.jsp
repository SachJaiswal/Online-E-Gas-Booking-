<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
    font-family: 'Arial', sans-serif;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    height: 100vh;
    margin: 0;
    background-color: #AEFD6C;
    background-image: url('last.png');
    background-size: cover;
    background-position: center center;
    background-repeat: no-repeat;
    color: #333;
     background: url('img/33 copy.png') center/cover no-repeat;
}
  
  .registration-container {
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
    padding: 40px;
    border-radius: 8px;
    width: 400px;
    text-align: center;
    background-color: rgba(255, 255, 255, 0.8); /* Adjust background color if necessary */
  }
  
  .registration-form {
    display: flex;
    flex-direction: column;
  }
  
  h2 {
    color: #333;
    font-size: 24px;
    margin-bottom: 20px;
  }
  
  label {
    color: #555;
    font-size: 14px;
    text-align: left;
    margin-top: 10px;
  }
  
  input,
  textarea {
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
  }
  
  button {
    background-color: #2ecc71;
    color: #fff;
    padding: 12px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
  }
  
  button:hover {
    background-color: #27ae60;
  }
  </style>
  <title>Registration Page</title>
</head>
<body>
  <div class="registration-container">
    <form action="reg" method="post" class="registration-form">
      <h2>Register</h2>
      <label for="username"><b>User Name:</b></label>
      <input type="text" id="username" name="username" required>
       <label for="password"><b>Password:</b></label>
      <input type="password" id="password" name="password" required>
      <label for="email"><b>Email:</b></label>
      <input type="email" id="email" name="email" required>
      <label for="phone"><b>Phone Number:</b></label>
      <input type="tel" id="phone" name="phone" required>
      <label for="pancard"><b>Aadhaar Number:</b></label>
      <input type="text" id="aadhaar" name="aadhaar" required>
      <label for="address"><b>Address</b></label>
      <textarea id="address" name="address" rows="3" required></textarea>
      <button type="submit">Register</button>
    </form>
    <p><a href="index.jsp">Back to Home</a></p>
  </div>
</body>
</html>
