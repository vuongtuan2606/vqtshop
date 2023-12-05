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
@Table(name = "tbl_color")
public class ColorProduct extends BaseEntity {
	
	@Column(name = "color_name", length = 200, nullable = false)
	private String color_name;
	
	@Column(name = "description", length = 300, nullable = false)
	private String description;



	
	@OneToMany(cascade = CascadeType.ALL,  
		    fetch = FetchType.LAZY,  		
		    mappedBy = "colorProduct") 		

	private Set<Product> products = new HashSet<Product>(); 
	


	public void addProduct(Product product) {      
		products.add(product);              		   	         
		product.setColorProduct(this);        		       
	}

	public void deleteProduct(Product product) { 
		products.remove(product);         			       
		product.setColorProduct(null);      			       
	}
	
	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}



	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getColor_name() {
		return color_name;
	}

	public void setColor_name(String color_name) {
		this.color_name = color_name;
	}







}