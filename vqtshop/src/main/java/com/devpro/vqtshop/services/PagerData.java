package com.devpro.vqtshop.services;

import java.util.List;

import com.devpro.vqtshop.model.BaseEntity;

public class PagerData<E extends BaseEntity> {

	// danh sách items
	private List<E> data; // ${products.data}

	// tổng số items
	private int totalItems;

	// trang hiện tại
	private int currentPage;

	// số lượng item trên 1 trang
	private int sizeOfPage;
	
	public List<E> getData() {
		return data;
	}

	public void setData(List<E> data) {
		this.data = data;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getSizeOfPage() {
		return sizeOfPage;
	}

	public void setSizeOfPage(int sizeOfPage) {
		this.sizeOfPage = sizeOfPage;
	}
	
	
}
