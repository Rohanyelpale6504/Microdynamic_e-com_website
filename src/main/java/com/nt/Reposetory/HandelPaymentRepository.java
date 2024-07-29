package com.nt.Reposetory;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.nt.Entity.HandelPayment;

public interface HandelPaymentRepository extends CrudRepository<HandelPayment, Long> {
List<HandelPayment> findAll();

HandelPayment findTopByOrderByPaymentidDesc();
}
