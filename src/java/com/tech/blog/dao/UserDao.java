package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class UserDao {
	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	// method to insert user to database...
	
	public boolean saveUser(User u) {
		boolean isUpdated = false;
		String query = "insert into user (name,email,password,gender,about) values(?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setInt(4, u.getGender());
			ps.setString(5, u.getAbout());
			
			int rows = ps.executeUpdate();
			if(rows >= 1)isUpdated = true;
			
			System.out.println("rows updated : "+ rows);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isUpdated;
		
	}
	
	public User getUser(String email, String password) {
		if(con == null)return null;
		
		String query = "select * from user where email=? and password=?";
		
		PreparedStatement ps;
		User curr_user = null;
		try {
			ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				curr_user = new User();
				curr_user.setId(rs.getInt(1));
				curr_user.setName(rs.getString(2));
				curr_user.setEmail(rs.getString(3));
				curr_user.setPassword(rs.getString(4));
				curr_user.setGender(rs.getInt(5));
				curr_user.setAbout(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return curr_user;
	}
	
	public User getUserByUserId(int id) {
		if(con == null)return null;
		
		String query = "select * from user where id=?";
		
		PreparedStatement ps;
		User curr_user = null;
		try {
			ps = con.prepareStatement(query);
			ps.setInt(1,id);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				curr_user = new User();
				curr_user.setId(rs.getInt(1));
				curr_user.setName(rs.getString(2));
				curr_user.setEmail(rs.getString(3));
				curr_user.setPassword(rs.getString(4));
				curr_user.setGender(rs.getInt(5));
				curr_user.setAbout(rs.getString(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return curr_user;
	}
	
	public boolean updateUser(User user) {
		int id = user.getId();
		String name = user.getName(); 
		String email = user.getEmail();
		String password = user.getPassword();
		String about = user.getAbout();
		String query = "update user set name=?, email=?, password=?, about=? where id=?";
		
		System.out.println("query is ---- " + query );
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, about);
			ps.setInt(5, id);
			
			int rowsAffected = ps.executeUpdate();
			
			if(rowsAffected > 0)
				return true;
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
				
		return false;
		
	}
	
}
