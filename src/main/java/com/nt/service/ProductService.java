package com.nt.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nt.Entity.Product;
import com.nt.Reposetory.ProductRepository;
import com.nt.dto.ProductDto;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;
//add product

    public void addProduct(ProductDto productDTO) {
        Product product = new Product();
        String fileName = org.springframework.util.StringUtils.cleanPath(productDTO.getPicture().getOriginalFilename());
        if (fileName.contains("..")) {
            throw new IllegalArgumentException("Not a proper file path.");
        }
        try {
            product.setPicture(Base64.getEncoder().encodeToString(productDTO.getPicture().getBytes()));
        } catch (IOException e) {
            e.printStackTrace();
        }
        product.setName(productDTO.getName());
        product.setSummary(productDTO.getSummary());
        product.setQuantity(productDTO.getQuantity());
        product.setPrice(productDTO.getPrice());
        product.setAvailable(productDTO.getAvailable());
        product.setRating(productDTO.getRating());
        LocalDate currentDate = LocalDate.now();
        product.setCreateddate(currentDate);
        product.setUpdateddate(currentDate);
        productRepository.save(product);
    }
    
    //list of product
    public List<Product> productList(Product product){
    	return productRepository.findAll();
    }
    
    //for count of product
    public long getProductByCreateddate(LocalDate createddate) {
    	long product=productRepository.countByCreateddate(createddate);
    	if(product==0) {
    		LocalDate defaultDate = LocalDate.of(2000, 1, 1);
    		product=productRepository.countByCreateddate(defaultDate);
    	}
    	return product;
    }
    
    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
    
    public void updateProduct(Product updatedProduct) {
        Product existingProduct = getProductById(updatedProduct.getId());
        if (existingProduct != null) {
            // Update fields excluding the picture
            existingProduct.setName(updatedProduct.getName());
            existingProduct.setQuantity(updatedProduct.getQuantity());
            existingProduct.setRating(updatedProduct.getRating());
            existingProduct.setAvailable(updatedProduct.getAvailable());
            existingProduct.setSummary(updatedProduct.getSummary());
            existingProduct.setPrice(updatedProduct.getPrice());
            existingProduct.setUpdateddate(LocalDate.now());

            // Save the updated product
            productRepository.save(existingProduct);
        }
    }

	public Product findByProductid(int productid) {
		// TODO Auto-generated method stub
		return productRepository.findById(productid);
	}
    
    
}
