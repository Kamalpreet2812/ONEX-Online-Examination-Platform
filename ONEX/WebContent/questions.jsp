<%@page import="entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="pDAO" class="database.add_delCourse" scope="page"/>
    <jsp:useBean id="pDAO1" class="database.adduser" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<%@include file="bootstrap/bootstrap.jsp"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.btn{
border:none;}
</style>
<body>
<%
           User user=pDAO1.getUserDetails(session.getAttribute("userId").toString());
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
			    	<li><a class="btn btn-outline-warning btn-block" href="adminPanel.jsp?pagepart=2"><h4>Courses</h4></a><br></li>
			    	<li><a class="btn btn-outline-warning active btn-block" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br></li>
			    	<li><a class="btn btn-outline-warning   btn-block" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a></li>
			  	</ul>
			</div>
			
			<div class="col-sm-9">
				<div class="container">
				<div class="row">
					<div class="col-sm-5"style="top: 100px;height:auto;">
						<div class="card">
						 <form action="adminPanel.jsp">
							<div class="title card-header">Show all Questions</div>
						
                				<input type="hidden" name="pagepart" value="4">
                				
                			<div class="card-body">
                				<select name="coursename" class="form-control" style="font-size: 20px;">
                			<option style="font-size: 20px;">Select Courses</option>	
					 	<% 
					            ArrayList list1=pDAO.getAllCourses();
					            
					            for(int i=0;i<list1.size();i=i+2){
				        %>
					        <option value="<%=list1.get(i)%>" style="font-size: 20px;"><%=list1.get(i)%></option>
			            <%
				            }
			            %>
				            </select>
				            <br>
				            <div class="card-footer">
					            <button type="submit" value="Show" class="form-button btn btn-block btn-primary">Show</button>
					       </div>
					       </div>
					    </form>
						</div>
						<br>
					</div>	
					
					<div class="col-sm-7"style="top: 100px;height:auto;">
						<div class="card">
							<form action="controller.jsp" >
			                   <div class="title card-header">Add New Question</div>
			                   <div class="card-body">
			                   <table >
			                       <tr>
			                           <td><label>Course Name</label></td>
			                           <td colspan="3"> 
			                               <select name="coursename" class="form-control" style="font-size: 20px;">
			        <% 
			            ArrayList list=pDAO.getAllCourses();
			            
			            for(int i=0;i<list.size();i=i+2){
			        %>
			        <option value="<%=list.get(i)%>"><%=list.get(i)%></option>
			            <%
			            }
			            %>
			            </select>
			                           </td>
			                       </tr>
			                       <tr>
			                           <td><label>Your Question:</label></td>
			                           <td colspan="4"><input type="text" name="question" class="form-control" placeholder="Type your question here"></td><br>
			                       </tr>
			                       <tr>
			                           <td><label>Options</label></td>
			                           <td><input type="text" name="opt1" class="form-control" placeholder="First Option"></td>
			                           <td><input type="text" name="opt2" class="form-control" placeholder="Second Option"></td>
			                           <td><input type="text" name="opt3" class="form-control" placeholder="Third Option"></td>
			                           <td><input type="text" name="opt4" class="form-control" placeholder="Fourth Option"></td>
			                       </tr>
			                       <tr>
			                           <td><label>Correct Answer</label></td>
			                           <td colspan="4"><center><input type="text" name="correct" class="form-control" placeholder="Correct Answer"></center></td>
			                       <tr>
			                           <td colspan="5"><input type="hidden" name="page" value="questions">
			                    <input type="hidden" name="operation" value="addnew">
			                       <center><button type="submit" class="btn btn-block btn-outline-primary" value="Add" name="submit">ADD</button></center></td>
			                           
			                   </tr>
			                   </table>
			</div>
			                </form>
			           
						</div>
					</div>
				</div>
				</div>
				</div>
</div>
</div>
</body>
</html>