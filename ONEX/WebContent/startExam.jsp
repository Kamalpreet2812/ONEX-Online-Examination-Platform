<%@page import="java.io.IOException"%>
<%@page import="entities.Questions"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="pDAO" class="database.Exam" scope="page"/>
    <jsp:useBean id="pDAO1" class="database.questions" scope="page"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="bootstrap/bootstrap.jsp"%>
<style>

.card {
  box-shadow: 10px 10px 5px grey;
}
.box{
        position: absolute;
        top: 50%;
        left: -50%;
        display:none;
         box-shadow: 10px 10px 5px grey;
       
         width:100%;
}
ul{list-style-type: none;}
</style>
</head>
<body>
	<%
           if(session.getAttribute("examStarted")!=null){
               if(session.getAttribute("examStarted").equals("1")){
      %>
      <div class="container-fluid p-0">
     	<div class="row" style="z-index:1000;">
     	<div class="col-md-12">
         	<h1 class="h1" style="box-shadow: 10px 10px 5px grey;position: fixed;width:100%;"><img src="images/logo.jpg"height=100px></h1> 
      		<!-- <span id="remainingTime" style="position: fixed;text-align:right;font-size: 23px;background: rgba(255,0,77,0.38);border-radius: 5px;padding: 10px;box-shadow: 2px -2px 6px 0px;">
        	</span> -->
        	</div>
        </div>
    </div>
    <div class="container mt-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
        <form action="controller.jsp">
                       
                       <%
                       ArrayList list=pDAO1.getQuestions(request.getParameter("coursename"),10);
                       	Questions question;
                       %>
                       <input type="hidden" name="size" value="<%=list.size()%>"id="size">
                       <input type="hidden" name="totalmarks" value="<%=pDAO.getTotalMarksByName(request.getParameter("coursename"))%>">
                       
                       <%
                       for(int i=0;i<list.size();i++){
                           
                    	   question=(Questions)list.get(i);
                       %>
           
						<div class="box"id="card<%=i%>">
							<div>
                             	<h2><%=i+1 %>. <%=question.getQuestion() %></h2>		
							</div>
						<ul>
							<li><input type="radio" id="c1<%=i%>" name="ans<%=i%>" value="<%=question.getOpt1()%>"/>
							<label for="c1<%=i%>"class="show"><%=question.getOpt1()%></label></li>
							<li><input type="radio" id="c2<%=i%>" name="ans<%=i%>" value="<%=question.getOpt2()%>" />
							<label for="c2<%=i%>"class="show"><%=question.getOpt2()%></label></li>
							<li><input type="radio" id="c3<%=i%>" name="ans<%=i%>" value="<%=question.getOpt3()%>" />
							<label for="c3<%=i%>"class="show"><%=question.getOpt3()%></label></li>
							<li><input type="radio"  id="c4<%=i%>" name="ans<%=i%>" value="<%=question.getOpt4()%>"/>
							<label for="c4<%=i%>"class="show" ><%=question.getOpt4()%></label></li>
							
						</ul>
					</div>
                       <input type="hidden" name="question<%=i%>" value="<%=question.getQuestion()%>">
                       <input type="hidden" name="qid<%=i%>" value="<%=question.getQuestionId()%>">
                       
                       <br>
                       
                       <%
                      
                       }
                       
                       %>
                   <input type="hidden" name="page" value="exams">
                   <input type="hidden" name="operation" value="submitted"> 
                   <input type="submit" class="btn btn-primary" value="Done">
                  
               </form>
               <div style="position:absolute;margin-top:50%;left:90%;">
                 
                 <button class="btn btn-primary" id="next">Next</button>
        		 <button class="btn btn-danger" id="prev">Prev</button>
        </div>
        
        
      <%
               }
           }
      %>
      </div>
      </div>
        </div>      
</body>

<script>
 document.getElementById("card0").style.display = "block";
 var i=1;
 var size=document.getElementById("size").value;
 var next = document.getElementById("next");
 next.addEventListener("click",function(){
	 if(i<size){
	 document.getElementById("card"+i).style.display = "block";
	 if(i!=0) document.getElementById("card"+(i-1)).style.display = "none";
		i=i+1;
	 }
 });
 var prev = document.getElementById("prev");
 prev.addEventListener("click",function(){
	 if(i>0){
		 if(i==size)i=i-1;
		 else{
	 document.getElementById("card"+i).style.display = "none";
	 document.getElementById("card"+(i-1)).style.display = "block";
		i=i-1;
		 }
	 }
 });
  

 var time = <%=pDAO.getRemainingTime(Integer.parseInt(session.getAttribute("examId").toString())) %>;
    time--;
    var sec=60;                    
    document.getElementById("remainingTime").innerHTML =  time+" : "+sec;
       //it calls fuction after specific time again and again                  
   var x= window.setInterval(timerFunction, 1000);
function timerFunction(){
        sec--;
  // Display the result in the element with id="demo"
  
 
  if (time < 0) {
    clearInterval(x);
    document.getElementById("remainingTime").innerHTML = "00 : 00";
    document.getElementById("myform").submit();
  }
  document.getElementById("remainingTime").innerHTML =  time+" : "+sec;
if(sec==0){
    sec=60;
    time--;
    
}
}
</script>

</html>