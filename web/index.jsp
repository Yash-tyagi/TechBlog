<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
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
    <title>TechBlog!</title>
    
  </head>
  <body>
  
	<!-- Navbar -->
	
	<%@ include file="normalNavBar.jsp" %>
	
	<!-- Banner -->
	
	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-light-background banner-background">
			<div class="container">
			  <h1 class="display-4">Welcome to TechBlog</h1>
			  <p class="lead">Data structure and algorithms is a branch of computer science that deals with creating machine-efficient and optimized computer programs. The term Data Structure refers to the storage and organization of data, and Algorithm refers to the step by step procedure to solve a problem.</p>
			  <hr class="my-4">
			  <p>Data structure and Algorithm (DSA) is applied in all disciplines of software development. DSA is the building block of the software development process. It is not limited to a single programming language. Although programming languages evolve or get dormant over time, DSA is incorporated into all of these languages.</p>
			  <a href="signupPage.jsp" class="btn primary-background text-dark btn-lg"><span class="fa fa-user-plus"></span>Start ! its free</a>
			  <a href="loginPage.jsp" class="btn btn-outline-light primary-background text-dark btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
			</div>
		</div>
	</div>
	
        <!-- main body of the page -->
	
	<div class="container">
		<div class="row mt-4">
			<!-- first col -->
			
			<div class="col-md-4">
				<div class="list-group">
				  <a href="#" onClick="getPosts(0,this)" class="list-group-item list-group-item-success c-link">
				    All Post
				  </a>
				  <!-- categories -->
				  <%
				  	PostDao pd = new PostDao(ConnectionProvider.getConnection());
				  	ArrayList<Category> list = pd.getAllCategories();
				  	
				  	for(Category c : list){
				  
				  %>
				  	<a href="#" onClick="getPosts(<%= c.getCid() %>,this)" class="list-group-item list-group-item-action c-link"><%= c.getName() %></a>
				  <%
				  	}
				  %>
				</div>
			</div>
			
			<!-- second col -->
			
			<div class="col-md-8">
				<!-- posts -->
				<div class="container text-center" id="loader">
					<i class="fa fa-refresh fa-4x fa-spin"></i>
					<h3 class="mt-2">loading...</h3>
				</div>
				<div class="container-fluid" id="post-container">
					
				</div>
			</div>
		</div>
	</div>
	
	<!-- end of the main body -->
        
        
<!--	 cards 
	
	<div class="container">
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-dark">Read more...</a>
			      </div>
			 	</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-dark">Read more...</a>
			      </div>
			 	</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-dark">Read more...</a>
			      </div>
			 	</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-dark">Read more...</a>
			      </div>
			 	</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-dark">Read more...</a>
			      </div>
			 	</div>
			</div>
			<div class="col-md-4">
				<div class="card" style="width: 18rem;">
				  <div class="card-body">
				    <h5 class="card-title">Java Programming</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn primary-background text-dark">Read more...</a>
			      </div>
			 	</div>
			</div>
		</div>
	</div>-->
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
    <script>
  		
  		function getPosts(catId,temp){
  			
  			$("#loader").show();
  			$("#post-container").hide();
  			$(".c-link").removeClass('list-group-item-success');
  			$.ajax({
  				url:"loadPost.jsp",
  				data: {cid : catId},
  				success: function(data,status){
  					console.log(data);
  					$("#loader").hide();
  					$("#post-container").show();
  					$("#post-container").html(data);
  					$(temp).addClass('list-group-item-success');
  				}
  			})
  		}
  	
  		$(document).ready(function(){
  			let allPostRef = $(".c-link")[0];
  			getPosts(0,allPostRef);
  		})
  	</script>
        
  </body>
</html>