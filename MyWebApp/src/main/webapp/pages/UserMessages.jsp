<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored = "false"
    %>
  <%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
 <%@page import="com.example.model.Form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> ${user.getGamer_id()}'s Inbox</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/mp.css">
</head>

<body>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("user")==null)
		response.sendRedirect("login");
%>
    <div class="container">

        <header class="heading" style="padding-top: 22px;margin-left: 300px;">
            <h5><b><i class = "fa-fa-dashboard"></i>Inbox</b></h5>
        </header>
        <div class="row profile">
            <div class="col-md-3">
                <div class="profil-sidebar">
                    <div class="profile-user-pic">
                        <img src="../Images/ProfPic.jpg" alt="" class="img-responsive img-circle">

                    </div>
                    <div class="profile-user-title" method = "GET" >
                        <div class="profile-user-name" id="title" name = "title">
                           ${user.getF_name()} ${user.getL_name()}
                        </div>
                        <div class="profile-user-job" id="gamerid" name = "gamerid">
                                 ${user.getGamer_id()}
                        </div>
                        <div class="profile-user-job" id="console" name = "console">
                               ${user.getConsole()}
                        </div>

                    </div>
                    <div class="profile-user-buttons">
                        <button  class="btn btn-danger btn-sm" onclick="messagebox()">Message</button>

                    </div>
                    <div class="profile-use-menu">
                        <ul class="nav">
                            <li class="active"><a href="Profile"><i class="glyphicon glyphicon-home"></i> Overview</a></li>
                            <li class="active"><a href=""><i class="glyphicon glyphicon-envelope"></i> Inbox</a></li>
                            <li class ="active"><a href="logout"><i class="glyphicon glyphicon-off"></i> Sign Out</a></li>
                        </ul>

                    </div>
                </div>

            </div>
  


    <div class="col-md-9" id = "table">
                <table class="table table-striped">
                    <thead>
                <tr>
                    <th scope="col">Admin</th>
                    <th scope="col">Messages</th>
                </tr>
            </thead>
            <tbody>
				<%
				Form f = (Form)session.getAttribute("user");
				
				
			%>
 
			<%
					if (!f.getReceivedMessage().isBlank()) {	
			%>
			
			<tr>
				<td>Admin</td>
				<td><%=f.getReceivedMessage()%></td>
			</tr>
			<%
				}
			%>
            </tbody>
        </table>
    </div>
   
        <form method="POST" action="newMessage" class = "sending" >
        <textarea style = "right:-155px;" rows="5" cols="60"  name="message" id="message" 
        placeholder = "In 300 characters or less please write a message to an admin before hitting `Send Message` button"></textarea><br>
            <button id="sendbutton" type="submit" class="btn btn-primary mt-2">Send Message</button>
        </form>
    
    </div>
    <script>
                    function messagebox() {
                        var x = document.getElementById("message");
                        var y = document.getElementById("sendbutton");
                        var z = document.getElementById("table");
                        if (x.style.visibility === "hidden") {
                            x.style.visibility = "visible";
                            y.style.visibility = "visible";
                            z.style.visibility = "hidden";
                        } else {
                            x.style.visibility = "hidden";
                            y.style.visibility = "hidden";                           
                            z.style.visibility = "visible";
                        }
                    }
             
         
    </script>
            </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>