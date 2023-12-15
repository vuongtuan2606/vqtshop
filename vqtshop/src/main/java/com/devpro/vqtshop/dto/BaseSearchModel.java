package com.devpro.vqtshop.dto;

public abstract class BaseSearchModel {
//	phân trang
	private Integer page;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	
}
