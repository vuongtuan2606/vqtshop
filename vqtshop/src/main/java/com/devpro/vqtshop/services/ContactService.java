package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.vqtshop.dto.ContactSearchModel;
import com.devpro.vqtshop.dto.OrderSearchModel;
import com.devpro.vqtshop.model.Contact;
import com.devpro.vqtshop.model.SaleOrder;

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

	public PagerData<Contact> search(ContactSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_contact o WHERE 1=1";

		if (searchModel != null) {

		
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (o.email like '%" + searchModel.getKeyword() + "%'" + 
							" or o.fullname like '%" + searchModel.getKeyword() + "%'" +
							" or o.request like '%" + searchModel.getKeyword() + "%')" ;
			}
		}
		

		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}

	
}
