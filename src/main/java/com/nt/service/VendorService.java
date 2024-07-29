package com.nt.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nt.Entity.Vendor;
import com.nt.Reposetory.VendorRepository;

@Service
@Transactional
public class VendorService {

    @Autowired
    private VendorRepository vendorRepository; // Corrected variable name

    public boolean addVendor(Vendor vendor) {
        vendorRepository.save(vendor);
        return true;
    }
    
    //list of vendor
    public List<Vendor> venderlist(Vendor vendor){
    	return vendorRepository.findAll();
    }
    
    //for count of vender
    public long getVendorsByDate(LocalDate date) {
        long vendor = vendorRepository.countByDate(date);
         if (vendor==0) {
             LocalDate defaultDate = LocalDate.of(2000, 1, 1); // Replace with your desired default date
             vendor = vendorRepository.countByDate(defaultDate);
         }
         return vendor;
     }
    //for update vender
    public boolean updateVendor(Long id, String name, String mobile, String officemobile, String address, String gstno, String companyname, String businessnature, String turnover, String service, String product, String creditlimit, String status, LocalDate updatedate) {
        try {
            Vendor vendor = vendorRepository.findById(id).orElseThrow(() -> new RuntimeException("Vendor not found"));
            vendor.setName(name);
            vendor.setMobile(mobile);
            vendor.setOfficemobile(officemobile);
            vendor.setAddress(address);
            vendor.setGstno(gstno);
            vendor.setCompanyname(companyname);
            vendor.setBusinessnature(businessnature);
            vendor.setTurnover(turnover);
            vendor.setService(service);
            vendor.setProduct(product);
            vendor.setCreditlimit(creditlimit);
            vendor.setStatus(status);
            vendor.setUpdatedate(updatedate);
            vendorRepository.save(vendor);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    
}
