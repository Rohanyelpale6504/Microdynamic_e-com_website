package com.nt.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.nt.Entity.Product;
import com.nt.dto.ProductDto;
import com.nt.service.AddcartService;
import com.nt.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	
	@Autowired
	private AddcartService addcartservice;
	
	
	
	
	@GetMapping("/productf")
	public String productForm() {
		return "product/productform";
	}
	
	@GetMapping("/productlists")
	public String productList(Model model,Product product) {
		model.addAttribute("cartcount", addcartservice.countData());
		model.addAttribute("listProduct", productService.productList(product));
		return "product/productlist";
	}

	 @PostMapping("/addproduct")
	    public String addProduct(@ModelAttribute ProductDto productDTO) {
		 productService.addProduct(productDTO);
	        return "redirect:/productf";
	    }
	
	//update product
	  @PostMapping("/updateproduct")
	    public String updateProduct(@ModelAttribute Product product) {
	        productService.updateProduct(product);
	        return "redirect:/productlists"; // Redirect to product listing page
	    }
	  
	  
	 
	

}
