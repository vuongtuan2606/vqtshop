package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;


import com.devpro.vqtshop.model.ProductsSize;

@Service
public class ProductsSizeService extends BaseService<ProductsSize> {

	@Override
	protected Class<ProductsSize> clazz() {
		return ProductsSize.class;
	}

}
