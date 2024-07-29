package com.nt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.Entity.Addcart;
import com.nt.Reposetory.AddcartRepository;

@Service
public class AddcartService {

    @Autowired
    private AddcartRepository addcartrepo;

    public boolean addCart(Addcart addcart) {
        addcartrepo.save(addcart);
        return true;
    }

    public long countData() {
        return addcartrepo.count();
    }

    public boolean existProductid(Long productid) {
        return addcartrepo.existsByProductid(productid);
    }

    public void deleteCartId(Long productid) {
        addcartrepo.deleteByProductid(productid);
    }

    public List<Addcart> cartList(Addcart cartlist){
        return addcartrepo.findAll();
    }

    public boolean deleteAll() {
        addcartrepo.deleteAll();
        return true;
    }
}
