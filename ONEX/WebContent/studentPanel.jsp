<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="controller.jsp?page=logout" class="btn btn-danger" style="float:right;color:white">Logout</a>
	

	<%
	 session.setAttribute("key", "1");
	if(session.getAttribute("userStatus")!=null){
		if(session.getAttribute("userStatus").equals("1")){
	%>
	
	
	<% 
            if(request.getParameter("pagepart").equals("1")){
                
      %>
            
            <jsp:include page="exam1.jsp"/>
            
            <%
                
            }else if(request.getParameter("pagepart").equals("2")){
            
                %>
            
                <jsp:include page="result.jsp"/>
                
                <%
                
            }else{
                %>
            
                <jsp:include page="profile.jsp"/>
            
            <%
            }
            %>
            
            <%
           }else response.sendRedirect("login.jsp");
            }else response.sendRedirect("login.jsp");
            
          
           %>



</body>
</html>