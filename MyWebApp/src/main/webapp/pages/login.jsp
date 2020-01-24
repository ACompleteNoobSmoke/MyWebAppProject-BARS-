<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="../CSS/logstyle.css">
</head>
<body>
<div class="loginbox">
        <img src="../Images/GamerAv.png" class="Gameav" alt="GamerAV" height=100 width=100>
        <h1>Login Here</h1>
        <form action="loginuser" method = "POST">
            <p>User</p>
            <input type="text" name="username" placeholder="Enter Username">
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password">
            <input type="submit" name="" value="Login">
            <a href="register">Do Not Have An Account?</a>
            <br><br>
            <a href="/">Home Page</a>
        </form>
    </div>
</body>
</html>