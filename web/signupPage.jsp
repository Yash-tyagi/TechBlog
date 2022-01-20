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
	
    <title>Signup Page</title>
    
  </head>
  <body>
	
	<!-- Navbar -->
	
	<%@ include file="normalNavBar.jsp" %>
	
	<main class="primary-light-background banner-background" style="padding:80px">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header text-center primary-background">
							<p><span class="fa fa-user-circle fa-2x"></span>&nbspSignup</p>	
						</div>
						<div class="card-body">
							<form id="signup-form-id" action="SignupServlet" method ="post">
							  
							  <div class="form-group">
							    <label for="user_name">User Name</label>
							    <input type="text" name = "user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
							    </div>
							  
							  
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input type="email" name = "user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
							    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
							  </div>
							  
							  
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input type="password" name = "user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputRePassword1">Re-enter Password</label>
							    <input type="password" class="form-control" id="exampleInputRePassword1" placeholder="Re-enter Password">
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputRePassword1">Select Gender</label>
							    <br>
								<input type="radio" id="gender" name="user_gender" value="male"> Male
								<input type="radio" id="gender" name="user_gender" value="female"> female
							  </div>
							  
							  <div class="form-group">
							  	<textarea name="user_about" class="form-control" cols="30" rows="5" placeholder="describe yourself in few words!!"></textarea>
							  </div>
						  
							  <div class="form-check">
							    <input type="checkbox" name="user_t&c" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
							  </div><br>
							  <button type="submit" class="btn primary-dark-background">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/myjs.js"></script>
    
<!--    <script>
        $(document).ready(function(){
            $('#signup-form-id').on("submit",function(event){
                event.preventDefault();
                let form = new FormData(this);
                console.log("form",form);
                // now requesting to server...

                $.ajax({
                        type:'POST',
                        url:'SignupServlet',
                        data: form,
                        success: function(data){
                                if(data.trim() === "success")swal("Good job!", "Signed up successfully!!", "success");
                                else swal("Oops!", "something went wrong...", "error"); 
                                console.log(data);
                        },
                        error: function(error){
                                //failed...
                        },
                        processData: false,
                        contentType: false
                })
            })
        })
    </script>-->
    
  </body>
</html>



