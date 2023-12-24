package com.devpro.vqtshop.controller.administrator;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.devpro.vqtshop.controller.BaseController;
import com.devpro.vqtshop.dto.ContactSearchModel;
import com.devpro.vqtshop.dto.OrderSearchModel;
import com.devpro.vqtshop.model.Contact;
import com.devpro.vqtshop.model.SaleOrder;
import com.devpro.vqtshop.services.ContactService;
import com.devpro.vqtshop.services.PagerData;

@Controller
public class AdminContactController extends BaseController {
	@Autowired ContactService contactService = new  ContactService();

	@RequestMapping(value = { "/admin/contact" }, method = RequestMethod.GET)
	public String adminContact(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		
		ContactSearchModel searchModel = new ContactSearchModel();
		
		searchModel.setKeyword(keyword);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<Contact> contact = contactService.search(searchModel);
		
		model.addAttribute("contact", contact);
		model.addAttribute("searchModel", searchModel);
		
		return "/administrator/contact"; // 
	}
	
	@RequestMapping(value = { "/admin/contact/detail/{contactID}"}, method = RequestMethod.GET)
	public String adminContactDetail(final Model model,
								   final HttpServletRequest request,
								   final HttpServletResponse response,
								   @PathVariable("contactID") int contactID) throws IOException{
		
		Contact contact = contactService.getById(contactID);
		model.addAttribute("contacts", contact);
		
		return "/administrator/contact_detail";						   
	}
}
