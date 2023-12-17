package com.devpro.vqtshop.model;


import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name = "tbl_user")
public class User extends BaseEntity  {
	
	@Column(name = "fullname", length = 100, nullable = false)
	private String fullname;

	@Column(name = "email", length = 100, nullable = false)
	private String email;
	
	@Column(name = "password", length = 100, nullable = false)
	private String password;
	
	@Column(name = "phone", length = 100, nullable = true)
	private String phone;
	
	@Column(name = "shipping_address", length = 1000, nullable = true)
	private String shippingAddress;
	
	
	@ManyToMany(cascade = CascadeType.ALL, 
							  fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_user_roles", 
			   joinColumns = @JoinColumn(name = "user_id"), 
			   inverseJoinColumns = @JoinColumn(name = "roles_id"))
	private Set<Role> roles = new HashSet<Role>();
	
	public void addRoles(Role role ) {
		role.getUsers().add(this);
		roles.add(role);
	}
	public void deleteRole(Role role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}
	

	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "user")
	private Set<SaleOrder> saleOrders = new HashSet<SaleOrder>();
	public void addSaleOrder(SaleOrder saleOrder) {
		saleOrders.add(saleOrder);
		saleOrder.setUser(this);
	}
	public void deleteSaleOrder(SaleOrder saleOrder) {
		saleOrders.remove(saleOrder);
		saleOrder.setUser(null);
	}
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public Set<Role> getRoles() {
		return roles;
	}
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	

	
}
