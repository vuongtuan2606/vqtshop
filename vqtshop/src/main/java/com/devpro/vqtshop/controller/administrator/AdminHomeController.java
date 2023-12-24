package com.devpro.vqtshop.controller.administrator;


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
import com.devpro.vqtshop.model.SaleOrder;
import com.devpro.vqtshop.model.User;
import com.devpro.vqtshop.services.ProductService;
import com.devpro.vqtshop.services.SaleOrderService;
import com.devpro.vqtshop.services.UserService;

@Controller
public class AdminHomeController extends BaseController{
	
	@Autowired
	UserService userService = new UserService();
	
	@Autowired
	SaleOrderService saleOrderService = new SaleOrderService();
	
	@Autowired
	ProductService productService = new  ProductService();

	
	@RequestMapping(value = { "/admin/home" }, method = RequestMethod.GET)
	public String adminUser(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response) {
		
	
		long users = userService. getUserCount() ;
		model.addAttribute("users", users);
		
		long product = productService.getProductsCount();
		model.addAttribute("product", product);
		
		long order = saleOrderService.getOrderCount();
		model.addAttribute("orders", order);
		
		List<User> user = userService.getEntitiesByNativeSQL("SELECT *\r\n"
																								+ "FROM vqtshopdb.tbl_user\r\n"
																								+ "ORDER BY created_date DESC\r\n"
																								+ "LIMIT 4;");
		model.addAttribute("listUser", user);
		
		List<SaleOrder> saleorder = saleOrderService.getEntitiesByNativeSQL("SELECT *\r\n"
				+ "FROM vqtshopdb.tbl_saleorder\r\n"
				+ "ORDER BY created_date DESC\r\n"
				+ "LIMIT 3;");
		
		model.addAttribute("listSaleOrder", saleorder);
		return "/administrator/admin_home";
	}
	

	
}
