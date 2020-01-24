package com.example.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionClosers {

	public static void closeConnection(Connection c) {
		try {
			c.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void closeStatement(Statement s) {
		try {
			s.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void closeResultSet(ResultSet set) {
		try {
			set.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
