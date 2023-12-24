package com.devpro.vqtshop.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductsRepository extends JpaRepository<Product, Long> {
	@Query(value = "SELECT COUNT(*) FROM tbl_products", nativeQuery = true)
    Long countProducts();
}
