<%@page import="java.time.LocalTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="pDAO" class="database.adduser" scope="page"/>
<jsp:useBean id="pDAO1" class="database.update" scope="page"/>
<jsp:useBean id="pDAO2" class="database.add_delCourse" scope="page"/>
<jsp:useBean id="pDAO3" class="database.questions" scope="page"/>
<jsp:useBean id="pDAO4" class="database.Exam" scope="page"/>
<jsp:useBean id="pDAO5" class="database.result" scope="page"/>
<%
if(request.getParameter("page").toString().equals("login"))
{
	if(pDAO.loginValidate(request.getParameter("username").toString(), request.getParameter("password").toString()))
	{
    	session.setAttribute("userStatus", "1");
    	session.setAttribute("userId",pDAO.getUserId(request.getParameter("username")));
    	response.sendRedirect("dashboard.jsp");
	
	}	
	else
	{
	    request.getSession().setAttribute("userStatus", "-1");
	  response.sendRedirect("login.jsp");
	}
}
else if(request.getParameter("page").toString().equals("register"))
{
        
        String fName =request.getParameter("fName");
        String lName =request.getParameter("lName");
        String uName=request.getParameter("uName");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contact");
        String city =request.getParameter("city");
        String address =request.getParameter("address");
        
    
         
    pDAO.addNewStudent(fName,lName,uName,email,pass,contactNo,city,address);
    response.sendRedirect("login.jsp");
}
else if(request.getParameter("page").toString().equals("profile")){
    
    String fName =request.getParameter("fname");
    String lName =request.getParameter("lname");
    String uName=request.getParameter("uname");
    String email=request.getParameter("email");
    String pass=request.getParameter("pass");
    String contactNo =request.getParameter("contactno");
    String city =request.getParameter("city");
    String address =request.getParameter("address");
     String uType =request.getParameter("utype");
    int uid=Integer.parseInt(session.getAttribute("userId").toString());

     
pDAO1.updateStudent(uid,fName,lName,uName,email,pass,contactNo,city,address,uType);
response.sendRedirect("dashboard.jsp");
}

else if(request.getParameter("page").toString().equals("courses")){
	
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO2.addNewCourse(request.getParameter("coursename"),Integer.parseInt(request.getParameter("totalmarks")),request.getParameter("time"),request.getParameter("testkey"));
        response.sendRedirect("adminPanel.jsp?pagepart=2");
    }
    else if(request.getParameter("operation").toString().equals("del")){
        pDAO2.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adminPanel.jsp?pagepart=2");
    }
}

else if(request.getParameter("page").toString().equals("accounts")){
    if(request.getParameter("operation").toString().equals("del")){
        pDAO.delUser(Integer.parseInt(request.getParameter("uid")));
        response.sendRedirect("adminPanel.jsp?pgprt=1");
    }
}


else if(request.getParameter("page").toString().equals("logout")){
    session.setAttribute("userStatus","0");
    session.removeAttribute("examId");
    session.removeAttribute("examStarted");
    response.sendRedirect("login.jsp");
}

else if(request.getParameter("page").toString().equals("questions")){
    if(request.getParameter("operation").toString().equals("addnew")){
        pDAO3.addQuestion(request.getParameter("coursename"),request.getParameter("question"),
                request.getParameter("opt1"), request.getParameter("opt2"),request.getParameter("opt3"),
        request.getParameter("opt4"), request.getParameter("correct"));
        response.sendRedirect("adminPanel.jsp?pagepart=3");
    }else if(request.getParameter("operation").toString().equals("del")){
        pDAO2.delCourse(request.getParameter("cname").toString());
        response.sendRedirect("adminPanel.jsp?pagepart=3");
    }else if(request.getParameter("operation").toString().equals("delQuestion")){
        pDAO3.delQuestion(Integer.parseInt(request.getParameter("qid")));
        response.sendRedirect("adminPanel.jsp?pagepart=3");
        
    }
}

else if(request.getParameter("page").toString().equals("exams")){
    if(request.getParameter("operation").toString().equals("startexam")){
        String cName=request.getParameter("coursename");
        int userId=Integer.parseInt(session.getAttribute("userId").toString());
      
        if(pDAO2.checkTestKey(request.getParameter("testkey"),cName)){
	       int examId=pDAO4.startExam(cName,userId);
	        session.setAttribute("examId",examId);
	        session.setAttribute("examStarted","1");
	        response.sendRedirect("startExam.jsp?coursename="+cName);
        }
        else{
        	response.sendRedirect("studentPanel.jsp?pagepart=1");
        }
   }


else if(request.getParameter("operation").toString().equals("submitted")){
    try{
		    String time=LocalTime.now().toString();
		    int size=Integer.parseInt(request.getParameter("size"));
		    int eId=Integer.parseInt(session.getAttribute("examId").toString());
		    int tMarks=Integer.parseInt(request.getParameter("totalmarks"));
			System.out.println("sdfsdd"+size+" "+eId+" "+tMarks+" "+time);
		    session.removeAttribute("examId");
		    session.removeAttribute("examStarted");
		    for(int i=0;i<size;i++){
		        String question=request.getParameter("question"+i);	
		        System.out.println("Q"+i);
		        String ans=request.getParameter("ans"+i);
		        
		        int qid=Integer.parseInt(request.getParameter("qid"+i));
		        System.out.println(qid);
		        pDAO5.insertAnswer(eId,qid,question,ans);
		    }
		    System.out.println(tMarks+" conn\t Size: "+size);
		    pDAO5.calculateResult(eId, tMarks, time, size);
    
    response.sendRedirect("feedback.jsp");
    }catch(Exception e){
    	 System.out.println("error");
    }   
	}
}
%>

</body>
</html>