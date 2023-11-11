package com.devpro.vqtshop.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_products_images")
public class ProductImages extends BaseEntity {
	
	@Column(name = "title", nullable = false)
	private String title;

	@Column(name = "path", nullable = false)
	private String path;

	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "products_id")
	private Product product_images;


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}


	public Product getProduct_images() {
		return product_images;
	}


	public void setProduct_images(Product product_images) {
		this.product_images = product_images;
	}



}