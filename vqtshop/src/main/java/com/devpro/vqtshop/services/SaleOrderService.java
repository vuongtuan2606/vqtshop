package com.devpro.vqtshop.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.vqtshop.dto.OrderSearchModel;
import com.devpro.vqtshop.model.OrderRepository;
import com.devpro.vqtshop.model.SaleOrder;



@Service
public class SaleOrderService extends BaseService<SaleOrder> {
	@Autowired
	private OrderRepository orderRepository;
	
	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	
	 public Long getOrderCount() {
	      
	        return orderRepository.countSaleOrder();
	    }

	
	public PagerData<SaleOrder> search(OrderSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder o WHERE 1=1";

		if (searchModel != null) {

			if(searchModel.getOrderStatus() != null && searchModel.getOrderStatus()>-1) {
				sql += " and order_status = " + searchModel.getOrderStatus();
			}

			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (o.code like '%" + searchModel.getKeyword() + "%'" + 
							" or o.user_id like '%" + searchModel.getKeyword() + "%'" +
							" or o.customer_phone like '%" + searchModel.getKeyword() + "%'" +
							" or o.customer_address like '%" + searchModel.getKeyword() + "%'" +
						     " or o.customer_name like '%" + searchModel.getKeyword() + "%')";
			}
		}
		
			sql+=" order by id desc";

		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}

}
