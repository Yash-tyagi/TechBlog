<%@ page import="com.tech.blog.entities.User" %>
<%@ page errorPage="errorPage.jsp" %>
<%

	User user = (User)session.getAttribute("curr_user");
	
	if(user == null){
		response.sendRedirect("loginPage.jsp");
	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="com.tech.blog.entities.Message" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tech.blog.entities.Category" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Posts" %>
<%@ page import="com.tech.blog.dao.UserDao" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>

<%
	int postId = Integer.parseInt(request.getParameter("pid"));
	Posts post = new PostDao(ConnectionProvider.getConnection()).getAllPostWithPostId(postId);
	
	String postUserName = new UserDao(ConnectionProvider.getConnection()).getUserByUserId(post.getUid()).getName();
        
        int likeCount = new LikeDao(ConnectionProvider.getConnection()).countLikeOnPost(postId);
	
%>
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
    <title><%= post.getpTitle() %></title>
    
    <style>
    	.post-title{
    		font-weight: 100;
    		font-size: 30px;
    	}
    	.post-content{
    		font-weight: 100px;
    		font-size: 25px;
    	}
    	p.post-user-info{
			font-size: 20px;
    	}
    	p.post-date{
    		font-style: italic;
    		font-weight: bold;
    	}
    	.author-date-detail-row{
    		border: 1px solid #e2e2e2;
    		border-radius: 5px;
    		padding-top: 10px;
    	}
    	
    </style>
    
  </head>
  <body>
      	<!-- navbar -->
	
	<nav class="navbar navbar-expand-lg navbar-light primary-dark-background">
	  <a class="navbar-brand" href="index.jsp"><span class="fa fa-bullseye"></span>TechBlog</a>
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	
	  <div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="profile.jsp"><span class="fa fa-user-circle"></span>Learn_with_yash <span class="sr-only">(current)</span></a>
	      </li>
	      
	      <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	          <span class="fa fa-plus-circle"></span>Categories
	        </a>
	        
	        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
	          <a class="dropdown-item" href="#">Programming Language</a>
	          <a class="dropdown-item" href="#">Project Implementation</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Data Structure</a>
	        </div>
	        
	        <li class="nav-item">
	        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span>Contact</a>
	      	</li>
	      	
	      	<li class="nav-item">
	        <a class="nav-link" data-toggle="modal" data-target="#do-post-modal" href="#"><span class="fa fa-edit"></span>do POST</a>
	      	</li>
	      	
	      </li>
	    </ul>
		
		<ul class="navbar-nav mr-right" >
			<li class="nav-item">
	        <a href="#!" class="nav-link" data-toggle="modal" data-target="#profileModal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
	      	</li>
	      	<li class="nav-item">
	        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span>Logout</a>
	      	</li>
		</ul>	    

	  </div>
	</nav>
	
	<!-- end of nav bar -->
	
	<div class="container">
	
	<div class="card mt-3">
		<div class="card-header primary-background">
			<h3 class="post-title"><%= post.getpTitle() %></h3>
		</div>
		<div class="card-body">
			<p class="post-content"><%=post.getpContent() %></p>
			<br>
			<br>
			<div class="post-code">
				<pre><%= post.getpCode() %></pre>
			</div>
			
			<div class="row author-date-detail-row">
				<div class="col-md-8">
					<p class="post-user-info">author: <a href="#!"><%= postUserName %></a></p>	
				</div>
				<div class="col-md-4">
					<p class="post-date">posted on: <%= post.getpDate().toString() %>
				</div>
			</div>
		</div>
		<div class="card-footer primary-background">
                    <div onClick="doLike(<%= post.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-success btn-sm"><i class="fa fa-thumbs-o-up"> <span class="like-counter"><%= likeCount%></span></i></div>
                    <a href="#!" class="btn btn-outline-success btn-sm"> <i class="fa fa-commenting-o"> <span>20</span></i></a>
		</div>
                <!--Facebook Comments Plugin-->
        </div>
	
	</div>
	
	<!-- profile-modal -->
	
	<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header primary-background">
	        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <div class="container">
	        	<h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
	        	
	        	<!-- details -->
	        	<div id="profile-details">
		        	<table class="table">
					  <tbody>
					    <tr>
					      <th scope="row">ID: </th>
					      <td><%= user.getId() %></td>
					    </tr>
					    <tr>
					      <th scope="row">email:</th>
					      <td><%= user.getEmail() %></td>
					    </tr>
					    <tr>
					      <th scope="row">gender:</th>
					      <td><%= user.getGender() == 0 ? "male" : "female" %></td>
					    </tr>
					    <tr>
					      <th scope="row">status:</th>
					      <td><%= user.getAbout() %></td>
					    </tr>
					  </tbody>
					</table>
				</div>
				
				<!-- edit profile -->
				
				<div id="profile-edit" style="display:none;">
					<h3>edit your profile...</h3>
					<form action="UpdateUserServlet" method="post">
						<table class="table">
						  <tbody>
						    <tr>
						      <th scope="row">ID: </th>
						      <td><%= user.getId() %></td>
						    </tr>
						    <tr>
						      <th scope="row">username:</th>
						      <td><input type="text" class="form-control" name="updated_name" value=<%= user.getName() %>></td>
						    </tr>
						    <tr>
						      <th scope="row">email:</th>
						      <td><input type="email" class="form-control" name="updated_email" value=<%= user.getEmail() %>></td>
						    </tr>
						    <tr>
						      <th scope="row">password:</th>
						      <td><input type="password" class="form-control" name="updated_password" value=<%= user.getPassword() %>></td>
						    </tr>
						    <tr>
						      <th scope="row">gender:</th>
						      <td><%= user.getGender() == 0 ? "male" : "female" %></td>
						    </tr>
						    <tr>
						      <th scope="row">status:</th>
						      <td><textarea rows="3" class="form-control" name="updated_about"><%= user.getAbout() %></textarea></td>
						    </tr>
						  </tbody>
						</table>
					
						<!-- submit button to save the updated details -->
						
						<div class="container text-center">
							<button type="submit" class="btn primary-dark-background text-dark btn-outline-dark">Submit</button>
						</div>
					</form>
				</div>
	    
	        </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" id="edit-profile-btn" class="btn btn-outline-dark primary-background text-dark">Edit</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- end of profile-modal -->
	
	<!-- add Post Modal -->
	
	<!-- Modal -->
	<div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">ADD ! POST</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        
	        <form id="add-post-form" action="AddPostServlet" method="post">
	        	<div class="form-group">
	        		<select class="form-control" name="cid">
	        			<option selected disabled>---Select Category---</option>
	        			
	        			<%
	        				PostDao pd = new PostDao(ConnectionProvider.getConnection());
	        				ArrayList<Category> list = pd.getAllCategories();
	        				 
	        				for(Category c : list){
	        			%>
	        				<% System.out.println(c.getCid()); %>
	        				<option value=<%= c.getCid() %>><%= c.getName() %></option>
						<%
	        				}
						%>
	        		</select>
	        	</div>
	        	<div class="form-group">
	        		<input type="text" name="pTitle" class="form-control" placeholder="enter post title">
	        	</div>
	        	
	        	<div class="form-group">
	        		<textarea rows="5" class="form-control" name="pContent" placeholder="Enter your content..."></textarea>
	        	</div>
	        	
	        	<div class="form-group">
	        		<label>Select your pic..</label>
	        		<br>
	        		<input type="file" name="pPic">
	        	</div>
	        	
	        	<div class="container text-center">
	        		<button type="submit" class="btn btn-outline-dark mt-3">Save Post</button>
	        	</div>
	        </form>
	        	
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- end of Post Modal -->
	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript" src="js/myjs.js"></script>
  	
  	<script>
  		$(document).ready(function(){
  			
  			let editStatus = false;
  			$('#edit-profile-btn').click(function(){
  				if(editStatus == false){
					$('#profile-details').hide();
					$('#profile-edit').show();
					$(this).text("Back");
					editStatus = true;
  				}else{
  					$('#profile-edit').hide();
  					$('#profile-details').show();
					$(this).text("Edit");
					editStatus = false;
  				}
  			})
  		})
  	</script>
	
  </body>
</html>