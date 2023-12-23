package com.devpro.vqtshop.controller.administrator;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.vqtshop.controller.BaseController;
import com.devpro.vqtshop.dto.UserSearchModel;
import com.devpro.vqtshop.model.Role;
import com.devpro.vqtshop.model.User;
import com.devpro.vqtshop.services.PagerData;
import com.devpro.vqtshop.services.RoleService;
import com.devpro.vqtshop.services.UserService;

@Controller
public class AdminUserController extends BaseController{
	
	@Autowired
	UserService userService = new UserService();
	
	@Autowired
	RoleService roleService = new RoleService();
	
	@RequestMapping(value = { "/admin/user" }, method = RequestMethod.GET)
	public String adminUser(final Model model,
							   final HttpServletRequest request,
							   final HttpServletResponse response) {
		
		String keyword = request.getParameter("keyword");
		Integer roleId = getInteger(request, "roleId");
		
		UserSearchModel searchModel = new UserSearchModel();
		searchModel.setKeyword(keyword);
		searchModel.setRoleId(roleId);
		searchModel.setPage(getCurrentPage(request));
		
		PagerData<User> users = userService.search(searchModel);
		
		model.addAttribute("users", users);
		model.addAttribute("searchModel", searchModel);
		
		return "/administrator/user";
	}
	
	@RequestMapping(value = { "/admin/user/delete" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> deleteUser(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
		
		User userInDb = userService.getById(user.getId());
		userInDb.setStatus(false);
		userService.saveOrUpdate(userInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = { "/admin/user/addCO" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addCOUser(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
		
		User userInDb = userService.getById(user.getId());
		Role role = roleService.getById(3);
		userInDb.addRoles(role);
		userService.saveOrUpdate(userInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
	@RequestMapping(value = { "/admin/user/removeCO" }, method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> removeCOUser(final Model model, 
															final HttpServletRequest request,
															final HttpServletResponse response, 
															final @RequestBody User user) {
		
		User userInDb = userService.getById(user.getId());
		Role role = roleService.getById(3);
		userInDb.deleteRole(role);
		userService.saveOrUpdate(userInDb);
		
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("message", "Đã xóa thành công");
		return ResponseEntity.ok(jsonResult);
		
	}
	
}
