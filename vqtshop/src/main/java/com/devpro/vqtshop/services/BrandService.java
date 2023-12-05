package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;

import com.devpro.vqtshop.model.Brand;

@Service
public class BrandService extends BaseService<Brand> {

	@Override
	protected Class<Brand> clazz() {
		return Brand.class;
	}

}
