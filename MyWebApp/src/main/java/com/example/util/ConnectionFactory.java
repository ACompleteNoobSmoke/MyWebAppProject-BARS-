package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	
	public final static String dbuser = "root";
	public final static String dbpassword = "codingroot1!";
	public final static String dburl = "jdbc:mysql://localhost:3306/BARSSQL?autoReconnect=true&useSSL=false";
	static Connection con = null;
	
	public static Connection getConnection() {
		try {
		
		con = DriverManager.getConnection(dburl, dbuser, dbpassword);
		return con;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}

}
