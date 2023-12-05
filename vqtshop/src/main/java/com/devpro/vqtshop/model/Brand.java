package com.devpro.vqtshop.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_brand")
public class Brand extends BaseEntity {
	
	@Column(name = "brand_name", length = 200, nullable = false)
	private String brand_name;
	
	@Column(name = "description", length = 300, nullable = false)
	private String description;



	
	@OneToMany(cascade = CascadeType.ALL,  
		    fetch = FetchType.LAZY,  		
		    mappedBy = "brand") 		

	private Set<Product> products = new HashSet<Product>(); 
	
	public void addProduct(Product product) {      
		products.add(product);              		   	         
		product.setBrand(this);        		       
	}

	public void deleteProduct(Product product) { 
		products.remove(product);         			       
		product.setBrand(null);      			       
	}
	
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}



public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}








}