package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.Reposetory.CustomerRepository;
import com.nt.Reposetory.ProductRepository;
import com.nt.Reposetory.VendorRepository;

@Service
public class DashboardSevice {
	
	@Autowired
	private CustomerRepository customer;
	@Autowired
	private VendorRepository vendor;
	@Autowired
	private ProductRepository product;
	
	 public long countData() {
	    	return customer.count();
	    }
	 public long countData1() {
	    	return vendor.count();
	    }
	 
	 public long countData2() {
	    	return product.count();
	    }
//	public long todaysCount() {
//		return customer.countTodaysCustomer();
//	}

}
