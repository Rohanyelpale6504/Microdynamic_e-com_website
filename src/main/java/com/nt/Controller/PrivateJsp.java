package com.nt.Controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nt.service.CustomerService;
import com.nt.service.DashboardSevice;
import com.nt.service.ProductService;
import com.nt.service.VendorService;

@Controller
public class PrivateJsp {
	
	@Autowired
	private DashboardSevice dashboardservice;
	@Autowired
    private CustomerService customerservice;
	@Autowired
	private VendorService vendorService;
	@Autowired
	private ProductService productservice;
	
	@RequestMapping("/")
	public String index() {
	return "index";
	}
	
@RequestMapping("/registerhere")
public String registeration() {
	return "mainpage/register";
}
	
	@RequestMapping("/login")
	public String login() {
		return "mainpage/login";
	}
	
	@RequestMapping("/homepage")
	public String home(Model model) {
		//for customer  count
		model.addAttribute("count",dashboardservice.countData());
		LocalDate currentDate = LocalDate.now();
       long currentDateCustomers = customerservice.getCustomersByDate(currentDate);
        model.addAttribute("currentDateCustomers", currentDateCustomers);
        //for vendor
        LocalDate currentDate1 = LocalDate.now();
        model.addAttribute("vendorcount",dashboardservice.countData1() );
        long currentDateVendor=vendorService.getVendorsByDate(currentDate1);
        model.addAttribute("currentDateVendor", currentDateVendor);
        //for product
        LocalDate currentDate2=LocalDate.now();
        model.addAttribute("productcount",dashboardservice.countData2() );
         long currentDateproduct=productservice.getProductByCreateddate(currentDate2);
        model.addAttribute("currentDateProduct", currentDateproduct);
        
		return "mainpage/home";
	}
	
	//vendor form
	@RequestMapping("/venderform")
	public String vendor() {
		return "vendor/vendorform";
	}
	
	
	
	
	
	

}
