package com.nt.Controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.nt.Entity.Customer;
import com.nt.service.AddcartService;
import com.nt.service.CustomerService;

@Controller
public class CustomerController {

    @Autowired
    private CustomerService service;
    @Autowired
	private AddcartService addcartservice;
 //For display the list of customers
    @GetMapping("/customerPage")
    public String customer(Model model, Customer entity) {
    	model.addAttribute("cartcount", addcartservice.countData());
        model.addAttribute("datalist", service.list(entity));
        
        return "customers/customer"; 
    }
//for update the customer
    @PostMapping("/update")
    public String updateCustomer(
            @RequestParam Long id,
            @RequestParam String name,
            @RequestParam String city,
            @RequestParam String mobile,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate updateddate,
            Model model) {

        boolean isUpdated = service.updateCustomer(id,  name, city, mobile, updateddate);
        if (isUpdated) {
            model.addAttribute("success", "Updated Successfully");
            return "redirect:/customerPage";
        } else {
            model.addAttribute("error", "Something went wrong!");
            return "redirect:/customerPage";
        }
       
    }
    
    //for upload the excel file
    
    @PostMapping("/upload")
    public ResponseEntity<Map<String, Object>> handleFileUpload(@RequestParam("file") MultipartFile file, Model model) {
        Map<String, Object> response = new HashMap<>();
        try {
            List<Customer> currentDateCustomers = service.saveCustomerData(file);

            LocalDate currentDate = LocalDate.now();
            int uploadedCustomerCount = currentDateCustomers.size();

            model.addAttribute("uploadedCustomerCount", uploadedCustomerCount);
            model.addAttribute("currentDateCustomers", currentDateCustomers);
            model.addAttribute("currentDate", currentDate);

            response.put("message", "File uploaded successfully.");
            response.put("currentDate", currentDate);
            response.put("currentDateCustomers", currentDateCustomers);
            return ResponseEntity.ok().body(response);
        } catch (IllegalArgumentException e) {
            response.put("error", "Failed to upload file: Duplicate data not allowed. " + e.getMessage());
            return ResponseEntity.badRequest().body(response);
        } catch (RuntimeException e) {
            response.put("error", "Failed to save data: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
}

