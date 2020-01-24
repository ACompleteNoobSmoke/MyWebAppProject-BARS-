package com.example.model;

public class Form {

	private int form_id;
	private String f_name;
	private String l_name;
	private String email;
	private String password;
	private String gamer_id;
	private String console;
	private String admin_1;
	private String admin_2;
	private String admin_3;
	private String smessage;
	private String rmessage;
	
	public int getFormID() {
		return form_id;
	}
	public void setFormID(int form_id) {
		this.form_id = form_id;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGamer_id() {
		return gamer_id;
	}
	public void setGamer_id(String gamer_id) {
		this.gamer_id = gamer_id;
	}
	public String getConsole() {
		return console;
	}
	public void setConsole(String console) {
		this.console = console;
	}
	public String isAdmin_1() {
		return admin_1;
	}
	public void setAdmin_1(String admin_1) {
		this.admin_1 = admin_1;
	}
	public String isAdmin_2() {
		return admin_2;
	}
	public void setAdmin_2(String admin_2) {
		this.admin_2 = admin_2;
	}
	public String isAdmin_3() {
		return admin_3;
	}
	public void setAdmin_3(String admin_3) {
		this.admin_3 = admin_3;
	}
	public String getSentMessage() {
		return smessage;
	}
	public void setSentMessage(String smessage) {
		this.smessage = smessage;
	}
	public String getReceivedMessage() {
		return rmessage;
	}
	public void setReceivedMessage(String rmessage) {
		this.rmessage = rmessage;
	}

}
