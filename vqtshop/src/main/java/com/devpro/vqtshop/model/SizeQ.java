package com.devpro.vqtshop.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_size")
public class SizeQ extends BaseEntity  {
	
	@Column(name = "size_name",length = 100, nullable = false)
	private String name_size;

	@ManyToMany(cascade = CascadeType.ALL, 
						   	  fetch = FetchType.EAGER, 
							  mappedBy = "sizeQ")
	private Set<Product> product  = new HashSet<Product>();

	
	public void addProduct(Product p) {
		p.getSizeQ().add(this);
		product.add(p);
	}
	public void deleteProducts(Product p) {
		p.getSizeQ().remove(this);
		product.remove(p);
	}
	
	
	
	public String getName_size() {
		return name_size;
	}

	public void setName_size(String name_size) {
		this.name_size = name_size;
	}

	public Set<Product> getProduct() {
		return product;
	}

	public void setProduct(Set<Product> product) {
		this.product = product;
	}
	
	
	
	
	
	
	

	




}

