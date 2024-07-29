package com.nt.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.Entity.Addcart;
import com.nt.Entity.HandelPayment;
import com.nt.Reposetory.AddcartRepository;
import com.nt.Reposetory.HandelPaymentRepository;

@Service
public class HandelPaymentService {
	
	@Autowired
	private HandelPaymentRepository handelrepository;
	
	@Autowired
	private AddcartRepository addcartrepository;
	
	  public boolean saveData(HandelPayment payment) {
		  handelrepository.save(payment);
		  return true;
	    }
	  
	  public HandelPayment findLastPayment() {
	        return handelrepository.findTopByOrderByPaymentidDesc();
	    }
	  
	  
//	  public Addcart saveOrUpdateCart(Addcart addcart) {
//	        // Check if the productid exists
//	        Addcart existingCart = addcartrepository.findByProductid(addcart.getProductid());
//	        if (existingCart != null) {
//	            // Update existing cart details
//	            existingCart.setTotalpayment(addcart.getTotalpayment());
//	            existingCart.setPaymenttype(addcart.getPaymenttype());
//	            return addcartrepository.save(existingCart);
//	        } else {
//	            // Save new cart
//	            return addcartrepository.save(addcart);
//	        }
//	    }

	  public void updateAllCarts(double totalpayment, String paymenttype) {
	        List<Addcart> carts = addcartrepository.findAll(); // Retrieve all records
	        for (Addcart cart : carts) {
	            cart.setTotalpayment(totalpayment);
	            cart.setPaymenttype(paymenttype);
	        }
	        addcartrepository.saveAll(carts); // Save all updated records
	    }

}
