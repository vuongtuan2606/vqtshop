package com.devpro.vqtshop.dto;


// class dùng bên home controller
public class Employee {

	private Integer id;  //property: có 2 hàm get và set
	
	private String name; //property: có 2 hàm get và set

	public Employee(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
