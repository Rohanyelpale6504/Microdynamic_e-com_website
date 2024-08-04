package com.nt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.Entity.Login;
import com.nt.Reposetory.LoginReposetory;

@Service
public class LoginService {
	
	@Autowired
	private LoginReposetory reposetory;
	
	public Integer getLoginId(String username, String password) {
	    Login login = reposetory.findByUsernameAndPassword(username, password);
	    return (login != null) ? login.getId() : null; // Adjust `getId()` based on your `Login` class's ID method
	}

	 public boolean loginValid(Login login) {
	        Login log = reposetory.findByUsernameAndPassword(login.getUsername(), login.getPassword());
	        return log != null;
	    }

	public long countData() {
    	return reposetory.count();
    }
	
	 public boolean addUsernameAndPassword(String name,String address,String username,String mobile, String password) {
	        if (reposetory.findByUsername(username) != null) {
	            return false; // Username already exists
	        }
	        Login newUser = new Login();
	        newUser.setName(name);
	        newUser.setAddress(address);
	        newUser.setUsername(username);
	        newUser.setMobile(mobile);
	        newUser.setPassword(password);
	        reposetory.save(newUser);
	        return true;
	    }
	 
	 public List<Login> loginData(Login login){
		return reposetory.findAll();
	 }

}
