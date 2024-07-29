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
	public String paymentForm() {
		return "product/cart/paymentgetway/paymentform";
	}
	
	
	
//	  @PostMapping("/addcarts")
//	    public String addCart(@ModelAttribute Addcart addcart, Model model) {
//	        // Save or update the cart details
//	        Addcart savedCart = handelpaymentsarvice.saveOrUpdateCart(addcart);
//
//	        // Add attributes to the model to display success message or other info
//	        model.addAttribute("message", "Cart details saved successfully!");
//	        model.addAttribute("addcart", savedCart);
//
//	        // Return the view name to display after saving
//	        return "redirect:/paymentform"; // JSP view name for success page
//	    }
	
	
	 @PostMapping("/addcarts")
	    public String updateAllCarts(@ModelAttribute Addcart addcart, Model model) {
	        // Update all cart records with the given totalpayment and paymenttype
		 handelpaymentsarvice.updateAllCarts(addcart.getTotalpayment(), addcart.getPaymenttype());

	        // Add attributes to the model to display success message or other info
	        model.addAttribute("message", "All carts updated successfully!");

	        // Return the view name to display after saving
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
	  
	  
	  

}
