package com.example.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.model.Admin;
import com.example.model.Form;
import com.example.util.ConnectionClosers;
import com.example.util.ConnectionFactory;



public class DAO {
	
	public boolean userexist(String user, String pass) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		final String SQL = "select * from Form where GamerID = ? Or Password = ? ";
		
			try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rset = stmt.executeQuery();
			
			
			if(rset.next()) {
				return true;
			}
			
			
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectionClosers.closeConnection(conn);
				ConnectionClosers.closeStatement(stmt);
			}
			
			return false;
	}
	
	public boolean adminexist(String user, String pass) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		final String SQL = "select * from admintable where AdminName = ? Or Password = ? ";
		
			try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rset = stmt.executeQuery();
			
			
			if(rset.next()) {
				return true;
			}
			
			
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectionClosers.closeConnection(conn);
				ConnectionClosers.closeStatement(stmt);
			}
			
			return false;
	}
	
	public boolean isValid(String user, String pass) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		final String SQL = "select * from Form where GamerID = ? And Password = ? ";
		
			try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rset = stmt.executeQuery();
			
			
			if(rset.next()) {
				return true;
			}
			
			
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectionClosers.closeConnection(conn);
				ConnectionClosers.closeStatement(stmt);
			}
			
			return false;
	}
	
	public boolean isAdminValid(String user, String pass) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		
		final String SQL = "select * from admintable where AdminName = ? And Password = ? ";
		
			try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rset = stmt.executeQuery();
			
			
			if(rset.next()) {
				return true;
			}
		
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectionClosers.closeConnection(conn);
				ConnectionClosers.closeStatement(stmt);
			}
			
			return false;
	}
	
	public Form getUserForm(String user, String pass) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		Form returnUser = null;
	
		final String SQL = "select * from Form where GamerID = ? And Password = ? ";
		
		
		try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rset = stmt.executeQuery();
			
			
			while(rset.next())
			{
				if(rset.getString("GamerID").equals(user)) {
					returnUser = new Form();
					returnUser.setFormID(rset.getInt("Form ID"));
					returnUser.setF_name(rset.getString("First Name"));
					returnUser.setL_name(rset.getString("Last Name"));
					returnUser.setEmail(rset.getString("Email"));
					returnUser.setPassword(rset.getString("Password"));
					returnUser.setGamer_id(rset.getString("GamerID"));
					returnUser.setConsole(rset.getString("Console"));
					returnUser.setAdmin_1(rset.getString("Alaa"));
					returnUser.setAdmin_2(rset.getString("Wayne"));
					returnUser.setAdmin_3(rset.getString("THEBASEDGOD"));
					returnUser.setSentMessage(rset.getString("SentMessage"));
					returnUser.setReceivedMessage(rset.getString("ReceivedMessage"));
				}
				
			}
		
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}
		
		return returnUser;

		
	}
	
	public Admin getAdmin(String user, String pass) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		Admin returnUser = null;
	
		final String SQL = "select * from AdminTable where AdminName = ? And Password = ? ";
		
		
		try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, user);
			stmt.setString(2, pass);
			rset = stmt.executeQuery();
			
			
			while(rset.next())
			{
				if(rset.getString("AdminName").equals(user)) {
					returnUser = new Admin();
					returnUser.setAdmin_id(rset.getString(1));
					returnUser.setPassword(rset.getString(2));
					returnUser.setStatus(rset.getBoolean(3));
					returnUser.setRole(rset.getString(4));
					return returnUser;
				}
				
			}
		
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}
		
		return returnUser;

		
	}

	public boolean saveForm(Form newForm) {	
		Connection conn = null;
		PreparedStatement stmt = null;
	
	
		final String SQL = "insert into Form values (default, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		
		
		try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			stmt.setString(1, newForm.getF_name());
			stmt.setString(2, newForm.getL_name());
			stmt.setString(3, newForm.getEmail());
			stmt.setString(4, newForm.getPassword());
			stmt.setString(5, newForm.getGamer_id());
			stmt.setString(6, newForm.getConsole());
			stmt.setString(7, newForm.isAdmin_1());
			stmt.setString(8, newForm.isAdmin_2());
			stmt.setString(9, newForm.isAdmin_3());
			stmt.setString(10, " ");
			stmt.setString(11, " ");
			stmt.execute();
		
			

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}
		
		return true;
		
	}
	
	public void updateForm(String user, String pass, String message) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
	
		try {
		final String SQL = "Update Form set SentMessage = ? , ReceivedMessage = ? where GamerID = ? ";
		conn = ConnectionFactory.getConnection();
		stmt = conn.prepareStatement(SQL);
		stmt.setString(1, message);
		stmt.setString(2, "");
		stmt.setString(3, user);
		stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}

	}
	
	public void messageSent(String fid, String message) throws SQLException {
		Connection conn = null;
		PreparedStatement stmt = null;
	
		try {
		final String SQL = "Update Form set ReceivedMessage = ? , SentMessage = ? where GamerID = ? ";
		conn = ConnectionFactory.getConnection();
		stmt = conn.prepareStatement(SQL);
		stmt.setString(1, message);
		stmt.setString(2, "");
		stmt.setString(3, fid);
		stmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}

	}
	
	public ArrayList<Form> getForm(HttpServletRequest req, HttpServletResponse resp) {
		ArrayList<Form> forms = new ArrayList<Form>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		final String SQL = "select * from Form";
		
		
		try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			rset = stmt.executeQuery();
			
			
			while(rset.next())
			{
				Form form = new Form();
				form.setFormID(rset.getInt(1));
				form.setF_name(rset.getString(2));
				form.setL_name(rset.getString(3));
				form.setEmail(rset.getString(4));
				form.setPassword(rset.getString(5));
				form.setGamer_id(rset.getString(6));
				form.setConsole(rset.getString(7));
				form.setAdmin_1(rset.getString(8));
				form.setAdmin_2(rset.getString(9));
				form.setAdmin_3(rset.getString(10));
				form.setSentMessage(rset.getString(11));
				form.setReceivedMessage(rset.getString(12));
				forms.add(form);
				
			}
		
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}

		return forms;
	}
	
	public ArrayList<Admin> getAdmin(HttpServletRequest req, HttpServletResponse resp) {
		ArrayList<Admin> admins = new ArrayList<Admin>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rset = null;
		final String SQL = "select * from admintable";
		
		
		try {
			
			conn = ConnectionFactory.getConnection();
			stmt = conn.prepareStatement(SQL);
			rset = stmt.executeQuery();
			
			
			while(rset.next())
			{
				Admin ad = new Admin();
				ad.setAdmin_id(rset.getString(1));
				ad.setPassword(rset.getString(2));
				ad.setStatus(rset.getBoolean(3));
				ad.setRole(rset.getString(4));
				admins.add(ad);
				
			}
		
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}

		return admins;
	}
	
	public boolean approve(String fid, String adName) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
	
		try {
		final String SQL = "Update Form set " + adName + " = ? where GamerID = ? ";
		conn = ConnectionFactory.getConnection();
		stmt = conn.prepareStatement(SQL);
		stmt.setString(1,  "Approved");
		stmt.setString(2, fid);
		stmt.executeUpdate();
		return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}
		
		return false;
	}
	
	public boolean deny(String fid, String adName) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
	
		try {
		final String SQL = "Update Form set " + adName + " = ? where GamerID = ? ";
		conn = ConnectionFactory.getConnection();
		stmt = conn.prepareStatement(SQL);
		stmt.setString(1,  "Denied");
		stmt.setString(2, fid);
		stmt.executeUpdate();
		return true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionClosers.closeConnection(conn);
			ConnectionClosers.closeStatement(stmt);
		}
		
		return false;
	}
	
}
