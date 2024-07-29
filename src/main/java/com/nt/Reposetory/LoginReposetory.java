package com.nt.Reposetory;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.nt.Entity.Login;

@Repository
public interface LoginReposetory extends CrudRepository<Login, Integer> {
    Login findByUsernameAndPassword(String username, String password);
    Login findByUsername(String username);
}
