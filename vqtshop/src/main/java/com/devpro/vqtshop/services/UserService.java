package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.vqtshop.model.User;




@Service
public class UserService extends BaseService<User> {
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_user u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}
	

	
}
