<%@page import="entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="pDAO" class="database.add_delCourse" scope="page"/>  
    
    <jsp:useBean id="pDAO1" class="database.adduser" scope="page"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="bootstrap/bootstrap.jsp"%>
<link rel="stylesheet" href="style.css">
</head>
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
				    	<li><a class="btn btn-outline-warning  btn-block" href="studentPanel.jsp?pagepart=0"><h4>Profile</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning active btn-block" href="studentPanel.jsp?pagepart=1"><h4>Exam</h4></a><br></li>
				   		<li><a class="btn btn-outline-warning  btn-block" href="studentPanel.jsp?pagepart=2"><h4>Result</h4></a><br></li>
				  	</ul>
		</div>
		
		<div class="col-sm-9">
				<div class="container p-5">
					<div class="card mt-5" style="width:70%;height:100%;margin-left:20%;margin-top:30%;">
              			 <form action="controller.jsp">
              			<div class="title card-header"><center>Select Course</center></div>
           	  			<div class="card-body">
						           <input type="hidden" name="page" value="exams">
              					  <input type="hidden" name="operation" value="startexam">
                	<select name="coursename" class="form-control">
        <% 
            ArrayList list1=pDAO.getAllCourses();
            
            for(int i=0;i<list1.size();i=i+2){
        %>
        <option value="<%=list1.get(i)%>"><%=list1.get(i)%></option>
            <%
            }
            %>
            </select>
            <br>
            <input type="password" class="form-control"name="testkey" placeholder="Enter TestKey"/>
            </div>
            <div class="card-footer">
            <input type="submit" value="Take Exam" class="btn btn-outline-success btn-block">
            </div>
            </form>
         
        </div>
    			<% 
    				if(request.getSession().getAttribute("key").equals("-1")){
                %>
                            <script>alert("username or password is incorrect");</script>
               <%
               			request.getSession().setAttribute("key", "1");
    				}
               %>
	</div>
</div>

</body>
</html>