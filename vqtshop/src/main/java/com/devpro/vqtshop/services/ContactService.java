package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;

import com.devpro.vqtshop.model.Contact;

/**
 * Mỗi Entity sẽ cần một Servicer / vidu contact cần có contactSevice
 * Để thực hiện thêm, sửa ,xóa, search Entity đó trong database
 * @author tv
 *
 */

// 
@Service // để spring biết để tạo ContactService ném vào spring cotainer
public class ContactService extends BaseService<Contact> { // để tận dụng được các hàm thêm sửa xóa
	@Override
	protected Class<Contact> clazz(){
		return Contact.class;
	}

	
}
