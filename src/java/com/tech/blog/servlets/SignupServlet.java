package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tech.blog.dao.UserDao;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.entities.User;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
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
		
		String check = request.getParameter("user_t&c");
		if(check == null) {
			out.println("Please accept the terms and Conditions");
			return;
		}
		
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		int gender = (request.getParameter("user_gender").equals("male")) ? 0 : 1;
		String about = request.getParameter("user_about");
		User new_user = new User(name,email,password,gender,about);
		
		Connection con = ConnectionProvider.getConnection();
		if(con != null) {
			UserDao ud = new UserDao(con);
			if(ud.saveUser(new_user) == true)out.println("success");
		}else {
			out.println("error");
		}
	}

}
