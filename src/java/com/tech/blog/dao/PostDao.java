package com.tech.blog.dao;

import java.sql.*;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Posts;

public class PostDao {

	
	public Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		
		String query = "select * from category";
		
		try {
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				Category c = new Category(rs.getInt(1),rs.getString(2),rs.getString(3));
				list.add(c);
			}
		} catch (SQLException e) {
			System.out.println("Categories display FAILED !!!");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean addPost(Posts p) {
		String query = "insert into posts(pTitle, pContent, pCode, pPic, cid, uid) values(?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, p.getpTitle());
			ps.setString(2, p.getpContent());
			ps.setString(3, p.getpCode());
			ps.setString(4, p.getpPic());
			ps.setInt(5, p.getCid());
			ps.setInt(6, p.getUid());
			int rowsAffected = ps.executeUpdate();
			
			if(rowsAffected > 0)return true;
			
		} catch (SQLException e) {
			System.out.println("YES I AM IN THIS " + e.getMessage());
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<Posts> getAllPost() {
		
		ArrayList<Posts> list = new ArrayList<>();
		String query = "select * from posts";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				Posts new_post = new Posts(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt(7),rs.getInt(8));
				list.add(new_post);
			}
			
		}catch(Exception e) {
			System.out.println("getAllPostError " + e.getMessage());
		}
		
		return list;
	}
	
	public ArrayList<Posts> getAllPostWithId(int cid){
		ArrayList<Posts> list = new ArrayList<>();
		String query = "select * from posts where cid="+cid;
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				Posts new_post = new Posts(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt(7),rs.getInt(8));
				list.add(new_post);
			}
			
		}catch(Exception e) {
			System.out.println("getAllPostError " + e.getMessage());
		}
		
		return list;
	}
	
	public Posts getAllPostWithPostId(int pid) {
		
		String query = "select * from posts where pid="+pid;
		
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			if(rs.next()) {
				return new Posts(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getInt(7),rs.getInt(8));
			}
			
		}catch(Exception e) {
			System.out.println("getAllPostError " + e.getMessage());
		}
		
		return null;
	}
	
}
