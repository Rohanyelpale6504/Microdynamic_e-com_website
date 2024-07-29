package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.Entity.HandelPayment;
import com.nt.Reposetory.HandelPaymentRepository;

@Service
public class HandelPaymentService {
	
	@Autowired
	private HandelPaymentRepository handelrepository;
	
	  public boolean saveData(HandelPayment payment) {
		  handelrepository.save(payment);
		  return true;
	    }

}
