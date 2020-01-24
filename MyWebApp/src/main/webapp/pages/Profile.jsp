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
    <title> ${user.getGamer_id()}'s Profile</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../CSS/pp.css">
</head>

<body>

<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	if(session.getAttribute("user")==null)
		response.sendRedirect("login");
%>
    <div class="container">

        <header class="heading" style="padding-top: 22px;margin-left: 300px;">
            <h5><b><i class = "fa-fa-dashboard"></i>My Dashboard</b></h5>
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
                    <div class="profile-use-menu">
                        <ul class="nav">
                            <li class="active"><a href=""><i class="glyphicon glyphicon-home"></i> Overview</a></li>
                            <li class="active"><a href="usermessages"><i class="glyphicon glyphicon-envelope"></i> Inbox</a></li>
                            <li class="active"><a href="logout"><i class="glyphicon glyphicon-off"></i> Sign Out</a></li>
                        </ul>

                    </div>
                </div>

            </div>
            <div class="col-md-9">
                <table class="table table-striped" id="table">
                    <thead>
                        <tr>
                            <th scope="col">Admin</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
			<tr>
				<td>Admin 1</td>
				<td>${user.isAdmin_1()}</td>
			</tr>
			<tr>
				<td>Admin 2</td>
				<td>${user.isAdmin_2()}</td>
			</tr>
			<tr>
				<td>THEBASEDONE</td>
				<td>${user.isAdmin_3()}</td>
			</tr>
			<%
				Form stat = (Form)session.getAttribute("user");
			%>
 
			<%
				if (stat.isAdmin_1().contains("Approved") && stat.isAdmin_2().contains("Approved") && stat.isAdmin_3().contains("Approved")) {
			%>
			<tr>
				<td>Final Status</td>
				<td>RECOVERED</td>
			</tr>
			<%
				}else if (stat.isAdmin_1().contains("Denied") && stat.isAdmin_2().contains("Denied") && stat.isAdmin_3().contains("Denied")) {
			%>
			<tr>
				<td>Final Status</td>
				<td>TERMINATED</td>
			</tr>
			<%
				}else {
			%>
			<tr>
				<td>Final Status</td>
				<td>AWAITING DECISION...</td>
			</tr>
			<%
				}
			%>
            </tbody>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>