package com.devpro.vqtshop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity // sẽ được mapping với bảng contact các thuộc tính chung / tạo ra class BaseEntity: chứa tất cả các colum trong : vd :id, status, created
@Table(name ="tbl_contact") // cần giống tên trong bảng của sql

public class Contact extends BaseEntity {

	//@Column để biết xem cột nào trong bảng sql
	
	//sf:input path="fullName" placeholder="Nhập Họ tên của bạn" type="text" class="form-control form-control-lg" value="" name="fullName" id="customer_FullName" required="" data-validation-error-msg="Không được để trống" data-validation="required"></sf:input>
	@Column(name="fullname", length= 100, nullable = false)
	private String fullname ; // property
	
	@Column(name="email", length= 100, nullable = false)
	private String email;// property
	
	@Column(name="request", length= 100, nullable = false)
	private String request;// property
	
	@Column(name="description", length= 1000, nullable = false)
	private String  description;// property

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}