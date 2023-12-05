package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;

import com.devpro.vqtshop.model.ColorProduct;

@Service
public class ColorService extends BaseService<ColorProduct> {

	@Override
	protected Class<ColorProduct> clazz() {
		return ColorProduct.class;
	}

}
