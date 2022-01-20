<%@page import="com.tech.blog.dao.LikeDao"%>
<%@ page import="com.tech.blog.entities.Message" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tech.blog.entities.Category" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.entities.Posts" %>
<%@ page import="com.tech.blog.entities.User" %>

<div class="row">

<% 
        User user = (User)session.getAttribute("curr_user");
	int cid = Integer.parseInt(request.getParameter("cid"));
	PostDao pd = new PostDao(ConnectionProvider.getConnection());
	ArrayList<Posts> list = (cid == 0) ? pd.getAllPost() : pd.getAllPostWithId(cid);
	if(list.isEmpty()){
		out.println("<h3 class='display-3 text-center'>No post in this Category!!</h3>");
		return;
	}
	for(Posts p : list){
            int likeCount = new LikeDao(ConnectionProvider.getConnection()).countLikeOnPost(p.getPid());
	
%>
	<div class="col-md-6 mt-2">
		<div class="card">
			<div class="card-body">
				<b><%= p.getpTitle() %></b>
				<p><%= p.getpContent() %></p>
			</div>
			
			<div class="card-footer primary-background">
				<div class="btn btn-outline-success btn-sm"><i class="fa fa-thumbs-o-up"> <span><%= likeCount %></span></i></div>
				<div href="#!" class="btn btn-outline-success btn-sm"> <i class="fa fa-commenting-o"> <span>20</span></i></div>
				<a href="showBlogPage.jsp?pid=<%= p.getPid() %>" class="btn btn-outline-success btn-sm">read more..</a>
			</div>
			
		</div>
	</div>
<% 
	}
%>

</div>