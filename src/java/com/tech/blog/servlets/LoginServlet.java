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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String user_email = request.getParameter("user_email");
		String user_password = request.getParameter("user_password");

		Connection con = ConnectionProvider.getConnection();
		UserDao ud = new UserDao(con);
		User curr_user = ud.getUser(user_email, user_password);
		
		if(curr_user == null) {

			Message m = new Message("Invalid details ! try with other credentials..","error","alert-danger");
			HttpSession hs = request.getSession();
			hs.setAttribute("msg", m);
			
			response.sendRedirect("loginPage.jsp");
			
		}else {
			System.out.println("User Login Successfull!!");
			HttpSession hs = request.getSession();
			hs.setAttribute("curr_user", curr_user);
			response.sendRedirect("profile.jsp");
		}
		
	}

}
