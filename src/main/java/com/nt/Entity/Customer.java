package com.nt.Entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="customers")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private Long id;
	@Column(name="image")
	private String image;
	@Column(name="name")
	private String name;
	@Column(name="city")
	private String city;
	@Column(name="mobile")
	private String mobile;
	@Column(name="creationdate")
	 private LocalDate creationdate;
	@Column(name="updateddate")
	private LocalDate updateddate;

}
