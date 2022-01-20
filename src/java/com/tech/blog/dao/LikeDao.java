package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	
	private Connection con;
	
	public LikeDao(Connection con){
		this.con = con;
	}
	
	public boolean doLike(int pid, int uid) {
		String query = "insert into likes(pid,uid) values(?,?)";
		
		try {
			
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			int rowsAffected = pst.executeUpdate();
			
			if(rowsAffected > 0)return true;
			
		}catch(Exception e) {
			System.out.println("do like exception : "+e.getMessage());
		}
		
		return false;
		
	}
	
	public int countLikeOnPost(int pid) {
			String query = "select count(*) from likes where pid=?";
			int likeCount = 0;
			try {
				
				PreparedStatement pst = con.prepareStatement(query);
				
				pst.setInt(1, pid);
				
				ResultSet rs = pst.executeQuery();
				
				if(rs.next()) {
					likeCount = rs.getInt(1);
				}
				
			}catch(Exception e) {
				System.out.println("do like exception : "+e.getMessage());
			}
			
			return likeCount;
	}
	
	public boolean undoLike(int lid) {
		String query = "delete from likes where lid=?";
		
		try {
			
			PreparedStatement pst = con.prepareStatement(query);
			
			pst.setInt(1, lid);
			
			int rowsAffected = pst.executeUpdate();
			
			if(rowsAffected > 0)return true;
			
		}catch(Exception e) {
			System.out.println("do like exception : "+e.getMessage());
		}
		
		return false;
	}
	
	public synchronized boolean isLikedByUser(int uid, int pid) {
		String query = "select * from likes where pid=? and uid=?";
		PreparedStatement pst; 
		ResultSet rs; 
		try {
			
			pst = con.prepareStatement(query);
			
			pst.setInt(1, pid);
			pst.setInt(2, uid);
			
			rs = pst.executeQuery();
			
			if(rs.next()) {
				undoLike(rs.getInt(1));
				return true;
			}
			
		}catch(Exception e) {
			System.out.println("do like exception : "+e.getMessage());
		}
		
		doLike(pid,uid);
		return false;
	}

}
