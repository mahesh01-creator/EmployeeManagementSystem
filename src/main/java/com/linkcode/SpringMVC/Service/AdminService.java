package com.linkcode.SpringMVC.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linkcode.SpringMVC.POJO.AdminPOJO;
import com.linkcode.SpringMVC.Repositry.AdminRepository;

@Service
public class AdminService 
{
	
	@Autowired
	private AdminRepository repository;

	public AdminPOJO addAdmin(String user, String pass) {
		AdminPOJO admin = repository.addAdmin(user,pass);
		return admin;
	}

	public AdminPOJO searchAdmin(String user, String pass) {
		AdminPOJO admin = repository.SearchAdmin(user ,pass);
		return admin;
	}

}
