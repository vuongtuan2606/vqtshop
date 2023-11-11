package com.devpro.vqtshop.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_size")
public class ProductsSize extends BaseEntity {

	@Column(name = "size_name", nullable = false)
	private String size_name;

	
	@ManyToMany(cascade = CascadeType.ALL, 
		   	  fetch = FetchType.EAGER, 
			  mappedBy = "_productsSize")
	private Set<Product> _product = new HashSet<Product>();


	public void addProductsSize(Product product) {
		product.get_productsSize().add(this);
		_product.add(product);
	}
	public void deleteProductsSize(Product product) {
		product.get_productsSize().remove(this);
		_product.remove(product);
	}
	
	
	public String getSize_name() {
		return size_name;
	}
	public void setSize_name(String size_name) {
		this.size_name = size_name;
	}
	public Set<Product> get_product() {
		return _product;
	}
	public void set_product(Set<Product> _product) {
		this._product = _product;
	}
	
}
