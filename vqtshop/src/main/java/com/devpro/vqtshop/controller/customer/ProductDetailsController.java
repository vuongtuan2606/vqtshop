package com.devpro.vqtshop.controller.customer;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.vqtshop.controller.BaseController;
import com.devpro.vqtshop.model.Brand;
import com.devpro.vqtshop.model.Categories;
import com.devpro.vqtshop.model.Product;
import com.devpro.vqtshop.services.BrandService;
import com.devpro.vqtshop.services.CategoriesService;
import com.devpro.vqtshop.services.ProductService;

@Controller
public class ProductDetailsController extends BaseController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoriesService categoriesService;
	
	@Autowired 
	private BrandService brandService;
	
	@RequestMapping(value = { "/home/product-detail" }, method = RequestMethod.GET)
	public String productDetails(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		
		return "customer/product-detail"; 
}
	
	@RequestMapping(value= {"/home/product-detail/{id}"},method = RequestMethod.GET)
	public String homeProductEdit(final Model model,
				                       final HttpServletRequest request,
				                       final HttpServletResponse respone,
				                       @PathVariable("id") int productId) {
		
		Product products = productService.getById(productId);
		model.addAttribute("productDetail",products);
		
		Categories categorie= categoriesService.getById(products.getCategories().getId());
		model.addAttribute("categorie",categorie);
		
		Brand brand= brandService.getById(products.getBrand().getId());
		model.addAttribute("brand",brand);
		
		List<Product> SimilarProducts = productService.getEntitiesByNativeSQL("SELECT p.* FROM tbl_products p JOIN tbl_category c ON p.category_id = c.id   WHERE c.id = "+ products.getCategories().getId() + " AND p.id <> "+ productId +" ");	
		model.addAttribute("Similar", SimilarProducts);

		return "customer/product-detail";
	}
}	
	



