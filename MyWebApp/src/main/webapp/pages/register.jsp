<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/Regi.css">

</head>

<body>
    <div class="loginbox">
        <img src="../Images/GamerAv.png" class="Gameav" alt="GamerAV" height=100 width=100>
        <h1>Registration</h1>
        <form action="newform" method = "POST">
            <p>First Name</p>
            <input type="text" name="firstname" id="firstname" placeholder="Enter First Name" required>
            <p>Last Name</p>
            <input type="text" name="lastname" id="lastname" placeholder="Enter Last Name" required>
            <p>E-Mail Address</p>
            <input type="email" name="emailaddress" id="emailaddress" placeholder="Example@Example.com" required>
            <p>Password</p>
            <input type="password" name="password" id="password" placeholder="Enter Password" required>
            <p>GamerID</p>
            <input type="text" name="gamerid" id="gamerid" placeholder="Enter GamerTag/GamerID" required>
            <p>Gaming Platform</p>
            <select name="console" id="console">
                <option value="Xbox">XboxOne</option>
                <option value="Playstation">Playstation 4</option>
                <option value="Nintendo">Nintendo Switch</option>
                <option value="PC">PC Master Race</option>
            </select>
            <br><br>
            <input type="submit" name="" value="Save" >
            
        </form>
    </div>
</body>

</html>