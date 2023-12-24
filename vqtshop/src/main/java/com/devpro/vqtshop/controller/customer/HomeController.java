package com.devpro.vqtshop.controller.customer;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.vqtshop.controller.BaseController;

import com.devpro.vqtshop.model.Product;
import com.devpro.vqtshop.services.ProductService;

//1. Báo cho spring mvc biết đây là Controller
//2. Tạo instance của controller này <=> HomeController hc = new HomeController()
//hc sẽ được lưu vào trong spring-container(kiểu dữ liệu List, Map)
@Controller
public class HomeController extends BaseController  {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = { "/home" }, method = RequestMethod.GET)
	public String home(final Model model, 
						   				 final HttpServletRequest request, 
						   				 final HttpServletResponse response) {
		
	
	
		
		List<Product> productsHot = productService.getEntitiesByNativeSQL("SELECT * FROM vqtshopdb.tbl_products where is_hot = 1;");
		model.addAttribute("productsHot", productsHot);
		
		// đường dẫn tới file view
		return "customer/home"; // -> /WEB-INF/views/customer/index.jsp
	

	}
}