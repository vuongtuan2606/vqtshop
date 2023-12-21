package com.devpro.vqtshop.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class loginController extends BaseController{

	@RequestMapping(value = { "/login" }, method = RequestMethod.GET)
	public String login(final Model model, 
				   				   final HttpServletRequest request, 
				   				   final HttpServletResponse response)
	   						   	   throws IOException{

		// đường dẫn tới file view
		return "login"; // -> /WEB-INF/views/customer/index.jsp
    }
	

}