package com.beans.pkg;

import java.io.Serializable;

public class RegisterBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String username;
	private String email;
	private String password;
	private String first_name;
	private String last_name;
	private String discount_type;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getFirst_Name() {
		return first_name;
	}
	public void setFirst_Name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_Name() {
		return last_name;
	}
	public void setLast_Name(String last_name) {
		this.last_name = last_name;
	}
	public String getDiscount_type() {
		return discount_type;
	}
	public void setDiscount_type(String discount_type) {
		this.discount_type = discount_type;
	}

}
