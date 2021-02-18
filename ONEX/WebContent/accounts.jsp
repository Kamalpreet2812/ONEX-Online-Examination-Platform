<%@page import="entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <jsp:useBean id="pDAO" class="database.adduser" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accounts</title>
<%@include file="bootstrap/bootstrap.jsp"%>
<link rel="stylesheet" href="style.css">
</head>
<body>
<%
           User user1=pDAO.getUserDetails(session.getAttribute("userId").toString());
 %>		
 <div class="row">
		<div class="col-sm-3 c1">
					<div class="py-4 px-3 mb-4">
						<div class="d-flex align-items-center">
				      		<i class="fa fa-user" style="font-size: 5em;" ></i>
				      		<div class="media-body pl-3">
				        		<h4 class="m-0"><%=user1.getFirstName()+" "+user1.getLastName() %></h4>
				        		<h6><%=user1.getType() %></h6>
				      		</div>
				    	</div>
				  	</div>
				  	<ul class="nav flex-column mb-0 py-5">
				    	<li><a class="btn btn-outline-warning  btn-block" href="adminPanel.jsp?pagepart=0"><h4>Profile</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning  btn-block" href="adminPanel.jsp?pagepart=2"><h4>Courses</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning  btn-block" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning active  btn-block" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a></li>
				  	</ul>
										
					</div>
					
						<div class="col-sm-9">
			<div class="container">
				<div class="card mt-5" style="width: auto;height:100%;">
              		<div class="title card-header"><center>List Of All Accounts</center></div>
           	  		<div class="card-body">
           	  		<!--  	<a class="btn btn-danger btn-lg" style="float:right;margin-right:15px;color:white">Add New Person</a> -->
              		
						<table class="table table-hover table-striped">
							<thead>
								<tr>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">City</th>
									<th scope="col">Address</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
									ArrayList list=pDAO.getAllUsers();
									User user;
									for(int i=0;i<list.size();i++){
										user=(User)list.get(i);
										if(user.getUserId()!=Integer.parseInt(session.getAttribute("userId").toString())){
								%>
								<tr>
									<td><%= user.getFirstName()+" "+user.getLastName()%></td>
									<td><%= user.getEmail() %></td>
									<td><%= user.getCity() %></td>
									<td><%= user.getAddress() %></td>
									<td><a class="btn btn-danger" href="controller.jsp?page=accounts&operation=del&uid=<%=user.getUserId() %>"
											onclick="return confirm('Are you Sure?);">X</a></td>
								</tr>
								<%
										}
									}
								%>			
							</tbody>
						</table>
						</div>
					</div>
					</div>
				</div>
				
	
	
</body>
</html>