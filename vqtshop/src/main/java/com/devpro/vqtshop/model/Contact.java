package com.devpro.vqtshop.model;

public class Contact {
	private String fullName;
	private String email;
	private String message;
	private String describe;
	
	public Contact() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Contact(String fullName, String email, String message, String describe) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.message = message;
		this.describe = describe;
	}

	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
}
