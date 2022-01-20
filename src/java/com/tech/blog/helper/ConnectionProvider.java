package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
	
	private static Connection con;
	public static Connection getConnection() {
		try {
//			Properties pro = new Properties();
//			FileInputStream fis = new FileInputStream(getClass().getClassLoader().getResourceAsStream("/db.properties"));
//			
//			pro.load(fis);
//			
//			String jdbcUrl = pro.getProperty("url");
//			String user = pro.getProperty("user");
//			String pwd = pro.getProperty("pass");
			String jdbcUrl = "jdbc:mysql://localhost:3306/techblog";
			String user = "root";
			String pwd = "toor";
			if(con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection(jdbcUrl,user,pwd);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	
	
}
