package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out = response.getWriter();
//		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("updated_name");
		String email = request.getParameter("updated_email");
		String password = request.getParameter("updated_password");
		String about = request.getParameter("updated_about");
		
		HttpSession hs = request.getSession();
		User user = (User)hs.getAttribute("curr_user");
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		
		UserDao u = new UserDao(ConnectionProvider.getConnection());
		boolean isUpdated = u.updateUser(user);
		Message m;
		if(isUpdated) {
			System.out.print("successfully updated!!");
			m = new Message("Hurrah!! Details updated","success","alert-success");
		}else {
			System.out.println("Something went wrong..");
			m = new Message("Something went wrong..","error","alert-danger");
		}
		
		hs.setAttribute("msg", m);
		
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
