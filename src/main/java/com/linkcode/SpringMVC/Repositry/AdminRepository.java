package com.linkcode.SpringMVC.Repositry;

import java.util.List;
import java.util.Scanner;

import org.springframework.stereotype.Repository;

import com.linkcode.SpringMVC.POJO.AdminPOJO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;


@Repository
public class AdminRepository 
{
	private static EntityManagerFactory factory;
	private static EntityManager manager;
	private static EntityTransaction transaction;
	private static Query query;
	private static Scanner sc = new Scanner(System.in);
	
	
	public static void openConnection() 
	{
		 factory = Persistence.createEntityManagerFactory("SpringMVC");
		 manager = factory.createEntityManager();
		 transaction = manager.getTransaction();
	}
	public static void closeConnection() 
	{
		if(factory!=null) 
		{
			factory.close();
		}
		if (manager!=null)
		{
			manager.close();
		}
		if (transaction.isActive()) 
		{
			transaction.rollback();
		}
	}
	public AdminPOJO addAdmin(String user, String pass) {
		openConnection();
		transaction.begin();
		
		AdminPOJO admin = new AdminPOJO();
		admin.setUName(user);
		admin.setPass(pass);
		
		manager.persist(admin);
		transaction.commit();
		closeConnection();
		return admin;
	}
	
	public AdminPOJO SearchAdmin(String user, String pass) {
		openConnection();
		transaction.begin();
		
		String jpql = "FROM AdminPOJO a WHERE a.uName = :user AND a.pass = :pass";
	    query = manager.createQuery(jpql, AdminPOJO.class);
	    query.setParameter("user", user);
	    query.setParameter("pass", pass);
	    
	    
	    List<AdminPOJO> result = query.getResultList();
	    AdminPOJO admin = result.isEmpty() ? null : result.get(0);
	    
//	    AdminPOJO admin ;
//	    admin = (AdminPOJO) query.getSingleResult();
		
		transaction.commit();
		closeConnection();
		return admin;
	}

}
