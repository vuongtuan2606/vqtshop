package com.devpro.vqtshop.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.vqtshop.dto.UserSearchModel;
import com.devpro.vqtshop.model.User;


@Service
public class UserService extends BaseService<User> {
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_user u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}
	
	public PagerData<User> search(UserSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_user as u";

		if (searchModel != null) {
			
			// tìm kiếm theo role
			if(searchModel.getRoleId() != null && searchModel.getRoleId()>0) {
				sql += " inner join tbl_user_roles as ur on u.id = ur.user_id where 1=1 and ur.roles_id= " + searchModel.getRoleId();
			} else sql+= " WHERE 1=1";
		

			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (u.fullname like '%" + searchModel.getKeyword() + "%'" +
				           " or u.username like '%" + searchModel.getKeyword() + "%'" +
				           " or u.email like '%" + searchModel.getKeyword() + "%')";
			}
		}
		
		
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
	

	
}
