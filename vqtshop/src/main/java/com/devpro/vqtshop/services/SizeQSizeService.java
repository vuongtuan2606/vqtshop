package com.devpro.vqtshop.services;


import org.springframework.stereotype.Service;


import com.devpro.vqtshop.model.SizeQ;

@Service
public class SizeQSizeService extends BaseService<SizeQ> {

	@Override
	protected Class<SizeQ> clazz() {
		return SizeQ.class;
	}


}
