<%@page import="entities.User"%>
<%@page import="entities.Questions"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<jsp:useBean id="pDAO" class="database.questions" scope="page"/>
<jsp:useBean id="pDAO1" class="database.adduser" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="bootstrap/bootstrap.jsp"%>
<link rel="stylesheet" href="style.css">
</head>
<body style="max-height: 100%;overflow-y:hidden";>
<%
           User user1=pDAO1.getUserDetails(session.getAttribute("userId").toString());
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
				    	<li><a class="btn btn-outline-warning active btn-block" href="adminPanel.jsp?pagepart=3"><h4>Questions</h4></a><br></li>
				    	<li><a class="btn btn-outline-warning   btn-block" href="adminPanel.jsp?pagepart=1"><h4>Accounts</h4></a></li>
				  	</ul>
										
					</div>
					
				
		<div class="col-sm-9">
			<div class="container">
				<div class="card">
					<div class="card-header title">All Questions</div>
						<div class="card-body"style="overflow-y:scroll;">
              		<%
           					if(request.getParameter("coursename")!=null){
               					ArrayList list=pDAO.getAllQuestions(request.getParameter("coursename"));
               					for(int i=0;i<list.size();i++){
                  					 Questions question=(Questions)list.get(i); 
                   %>
                   <div class="card mt-3">
						<div class="card-header" >
                             <label style="font-size: 30px;font-weight: bolder;"><%=i+1 %>.</label>
							 <label style="font-size: 25px;font-weight: bolder;margin-left: 15px;font-style: italic;"><%=question.getQuestion() %></label>		
							<a href="controller.jsp?page=questions&operation=delQuestion&qid=<%=question.getQuestionId() %>" class="btn btn-danger"style="float:right;">Delete</a>
                  		</div>
						<div class="card-body">
                            <label class="show"><%=question.getOpt1() %></label>
							<label class="show"><%=question.getOpt2() %></label>
							<label class="show"><%=question.getOpt3() %></label>
							<label class="show"><%=question.getOpt4() %></label>
						</div>
						<div class="card-footer">
							<label class="show-correct"><%=question.getCorrect() %></label>
						</div>
					</div>
                   
                   <%
               }
          } %>
				</div>	
				</div>
</div>
</div>
</div>
</body>
</html>