<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.util.ArrayList"%>
     <%@page import="entities.User" %>
      <jsp:useBean id="pDAO" class="database.adduser" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<%@include file="bootstrap/bootstrap.jsp"%>
<link rel="stylesheet" href="style.css">
</head>

<body>
 <%
           User user=pDAO.getUserDetails(session.getAttribute("userId").toString());
 %>

	<div class="row">
		<div class="col-sm-3 c1">
  					
			<%
           		if(user.getType().endsWith("admin"))
           		{
 			%>
					<div class="py-4 px-3 mb-4">
						<div class="d-flex align-items-center">
				      		<i class="fa fa-user" style="font-size: 5em;" ></i>
				      		<div class="media-body pl-3">
				        		<h4 class="m-0"><%=user.getFirstName()+" "+user.getLastName() %></h4>
				        		<h6><%=user.getType() %></h6>
				      		</div>
				    	</div>
				  	</div>
				  	<ul class="nav flex-column mb-0 py-5">
				    	<li><a class="btn btn-outline-warning active btn-block" href="adminPanel.jsp?pagepart=0"><h4>Profile</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning  btn-block" href="adminPanel.jsp?pagepart=2"><h4>Courses</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning  btn-block" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning   btn-block" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a></li>
				  	</ul>
										
					
			<% }
           		else
           		{
			%>
					<div class="py-4 px-3 mb-4">
						<div class="d-flex align-items-center">
				      		<i class="fa fa-user" style="font-size: 5em;" ></i>
				      		<div class="media-body pl-3">
				        		<h4 class="m-0"><%=user.getFirstName()+" "+user.getLastName() %></h4>
				        		<h6><%=user.getType() %></h6>
				      		</div>
			    		</div>
				  	</div>
				  	<ul class="nav flex-column mb-0 py-5">
				    	<li><a class="btn btn-outline-warning active btn-block" href="studentPanel.jsp?pagepart=0"><h4>Profile</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning  btn-block" href="studentPanel.jsp?pagepart=1"><h4>Exam</h4></a><br></li>
				   		<li><a class="btn btn-outline-warning  btn-block" href="studentPanel.jsp?pagepart=2"><h4>Result</h4></a><br></li>
				  	</ul>
			<%
      			}
			%>	
		</div>

		<div class="col-sm-9">
			<div class="container">
				<div class="card mt-5" style="width: auto;height:100%;">
              		<div class="title card-header"><center>Profile</center></div>
           	  		<div class="card-body">
           	  			<table class="table table-striped table-hover">
           	  				<tr><td>Name</td><td><%=user.getFirstName()+" " %><%=user.getLastName() %></td></tr>
           	  				<tr><td>Email</td><td><%=user.getEmail() %></td></tr>
           	  				<tr><td>UserName</td><td><%=user.getUserName() %></td></tr>
           	  				<tr><td>Contact No</td><td><%=user.getContact() %></td></tr>
           	  				<tr><td>City</td><td><%=user.getCity() %></td></tr>
           	  				<tr><td>Address</td><td><%=user.getAddress() %></td></tr>
           	  			</table>
           	  			<%
               				if(user.getType().equals("admin"))
               				{
               			%>
               					<button class="btn btn-primary"data-toggle="modal" data-target="#exampleModalCenter">Edit profile</button>
                		<% 
              				 }else
              				 {
               			%>
               					<button class="btn btn-primary"data-toggle="modal" data-target="#exampleModalCenter">Edit profile</button>
               			<% 
              				 }
              			 %>	
									<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered" role="document">
									    	<div class="modal-content">
									      		<div class="modal-header">
									        		<h5 class="modal-title" id="exampleModalLongTitle">Edit Profile</h5>
									        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          			<span aria-hidden="true">&times;</span>
									        		</button>
									      		</div>
									      
									   			<form action="controller.jsp">
									      			<div class="modal-body">
					                        			<input type="hidden" name="page" value="profile"> 
					                        			<input type="hidden" name="utype" value="<%=user.getType()%>">
														<table class="table table-striped table-hover">
															<tr>
																<td><label>First Name</label></td>
																<td> <input type="text" name="fname" value="<%=user.getFirstName() %>" class="form-control" placeholder="First Name"></td>
															</tr>
															<tr>
																<td><label>Last Name</label></td>
																<td><input type="text"  name="lname" value="<%=user.getLastName() %>" class="form-control" placeholder="Last Name"></td>
															</tr>
											
															<tr>
																<td><label>User Name</label></td>
																<td><input type="text" name="uname" value="<%=user.getUserName() %>" class="form-control" placeholder="User Name"></td>
												
															</tr>
															<tr>
																<td><label>Email</label></td>
																<td><input type="email" name="email" value="<%=user.getEmail() %>" class="form-control" placeholder="Email"></td>
															</tr>
															<tr>
																<td><label>Password</label></td>
																<td> <input type="password" value="<%=user.getPassword() %>" name="pass" class="form-control" placeholder="Password"></td>
															</tr>
															<tr>
																<td><label>Contact No</label></td>
																<td>   <input type="text" name="contactno" value="<%=user.getContact() %>" class="form-control" placeholder="Contact No"></td>
															</tr>
															<tr>
																<td><label>City</label></td>
																<td><input type="text" name="city" value="<%=user.getCity() %>" class="form-control" placeholder="City"></td>
															</tr>
															<tr>
																<td><label>Address</label></td>
																<td><input type="text" name="address" value="<%=user.getAddress() %>" class="form-control" placeholder="Address"></td>
															</tr>
														</table>
									      			</div>
									      			<div class="modal-footer">
									        			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									        			<button type="submit" class="btn btn-primary">Save changes</button>
									     			</div>
									     		</form> 
									   		 </div>
									  	</div>
									</div>
									
					</div>
				</div>        
			</div> 
		</div>	   
	</div>       
			
</body>
</html>