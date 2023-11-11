package com.devpro.vqtshop.services;

import com.devpro.vqtshop.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
