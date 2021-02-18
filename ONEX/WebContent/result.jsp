<%@page import="entities.User"%>
<%@page import="entities.Answers"%>
<%@page import="entities.Exams"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="database.result" scope="page"/>
<jsp:useBean id="pDAO1" class="database.adduser" scope="page"/>

<!DOCTYPE html>
<html>
<head>
<%@include file="bootstrap/bootstrap.jsp"%>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
				    	<li><a class="btn btn-outline-warning  btn-block" href="studentPanel.jsp?pagepart=1"><h4>Exam</h4></a><br></li>
				   		<li><a class="btn btn-outline-warning active btn-block" href="studentPanel.jsp?pagepart=2"><h4>Result</h4></a><br></li>
				  	</ul>
		</div>
		
	<div class="col-sm-9">
	<div class="container p-5">
    <table class="table table-hover table-striped mt-4" >
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">Date</th>
            <th scope="col" class="rounded-q1">Course</th>
            <th scope="col" class="rounded-q2">Time</th>
            <th scope="col" class="rounded-q3">Status</th>
            <th scope="col" class="rounded-q4">Action</th>
        </tr>
    </thead>
        
    <tbody>
        
        <%
            ArrayList list=pDAO.getAllResultsFromExams(Integer.parseInt(session.getAttribute("userId").toString()));
            for(int i=0;i<list.size();i++){
                Exams e=(Exams)list.get(i);
            %>
    	<tr>
            <td><%=e.getDate() %></td>
            <td><%=e.getcName() %></td>
            <td><%=e.getStartTime()+" - "+e.getEndTime()%></td>
            <% if(e.getStatus()!=null){
                if(e.getStatus().equals("Pass")){%>
                <td style="background:green;color:white"><%=e.getStatus()%></td>
            <% }else{%>
            <td style="background: #ff3333;color:white"><%=e.getStatus()%></td>
            <% }
            }else{%>
            <td style="background: bisque ;">Terminated</td>
            <% } %>
			<td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Details</button>
			
						<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLongTitle"><%=e.getcName() %></h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						      
						       <table class="table table-striped">
			                
			                <%
			                ArrayList list1=pDAO.getAllAnswersByExamId(e.getExamId());
			                for(int j=0;j<list1.size();j++){
			                    Answers a=(Answers)list1.get(j);
			                
			          	  %>
			
			            
			                <tr>
			                    <td rowspan="2"><%=j+1 %>)</td>
			                    <td colspan="2"><%=a.getQuestion()%></td>
			                    <td rowspan="2"><%=a.getStatus() %></td>
			                </tr>
			                <tr >
			                    <td><%="Your Ans: "+a.getAnswer()%></td>
			                    <td><%="Correct Ans: "+a.getCorrectAns() %></td>
			                </tr>
			                <tr>
			                    <td colspan="3" style="background: white"></td>
			                <%
			                }
			                %>
			            </table>
                
			      </div>
			    </div>
			  </div>
			</div>
			</td>
        </tr>
       
       <% }
       %>
    </tbody>
</table>                            </div>
		
		</div>
   
</body>
</html>