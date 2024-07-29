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
@Table(name="handelpayment")
public class HandelPayment {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="paymentid")
	private Long paymentid;
	@Column(name="paymenttype")
	private String paymenttype;
	@Column(name="totalpayment")
	private double totalpayment;
	@Column(name="totalproduct")
	private Long totalproduct;

}
