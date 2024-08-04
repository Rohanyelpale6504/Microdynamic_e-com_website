package com.nt.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.Entity.Addcart;
import com.nt.Entity.HandelPayment;
import com.nt.service.AddcartService;
import com.nt.service.HandelPaymentService;

@Controller
public class HandelPaymentController {
	@Autowired
	private HandelPaymentService handelpaymentsarvice;
	
	@Autowired
    private AddcartService addcartservice;
	
	@GetMapping("/paymentform")
	public String paymentForm(Model model, Addcart addcarts) {
	    List<Addcart> cartData = addcartservice.cartList(addcarts);
	    int cartcount = (int) addcartservice.countData();
	    double totalPayment = cartData.stream().mapToDouble(Addcart::getTotalpayment).sum();
	    
	    model.addAttribute("cartData", cartData);
	    model.addAttribute("cartcount", cartcount);
	    model.addAttribute("totalPayment", totalPayment);
	    
	    return "product/cart/paymentgetway/paymentform";
	}

	
	

	
	 @PostMapping("/addcarts")
	    public String updateAllCarts(@ModelAttribute Addcart addcart, Model model) {
	       handelpaymentsarvice.updateAllCarts(addcart.getTotalpayment(), addcart.getPaymenttype(),addcart.getTotalproduct());
          
	        model.addAttribute("message", "All carts updated successfully!");

	        return "redirect:/paymentform"; // JSP view name for success page
	    }
	
	
	
	
	
	 @GetMapping("/paymentSuccess")
	    public String getLastInsertedPayment(Model model,Addcart addcarts ) {
          
	        model.addAttribute("cartData", addcartservice.cartList(addcarts));
	        HandelPayment lastInsertedPayment = handelpaymentsarvice.findLastPayment();
	        model.addAttribute("payment", lastInsertedPayment);
	        return "product/cart/payment/payments";
	    }
	
	  @PostMapping("/addpaymentdetails")
	    public String savePayment(@ModelAttribute HandelPayment payment,RedirectAttributes redirecta) {
		 boolean isAdded= handelpaymentsarvice.saveData(payment);
		 if(isAdded) {
			 redirecta.addFlashAttribute("message", "success");
		 }
		 else {
			 redirecta.addFlashAttribute("message", "error");
		}
	        return "redirect:/paymentSuccess"; // Adjust the view name accordingly
	    }
	  
	  
	  //show invoice page
	  @GetMapping("/invoicedetails")
	  public String invoiceDetails() {
		  return "product/cart/invoice/invoicetable";
	  }
	  
	  
	  
	  
	  

}
