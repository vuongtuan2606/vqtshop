package com.devpro.vqtshop.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public  interface OrderRepository extends JpaRepository<SaleOrder, Long> {
	@Query(value = "SELECT COUNT(*) as order_count\r\n"
								+ "FROM tbl_saleorder\r\n"
								+ "WHERE MONTH(created_date) = MONTH(CURRENT_DATE()) AND YEAR(created_date) = YEAR(CURRENT_DATE());", nativeQuery = true)
    Long countSaleOrder();
}
