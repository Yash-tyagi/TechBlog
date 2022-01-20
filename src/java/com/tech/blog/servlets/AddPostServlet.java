package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.Posts;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class AddPostServlet
 */


@WebServlet("/AddPostServlet") 
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	PrintWriter out = response.getWriter();
    	
    	HttpSession hs = request.getSession();
    	User user = (User) hs.getAttribute("curr_user");
    	int cid = Integer.parseInt(request.getParameter("cid"));
    	System.out.println("2");
    	String pTitle = request.getParameter("pTitle");
    	
    	System.out.println("3");
    	String pContent = request.getParameter("pContent");
    	
//    	Part part = request.getPart("pPic");
//    	String picName = part.getSubmittedFileName();
    	Posts new_post = new Posts(pTitle, pContent, null, null, cid, user.getId());
//    	System.out.println(new_post);
    	PostDao pd = new PostDao(ConnectionProvider.getConnection());
    	boolean isPosted = pd.addPost(new_post);
    	
    	Message msg;
    	
    	if(isPosted == true) {
    		msg = new Message("successfully posted !!","success","alert-success");
    	}else {
    		msg = new Message("something went wrong...","error","alert-danger");
    	}

    	hs.setAttribute("msg", msg);
    	
    	response.sendRedirect("profile.jsp");
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request,response);
	}

}

