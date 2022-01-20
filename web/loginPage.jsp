
<%@ page import="com.tech.blog.entities.User"%>

<%
	User user = (User)session.getAttribute("curr_user");
	if(user != null){
		response.sendRedirect("profile.jsp");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="com.tech.blog.entities.Message" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- css -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="css/myStyle.css">
	
    <title>Login Page</title>
    
  </head>
  <body>
  
  	<!-- Navbar -->
	
	<%@ include file="normalNavBar.jsp" %>
  	
  	<main class="d-flex align-items-center primary-light-background banner-background"  style="height:70vh">
	  	<div class="container">
	  		<div class="row">
	  			<div class="col-md-4 offset-md-4">
	  				<div class="card">
	  					<div class="card-header primary-background text-center">
	  						<p><span class="fa fa-user-plus fa-2x"></span>&nbspLogin</p>
	  					</div>
	  					
	  					<%
	  						Message m = (Message)session.getAttribute("msg");
	  						if(m != null){
	  					%>
	  					<div class="alert <%= m.getCssClass() %>" role="alert">
						  <%= m.getContent() %>
						</div>
						<%
							session.removeAttribute("msg");
	  						}
						%>
	  					
	  					<div class="card-body">
	  						<form action="LoginServlet" method="post">
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input type="email" required name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							    </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input type="password" required name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							  </div>
							  <div class="container text-center">
							  	<button type="submit" class="btn primary-dark-background">Submit</button>
							  </div>
							</form>
	  					</div>
	  				</div>
	  			</div>
	  		</div>
	  	</div>
	  </main>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>