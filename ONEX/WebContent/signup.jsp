<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
.f1
{
width:100%;
border:none;
border-bottom:2px solid black;
}
.h1 {
  font-size: 65	px;
  background: -webkit-linear-gradient(#eee, #333);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.card-header
{ background: #200122;
  background: -webkit-linear-gradient(to right, #200122, #6f0000); 
  background: linear-gradient(to right, #200122, #6f0000);
color:white;
}
.card {

  box-shadow: 10px 10px 5px grey;
}

</style>
</head>
<body>
<div class="container-fluid p-0">
    <h1 class="h1" style="box-shadow: 10px 10px 5px grey;"><img src="images/logo.jpg"height=100px>Online Examination System</h1>
    
  </div>
	<div class="container mt-4">
		<div class="card">
					<div class="card-header bg-success">
						<h1>Create Account</h1>
					</div>
					<div class="card-body">
					
					<form action="controller.jsp">
					<input type="hidden" name="page" value="register">
						<table class="table table-borderless"> 
							<tr>
								<td><i class="fa fa-user" aria-hidden="true"></i>
					 			<input type="text" class="f1"name="fName" placeholder="First Name" required></td>
					 			
					 			<td><i class="fa fa-user" aria-hidden="true"></i>
					 			<input type="text" class=" f1"name="lName" placeholder="Last Name" required></td>
					 		</tr>
					 		<tr>
					 			<td colspan="2"><i class="fa fa-envelope" aria-hidden="true"></i>
					 			<input type="email" class=" f1" name="email" placeholder="Enter Email" required></td>
					 		</tr>
					 		<tr>
					 			<td><i class="fa fa-user" aria-hidden="true"></i>
					 			<input type="text" class=" f1"name="uName" placeholder="User Name" required></td>
					 			
					 			<td><i class="fa fa-key" aria-hidden="true"></i>
					 			<input type="password" class=" f1" name="pass" placeholder="Enter Password" required></td>
					 			
					 		</tr>
					 		<tr>
					 			<td><i class="fa fa-user" aria-hidden="true"></i>
					 			<input type="text" class=" f1"name="contact" placeholder="contact no" required></td>
					 			
					 			<td><i class="fa fa-home" aria-hidden="true"></i> 
					 			<input type="text" class=" f1"name="city" placeholder="Enter city" required></td>
					 		</tr>
					 		<tr>
					 			<td colspan="2"><i class="fa fa-home" aria-hidden="true"></i>
					 			<input type="text" class=" f1"name="address" placeholder="Enter Address" required></td>
					 		</tr>
					 	
					 </table>
					
					
					<div class="text-center">
					<input  class="btn btn-primary" type="submit" Value="Create" name="create">
					<a class="btn btn-success" href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> login</a>
					</div>
					</form>
</div>
</div>
</div>
</body>
</html>