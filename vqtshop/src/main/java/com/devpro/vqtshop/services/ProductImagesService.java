package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;

import com.devpro.vqtshop.model.ProductImages;

@Service
public class ProductImagesService extends BaseService<ProductImages> {

	@Override
	protected Class<ProductImages> clazz() {
		return ProductImages.class;
	}

}
