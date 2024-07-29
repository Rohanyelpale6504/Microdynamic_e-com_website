package com.nt.Reposetory;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nt.Entity.Customer;
import com.nt.Entity.Vendor;
@Repository
public interface VendorRepository extends CrudRepository<Vendor, Integer> {
	@Override
     List<Vendor> findAll();
	
	List<Vendor> findByDate(LocalDate date);
	long countByDate(LocalDate date);
	@Override long count();
	Optional<Vendor> findById(Long id);
}
