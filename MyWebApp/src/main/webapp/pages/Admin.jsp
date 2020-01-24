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
    <title>${user.getAdmin_id()}'s Profile</title>

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
                        <img src="../Images/admin.png" alt="" class="img-responsive img-circle">

                    </div>
                    <div class="profile-user-title" method = "GET" >
                        <div class="profile-user-name" id="title" name = "title">
                            ${user.getAdmin_id()}
                        </div>
                        <div class="profile-user-job" id="gamerid" name = "gamerid">
                                Administrator
                        </div>
                        <div class="profile-user-job" id="console" name = "console">
                               
                        </div>

                    </div>
                    <div class="profile-use-menu">
                        <ul class="nav">
                            <li class="active"><a hre
                            f=""><i class="glyphicon glyphicon-home"></i> Overview</a></li>
                            <li class="active"><a href="messages"><i class="glyphicon glyphicon-envelope"></i> Inbox</a></li>
                            <li class ="active"><a href="logout"><i class="glyphicon glyphicon-off"></i> Sign Out</a></li>
                        </ul>

                    </div>
                </div>

            </div>
  


    <div class="col-md-9">
                <table class="table table-striped" id="table">
                    <thead>
                <tr>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">GamerID</th>
                    <th scope="col">Console</th>
                    <th scope="col">Alaa</th>
                    <th scope="col">Wayne</th>
                    <th scope="col">THEBASEDONE</th>
                </tr>
            </thead>
            <tbody>
				<%
				int i = 1;
				List<Form> list = (List) request.getAttribute("forms");
			%>
 
			<%
				for (Form f : list) {
					
			%>
			
			<%
	
					if (!(f.isAdmin_1().contains("Approved") && f.isAdmin_2().contains("Approved") && f.isAdmin_3().contains("Approved")) && 
							!(f.isAdmin_1().contains("Denied") && f.isAdmin_2().contains("Denied") && f.isAdmin_3().contains("Denied"))) {
			%>
			<tr>
				<td><%=f.getF_name()%></td>
				<td><%=f.getL_name()%></td>
				<td><%=f.getGamer_id()%></td>
				<td><%=f.getConsole()%></td>
				<td><%=f.isAdmin_1()%></td>
				<td><%=f.isAdmin_2()%></td>
				<td><%=f.isAdmin_3()%></td>
			</tr>
			<%
				}
				
			%>
			<%
				}
				
			%>
            </tbody>
        </table>
    </div>
    <div class="col-md-9" style="padding:10px;width:300px;margin-bottom: 10px;right: -155px;border:1px solid blue;border-radius: 10px">
        <form class="from-group" method="POST" action="Approve">
            <input placeholder = "Enter GamerID Here" type="text" name="fid" class="form-control">
            <button type="submit" class="btn btn-primary mt-2">Approve</button>
        </form>
    </div>
    
    <br>
    
    <div class="col-md-9" style="padding:10px;width:300px;margin-bottom: 10px;right: 146px;bottom: -110px;border:1px solid red;border-radius: 10px">
        <form class="from-group" method="POST" action="Deny">
            <input placeholder = "Enter GamerID Here" type="text" name="fid" class="form-control">
            <button type="submit" style="background-color: red;" class="btn btn-primary mt-2">Deny</button>
        </form>
    </div>
    <%--
                <form action = newMessage method = "POST">
                <textarea  name="message" id="message" cols="110" rows="10"></textarea><br>
                 <input type="submit" name="sendbutton" id = "sendbutton" value="Send" >
				</form>
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
                
                <script type = "text/javascript">
            	let xhr = new XMLHttpRequest();
            	var x = document.getElementbyId("message").value;
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === 4 && xhr.status == 200) {

                        let data = JSON.parse(xhr.responseText);
                        

                    }
                }
                xhr.open("POST", "newMessage");
                xhr.send();
                
                	function newMessage(){
                		var x = document.getElementbyId("message").value;
                	}
                	 --%>
                </script>
                   <script>
         
                   /*function get(url, element) {
            let divvy = document.getElementById(element);
            let xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status == 200) {
                    let data = JSON.parse(xhr.responseText);


                    outputHTML = "";

                    for (let i = 0; i < data.length; i++) {

                        outputHTML += `<tr>
                        	 <td>` + data[i]["f_name"] + `</td> 
							 <td>` + data[i]["l_name"] + `</td> 
							 <td>` + data[i]["gamer_id"] + `</td> 
							 <td>` + data[i]["console"] + `</td> 
							 <td>` + data[i]["status"] + `</td>
							 <td>` + data[i]["message"] + `</td>
					




                        outputHTML += ` </tr>`
                    }
                    divvy.innerHTML = outputHTML
                }
            }
            xhr.open("GET", url);
            xhr.send();
        }



        window.onload = function() {

            this.get("Admin", "content")
        }
        */
    </script>
            </div>
        </div>

    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>

</html>