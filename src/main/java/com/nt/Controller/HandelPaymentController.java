package com.nt.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.Entity.HandelPayment;
import com.nt.service.HandelPaymentService;

@Controller
public class HandelPaymentController {
	@Autowired
	private HandelPaymentService handelpaymentsarvice;
	
	@GetMapping("/paymentSuccess")
	public String showPage() {
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
