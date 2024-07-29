package com.nt.Controller;

import java.time.LocalDate;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nt.Entity.Login;
import com.nt.service.CustomerService;
import com.nt.service.DashboardSevice;
import com.nt.service.LoginService;
import com.nt.service.VendorService;

@Controller
public class LoginController {
	
	@Autowired
	private LoginService services;
	@Autowired
	private DashboardSevice dataservice;
	 @Autowired
	private CustomerService customerservice;
	 @Autowired
		private DashboardSevice dashboardservice;
	  @Autowired
	    private VendorService vendorService;
	
	 
   @PostMapping("/add")
   public String addUsernameAndPassword(@RequestParam String username,@RequestParam String mobile, @RequestParam String password, Model model) {
       boolean isAdded = services.addUsernameAndPassword(username,mobile, password);
       if(isAdded) {
    	   return "redirect:/";
       }
       else {
    	   return "redirect:/registerhere";
	}
        // assuming there's a view named addResult
	
   }
	@PostMapping("/login")
	public String login(Login login,HttpSession session,Model model) {
		boolean isValid=services.loginValid(login);
		if(isValid) {
			session.setAttribute("username", login.getUsername());
			model.addAttribute("count",dataservice.countData());
			// Retrieve updated customers by current date
			LocalDate currentDate = LocalDate.now();
            long currentDateCustomers = customerservice.getCustomersByDate(currentDate);
            model.addAttribute("currentDateCustomers", currentDateCustomers);
            
            //for vendor
            LocalDate currentDate1 = LocalDate.now();
            model.addAttribute("vendorcount",dashboardservice.countData1() );
            long currentDateVendor=vendorService.getVendorsByDate(currentDate1);
            model.addAttribute("currentDateVendor", currentDateVendor);
        	//for product
            model.addAttribute("productcount",dashboardservice.countData2() );
            long currentDateProduct=vendorService.getVendorsByDate(currentDate1);
            model.addAttribute("currentDateProduct", currentDateProduct);
			return "mainpage/home";
			
		
			
		}
		else {
			model.addAttribute("error", "Invalid username or password");
			return "redirect:/";
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
