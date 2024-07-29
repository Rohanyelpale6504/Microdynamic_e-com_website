package com.nt.Reposetory;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nt.Entity.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer>{
	@Override
	List<Customer> findAll();
	
	boolean existsByName(String name);
	@Override
	long count();
	List<Customer> findByCreationdate(LocalDate date);
	long countByCreationdate( LocalDate date);

	Optional<Customer> findById(Long id);


	
		

}
