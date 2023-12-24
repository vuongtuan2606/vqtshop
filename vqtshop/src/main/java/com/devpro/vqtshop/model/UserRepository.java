package com.devpro.vqtshop.model;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
public  interface UserRepository extends JpaRepository<User, Long>{
	
		@Query(value = "SELECT COUNT(*) FROM tbl_user", nativeQuery = true)
	    Long countUsers();
}
