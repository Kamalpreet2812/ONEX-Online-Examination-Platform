<%@page import="entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
    <jsp:useBean id="pDAO2" class="database.add_delCourse" scope="page"/>
    <jsp:useBean id="pDAO" class="database.adduser" scope="page"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Courses</title>
<%@include file="bootstrap/bootstrap.jsp"%>
<link rel="stylesheet" href="style.css">
</head>
<body>

	<%
           User user=pDAO.getUserDetails(session.getAttribute("userId").toString());
 	%>
	<div class="row">
		<div class="col-sm-3 c1">
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
			    	<li><a class="btn btn-outline-warning btn-block" href="adminPanel.jsp?pagepart=0"><h4>Profile</h4></a><br></li>
			    	<li><a class="btn btn-outline-warning active  btn-block" href="adminPanel.jsp?pagepart=2"><h4>Courses</h4></a><br></li>
			    	<li><a class="btn btn-outline-warning  btn-block" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br></li>
			    	<li><a class="btn btn-outline-warning   btn-block" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a></li>
			  	</ul>
			</div>
			
			<div class="col-sm-9">
				<div class="container">
					<div class="row">
						<div class="col-sm-5">
							<div class="card mt-5 overflow-hidden" style="width: auto;height:auto;">
              					<div class="title card-header"><center>Add Courses</center></div>
								<div class="card-body">
									<form action="controller.jsp">
							 			<input type="hidden" name="page" value="courses">
                    					<input type="hidden" name="operation" value="addnew">
										<table>
											<tr>
				                    			<td><label>Course Name</label></td>
				                        		<td> <input type="text" name="coursename" class="form-control" placeholder="Course Name"></td>
				                    		</tr>
			                        		<tr>
			                            		<td><label>Total Marks</label></td>
			                   					<td><input type="text" name="totalmarks" class="form-control" placeholder="Total Marks"></td>
			                        		</tr>
			                        		<tr>
			                            		<td><label>Exam Time</label></td>
			                            		<td><input type="text" name="time" class="form-control" placeholder="MM"></td>
				                    		</tr>
											<tr>
			                            		<td><label>Test Key</label></td>
			                            		<td><input type="text" name="testkey" class="form-control" placeholder="test key"></td>
				                    		</tr>
				                    		<tr>
				                    			<td colspan="2"><br>
                       							<center><input type="submit" class="btn btn-primary btn-block" value="Add" name="submit"></center></td>
                       						</tr>
										</table>
									</form>
								</div>
							</div>	
						</div>
					
						<div class="col-sm-7">
							<div class="card mt-5" style="width: auto;max-height: 70%;">
              					<div class="title card-header"><center>All Courses</center></div>
              					<div class="card-body" style="width: auto;height:40%; overflow-y:scroll;">
									<table class="table table-hover table-striped">
										<thead>
											<tr>
												<th>Courses</th>
												<th>T.Marks</th>
												<th>Actions</th>
											</tr>
										</thead>
										<%
											ArrayList list=pDAO2.getAllCourses();
											for(int i=0;i<list.size();i+=2){
										%>
										<tr>
											<td><%=list.get(i)%></td>
											<td><%=list.get(i+1)%></td>
											<td><a class="btn btn-danger" href="controller.jsp?page=courses&operation=del&cname=<%=list.get(i) %>"onclick="return confirm('Are you Sure?);">X</a></td>
										</tr>
										<%
											}
										%>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>