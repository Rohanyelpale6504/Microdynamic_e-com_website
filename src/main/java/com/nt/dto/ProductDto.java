package com.nt.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {
	  private String name;
	    private int quantity;
	    private double rating;
	    private String available;
	    private String summary;
	    private double price;
	    private MultipartFile picture;

}
