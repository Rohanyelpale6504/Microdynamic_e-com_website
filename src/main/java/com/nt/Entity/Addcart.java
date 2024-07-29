package com.nt.Entity;

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
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="carts")
public class Addcart {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="cartid")
	private Long cartid;
	@Column(name="name")
	private String name;
	@Column(name="picture")
	private String picture;
	@Column(name="summary")
	private String summary;
	@Column(name="price")
	private double price;
	@Column(name="productid")
	private Long productid; 
	@Column(name="paymenttype")
	private String paymenttype;
	@Column(name="totalpayment")
	private double totalpayment;

}
