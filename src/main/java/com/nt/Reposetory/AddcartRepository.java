package com.nt.Reposetory;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.nt.Entity.Addcart;

import java.util.List;

@Repository
public interface AddcartRepository extends JpaRepository<Addcart, Long> {

    @Override
    long count();

    boolean existsByProductid(Long productid);

    Long deleteByProductid(Long productid);

    @Override
    List<Addcart> findAll();

    void deleteAll();

    @Query("SELECT a FROM Addcart a WHERE a.productid IN :productids")
    List<Addcart> findByProductid(@Param("productids") List<Long> productids);
}

