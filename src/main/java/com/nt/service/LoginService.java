package com.nt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.Entity.Login;
import com.nt.Reposetory.LoginReposetory;

@Service
public class LoginService {
	
	@Autowired
	private LoginReposetory reposetory;
	
	public boolean loginValid(Login login) {
		Login log=reposetory.findByUsernameAndPassword(login.getUsername(), login.getPassword());
		return log!=null;
	}
	public long countData() {
    	return reposetory.count();
    }
	
	 public boolean addUsernameAndPassword(String username,String mobile, String password) {
	        if (reposetory.findByUsername(username) != null) {
	            return false; // Username already exists
	        }
	        Login newUser = new Login();
	        newUser.setUsername(username);
	        newUser.setMobile(mobile);
	        newUser.setPassword(password);
	        reposetory.save(newUser);
	        return true;
	    }

}
