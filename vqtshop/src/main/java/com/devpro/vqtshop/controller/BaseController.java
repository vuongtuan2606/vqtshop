package com.devpro.vqtshop.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.vqtshop.model.Categories;
import com.devpro.vqtshop.services.CategoriesService;



public abstract class BaseController {
	// vao bất cứ requet nào thì chạy qua hàm này roi mới trả về 
	// trả về dữ liệu xuống view
	

	@Autowired
	private CategoriesService categoriesService;
	
	@ModelAttribute("categories") //
	public List<Categories> getAllCategories() {
		return categoriesService.findAll();// trả về danh sách 
	}
	
}
