package com.devpro.vqtshop.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.devpro.vqtshop.model.Categories;
import com.devpro.vqtshop.model.User;
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
	
		/**
		 * Kiểm tra xem người dùng đã đăng nhập chưa?
		 * User logined có thể truy cập thông qua class SecurityContextHolder
		 * @return true|false, true nếu đã login ngược lại trả về false
		 * principal -> user
		 */
		@ModelAttribute("isLogined") // tất cả các controller nào  extends  BaseController đều đẩy xuống tầng view
		public boolean isLogined() {
			boolean isLogined = false; // mặc định là chưa login
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();  // SecurityContextHolder chứa thông tin người dùng đã đang nhập vào
			if (principal instanceof UserDetails) {
				isLogined = true;
			}
			
			return isLogined;
		}
		
		
		/**
		 * trả về entity User chính là user logined
		 * User logined có thể truy cập thông qua class SecurityContextHolder
		 * @return
		 */
		@ModelAttribute("userLogined") // trả về user login
		public User getUserLogined() {
			Object userLogined = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // lấy  userLogined ra qua  SecurityContextHolder
			if(userLogined != null && userLogined instanceof UserDetails)
				return (User) userLogined; // ép kiểu về User
			
			return new User(); // ngược lại không có gì
		}
		
	
		
		public int getCurrentPage(HttpServletRequest request) {
			try {
				return Integer.parseInt(request.getParameter("page"));
			} catch (Exception e) {
				return 1;
			}
		}
		// chuyền vào kiểu abc lỗi
		public Integer getInteger(HttpServletRequest request, String paramName) {
			try {
				return Integer.parseInt(request.getParameter(paramName));
			} catch (Exception e) {
				return null;
			}
		}
	
}
