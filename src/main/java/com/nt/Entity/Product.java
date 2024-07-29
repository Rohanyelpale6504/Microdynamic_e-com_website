package com.nt.Entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private Long id;
	@Lob
	@Column(name="picture")
	private String picture;
	@Column(name="name")
	private String name;
	@Column(name="summary")
	private String summary;
	@Column(name="quantity")
	private int quantity;
	@Column(name="price")
	private double price;
	@Column(name="available")
	private String available;
	@Column(name="rating")
	private double rating;
	@Column(name="createddate")
	private LocalDate createddate;
	@Column(name="updateddate")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern = "yyyy-MM-dd")
	private LocalDate updateddate;
	
	

}
