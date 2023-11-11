package com.devpro.vqtshop.model;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


// các bước quan hệ 1-N: định nghĩa bên nhiều trước -> định nghĩa khóa ngoài -> đến bên ít -> bên ít  cần thêm 2 hàm add và delete
@Entity
@Table(name = "tbl_products")
public class Product extends BaseEntity {

	@Column(name = "title", length = 1000, nullable = false)
	private String title;

	@Column(name = "price", precision = 13, scale = 2, nullable = false)
	private BigDecimal price;
    
	// tương ứng trong sql là: type Decimal(13,2)
	@Column(name = "price_sale", precision = 13, scale = 2, nullable = true)
	private BigDecimal priceSale;
	
	@Column(name = "short_description", length = 3000, nullable = false)
	private String shortDes;
    
	// tương ứng trong sql là : type longtex
	@Lob  // trường dữ liệu lớn
	@Column(name = "detail_description", nullable = false, columnDefinition = "LONGTEXT")
	private String details;
	
	@Column(name = "avatar",length = 200, nullable = true)
	private String avatar;

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	@Column(name = "is_hot", nullable = true)
	private Boolean isHot = Boolean.FALSE;

	
	//	bảng product có khóa ngoài là :category_id lên là bảng nhiều
	@ManyToOne(fetch = FetchType.EAGER) // EAGER nếu lấy sản phẩm A thì lấy các cái liên quan
	@JoinColumn(name = "category_id")       // tên khóa ngoài 
	private Categories categories;                 // property

	
	
	@ManyToMany(cascade = CascadeType.ALL, 
			  fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_products_size", 
	joinColumns = @JoinColumn(name = "products_id"), 
	inverseJoinColumns = @JoinColumn(name = "size_id"))
	private Set<ProductsSize> _productsSize = new HashSet<ProductsSize>();
	
	public void addProductsSize(ProductsSize size ) {
		size.get_product().add(this);
		_productsSize.add(size);
	}


	public void deleteProductsSize(ProductsSize size) {
		size.get_product().remove(this);
		_productsSize.remove(size);
	}

	
	@OneToMany(cascade = CascadeType.ALL,  
							fetch = FetchType.EAGER,  		
							mappedBy = "product_images") 		
	private Set<ProductImages> productImages= new HashSet<ProductImages>(); 

	// bất cứ ở quan hệ one to many cần thêm 2 hàm add và delete
	public void addProductImages(ProductImages Images ) {    
		productImages.add(Images);              		   	        
		Images.setProduct_images(this);        		         
	}
	
	public void deleteProductImages(ProductImages Images ) { 
		productImages.remove(Images);         			      
		Images.setProduct_images(null);      			      
	}
	
	


	
	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public BigDecimal getPrice() {
		return price;
	}


	public void setPrice(BigDecimal price) {
		this.price = price;
	}


	public BigDecimal getPriceSale() {
		return priceSale;
	}


	public void setPriceSale(BigDecimal priceSale) {
		this.priceSale = priceSale;
	}


	public String getShortDes() {
		return shortDes;
	}


	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}


	public String getDetails() {
		return details;
	}


	public void setDetails(String details) {
		this.details = details;
	}


	public String getAvatar() {
		return avatar;
	}


	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}


	public String getSeo() {
		return seo;
	}


	public void setSeo(String seo) {
		this.seo = seo;
	}


	public Boolean getIsHot() {
		return isHot;
	}


	public void setIsHot(Boolean isHot) {
		this.isHot = isHot;
	}


	public Categories getCategories() {
		return categories;
	}


	public void setCategories(Categories categories) {
		this.categories = categories;
	}
	
	
	public Set<ProductsSize> get_productsSize() {
		return _productsSize;
	}


	public void set_productsSize(Set<ProductsSize> _productsSize) {
		this._productsSize = _productsSize;
	}


	public Set<ProductImages> getProductImages() {
		return productImages;
	}

	public void setProductImages(Set<ProductImages> productImages) {
		this.productImages = productImages;
	}
}
