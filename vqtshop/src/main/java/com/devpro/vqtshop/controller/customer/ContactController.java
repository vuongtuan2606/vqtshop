package com.devpro.vqtshop.controller.customer;


import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.vqtshop.controller.BaseController;
import com.devpro.vqtshop.model.Contact;

@Controller
public class ContactController extends BaseController {

	@RequestMapping(value = { "/contact" }, method = RequestMethod.GET)
	public String contact(final Model model, 
										    final HttpServletRequest request, 
						   				    final HttpServletResponse response) {
		
		// đẩy data xuống view qua model
		// trong view có sử dụng spring-form để binding-data
		// data dùng để binding có tên là Contact
		Contact data = new Contact();
		model.addAttribute("contact", data);
		
		// đường dẫn tới flie view
		return "customer/contact"; // -> /WEB-INF/views/customer/contact.jsp
	}
	

		// hứng data đẩy lên từ spring-form
		//@ModelAttribute dùng hứng dữ liệu, cần phải đặt tên của data cần hứng
		//ngoài ra @ModelAttribute cũng sẽ đẩy data xuống view với dữ liệu hứng được
	@RequestMapping(value = { "/contact" }, method = RequestMethod.POST)
	public String contact_post_springform(final Model model, 
									   	  final HttpServletRequest request,
									   	  final HttpServletResponse response, 
									   	  final @ModelAttribute("contact") Contact contact,
									   	  final @RequestParam("attachment") MultipartFile attachmentFile) throws IOException {
		
		System.out.println(contact.getFullName() + " " + contact.getEmail());
		// lưu contact vào trong database
		//contactService.saveOrUpdate(contact);
		
		// lưu ảnh lên server nếu có upload file.
		if(!attachmentFile.isEmpty()) {
			attachmentFile.transferTo(new File("C:/upload/test_upload/" + attachmentFile.getOriginalFilename()));	
		}
		
		//reset FORM
		Contact data = new Contact();
		model.addAttribute("contact", data);
		
		return "customer/contact";
	}
}
