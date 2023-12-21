package com.devpro.vqtshop.controller.customer;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.devpro.vqtshop.controller.BaseController;
import com.devpro.vqtshop.model.Categories;
import com.devpro.vqtshop.model.Role;
import com.devpro.vqtshop.model.User;
import com.devpro.vqtshop.services.RoleService;
import com.devpro.vqtshop.services.UserService;


@Controller
public class GegisterController extends BaseController {
	
	@Autowired 
	private UserService userService;
	@Autowired 
	private RoleService roleService;
	
	@RequestMapping(value = { "/home/register" }, method = RequestMethod.GET)
	public String gegister(final Model model, 
		   				  final HttpServletRequest request, 
		   				  final HttpServletResponse response) {
	
		// đẩy data xuống view qua model
		// trong view có sử dụng spring-form để binding-data
		// data dùng để binding có tên là lienhe
		
		  User data = new User(); 
		  model.addAttribute("User", data);
		 
		
		// đường dẫn tới file view
		return "customer/register"; // -> /WEB-INF/views/customer/index.jsp
	}
	
	@RequestMapping(value = { "/home/register" }, method = RequestMethod.POST) 
	public String lienhe_post_springform(final Model model, 
									   	  final HttpServletRequest request,
									   	  final HttpServletResponse response, 									   	  
									   	  final @ModelAttribute("User") User user									   	  
                                          ) 
	     throws IOException {
		
		Role roleUSER= roleService.getById(2);
		user.addRoles(roleUSER);
		user.setPassword(new BCryptPasswordEncoder(4).encode(user.getPassword()));		
		userService.saveOrUpdate(user);
		

		
		
		//reset FORM
		 User data = new User(); 
		  model.addAttribute("User", data);
		 

		  return "redirect:/register/cart_success";
		//return "customer/dangky";
	}
	
	
	@RequestMapping(value = { "/register/register_success" }, method = RequestMethod.GET)
	public String logsuccess(final Model model, 
						   final HttpServletRequest request, 
						   final HttpServletResponse response) throws IOException {
		return  "customer/register_success"; // -> đường dẫn tới View.
	}

}
