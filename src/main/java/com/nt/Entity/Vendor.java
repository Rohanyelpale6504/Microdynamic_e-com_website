package com.nt.Entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@Table(name="vendor")
public class Vendor {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="id")
	private Long id;
	@Column(name="name")
	private String name;
	@Column(name="mobile")
	private String mobile;
	@Column(name="officemobile")
	private String officemobile;
	@Column(name="address")
	private String address;
	@Column(name="gstno")
	private String gstno;
	@Column(name="companyname")
	private String companyname;
	@Column(name="businessnature")
	private String businessnature;
	@Column(name="turnover")
	private String turnover;
	@Column(name="service")
	private String service;
	@Column(name="product")
	private String product;
	@Column(name="creditlimit")
	private String creditlimit;
	@Column(name="status")
	private String status;
	 @Column(name = "date")
	    @DateTimeFormat(pattern = "yyyy-MM-dd")
	    @JsonFormat(pattern = "yyyy-MM-dd")
	    private LocalDate date;
	 @Column(name="updatedate")
	 private LocalDate updatedate;

}
