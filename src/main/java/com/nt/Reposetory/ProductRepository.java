package com.nt.Reposetory;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nt.Entity.Product;
import com.nt.Entity.Vendor;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long> {
	
	@Override
	List<Product> findAll();
	List<Product> findByCreateddate(LocalDate createddate);
	long countByCreateddate(LocalDate createddate);
	@Override long count();
	Optional<Product> findById(Long id);
	Product findById(int id);
	
}
