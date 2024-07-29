package com.nt.Controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.Entity.Vendor;
import com.nt.service.AddcartService;
import com.nt.service.VendorService;

@Controller
public class VendorController {

    @Autowired
    private VendorService vendorService;
    
    @Autowired
	private AddcartService addcartservice;

    @PostMapping("/addvendor")
    public String addVendor(@ModelAttribute Vendor vendor, RedirectAttributes redirectAttributes) {
        LocalDate currentDate = LocalDate.now();
        vendor.setDate(currentDate); // Set the current date
        
        boolean isAdded = vendorService.addVendor(vendor);
        if (isAdded) {
            redirectAttributes.addFlashAttribute("successMessage", "Form submitted successfully!");
            return "redirect:/venderList";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while submitting the form.");
            return "redirect:/vender";
        }
        
    }
    
    // List of vendors
    @GetMapping("/venderlist")
    public String listOfVendors(Model model,Vendor vender) {


		model.addAttribute("cartcount", addcartservice.countData());
        model.addAttribute("vendors", vendorService.venderlist(vender));
        return "vendor/vendorlist";
    }
    
    // Update vendor
    @PostMapping("/updateVendor")
    public String updateVendor(@RequestParam Long id,
                               @RequestParam String name,
                               @RequestParam String mobile,
                               @RequestParam String officemobile,
                               @RequestParam String address,
                               @RequestParam String gstno,
                               @RequestParam String companyname,
                               @RequestParam String businessnature,
                               @RequestParam String turnover,
                               @RequestParam String service,
                               @RequestParam String product,
                               @RequestParam String creditlimit,
                               @RequestParam String status,
                               @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate updatedate,
                               RedirectAttributes redirectAttributes) {
        boolean isUpdate = vendorService.updateVendor(id, name, mobile, officemobile, address, gstno, companyname, businessnature, turnover, service, product, creditlimit, status, updatedate);
        if (isUpdate) {
            redirectAttributes.addFlashAttribute("success", "Update successful");
        } else {
            redirectAttributes.addFlashAttribute("error", "Update error");
        }
        return "redirect:/venderlist";
    }
}
