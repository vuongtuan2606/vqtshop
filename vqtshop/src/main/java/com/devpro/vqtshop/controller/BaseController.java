package com.devpro.vqtshop.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	// chuyền vào kiểu abc lỗi
		public Integer getInteger(HttpServletRequest request, String paramName) {
			try {
				return Integer.parseInt(request.getParameter(paramName));
			} catch (Exception e) {
				return null;
			}
		}
		
		
		public int getCurrentPage(HttpServletRequest request) {
			try {
				return Integer.parseInt(request.getParameter("page"));
			} catch (Exception e) {
				return 1;
			}
		}
	
}
