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
@Table(name = "tbl_category")
public class Categories extends BaseEntity {
	@Column(name = "name", length = 200, nullable = false)
	private String name;

	@Column(name = "description", length = 200, nullable = false)
	private String description;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	@OneToMany(cascade = CascadeType.ALL,  // nếu thực hiện xóa  categories thì các sản phẩm trùng với categories đó cũng bị xóa theo
						    fetch = FetchType.LAZY,  		// khi lấy categories mà k lấy các sản phẩm liên quan đến categories đấy nếu muốn lấy phải viết câu lệch truy vấn
						    mappedBy = "categories") 		// trỏ tới property trong bên Product
	
	private Set<Product> products = new HashSet<Product>(); //OneToMany phải có kiểu set( số nhiều)
	
	// bất cứ ở quan hệ one to many cần thêm 2 hàm add và delete
	public void addProduct(Product product) {      // muốn add sản phẩm (product) vào categories 
		products.add(product);              		   	         // sản phẩm đấy được add vào Set products
		product.setCategories(this);        		         // product phải thuộc categories đấy
	}
	
	public void deleteProduct(Product product) { // muốn delete sản phẩm (product)  khỏi categories 
		products.remove(product);         			        // thì phải remove khỏi Set products
		product.setCategories(null);      			        // product phải Set Categories là Null k còn categories  nào nữa
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	
}
