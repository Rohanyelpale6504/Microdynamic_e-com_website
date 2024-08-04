package com.nt.Reposetory;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nt.Entity.Login;

@Repository
public interface LoginReposetory extends CrudRepository<Login, Integer> {
    Login findByUsernameAndPassword(String username, String password);
    Login findByUsername(String username);
    
    List<Login> findAll();
}
