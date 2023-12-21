package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;

import com.devpro.vqtshop.model.Role;

@Service
public class RoleService extends BaseService<Role> {
	@Override
	protected Class<Role> clazz(){
		return Role.class;
	}

}
