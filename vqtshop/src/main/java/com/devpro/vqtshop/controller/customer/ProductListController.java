package com.devpro.vqtshop.controller.customer;


import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.vqtshop.controller.BaseController;
import com.devpro.vqtshop.dto.ProductSearchModel;
import com.devpro.vqtshop.model.Categories;
import com.devpro.vqtshop.model.Contact;
import com.devpro.vqtshop.model.Product;
import com.devpro.vqtshop.services.CategoriesService;
import com.devpro.vqtshop.services.ContactService;
import com.devpro.vqtshop.services.PagerData;
import com.devpro.vqtshop.services.ProductService;

@Controller
public class ProductListController extends BaseController {
	
	@Autowired 
	private ProductService productService; 
	
	@Autowired 
	private CategoriesService categoriesService;
	
	
	@RequestMapping(value = { "/home/productSearch" }, method = RequestMethod.GET)
	public String ProductSearch(final Model model, 
	   				   final HttpServletRequest request, 
	   				   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");

		
		ProductSearchModel searchModel = new ProductSearchModel();
		
		searchModel.setKeyword(keyword);
		
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<Product> products = productService.search(searchModel);
		
		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		
		// đường dẫn tới file view
		return "customer/productsSearch"; // -> /WEB-INF/views/customer/index.jsp
       }
	

	@RequestMapping(value = { "/home/listproduct/{cateID}" }, method = RequestMethod.GET)
	public String contact(final Model model, 
										    final HttpServletRequest request, 
						   				    final HttpServletResponse response,
						   				 @PathVariable("cateID") int cateID)  throws IOException {
		

		List<Product> product1 = productService.getEntitiesByNativeSQL("SELECT * FROM vqtshopdb.tbl_products where category_id =" + cateID +" ;");
		
		model.addAttribute("product1", product1);
		
		
		return "customer/productsList"; // 
	}
	

	
}
