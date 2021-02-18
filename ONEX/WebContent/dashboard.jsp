<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean id="pDAO" class="database.adduser" scope="page"/>

        <% 
       
           if(session.getAttribute("userStatus")!=null){
            String loginConfirm=session.getAttribute("userStatus").toString();
            if(loginConfirm.equals("1")){
                
            if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("admin")){
            response.sendRedirect("adminPanel.jsp?pagepart=0"); 
            
            }else if(pDAO.getUserType(session.getAttribute("userId").toString()).equals("student")){
                response.sendRedirect("studentPanel.jsp?pagepart=0");
            }
            
        
            }else if(!loginConfirm.equals("1")){
               response.sendRedirect("login.jsp");
               
            }
        }else response.sendRedirect("login.jsp");
        %>

        