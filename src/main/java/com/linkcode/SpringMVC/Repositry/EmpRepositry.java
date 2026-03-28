package com.linkcode.SpringMVC.Repositry;

import java.util.List;
import java.util.Scanner;

import org.springframework.stereotype.Repository;

import com.linkcode.SpringMVC.POJO.EmployeePOJO;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.Query;

@Repository
public class EmpRepositry 
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
	
	public void addEmp(String name, String email, long contact, String designation, double salary) 
	{
		openConnection();
		transaction.begin();
	
		EmployeePOJO emp = new EmployeePOJO();
		emp.setEmpName(name);
		emp.setEmail(email);
		emp.setContact(contact);
		emp.setDesignation(designation);
		emp.setSalary(salary);
		
		manager.persist(emp);
		System.out.println("Employee Added!!!!!!!!");
		transaction.commit();
		closeConnection();

	}
	public EmployeePOJO searchEmp(int id) {
		
		openConnection();
		transaction.begin();
	
		EmployeePOJO emp = manager.find(EmployeePOJO.class, id);
	
		transaction.commit();
		closeConnection();
		
		return emp;
	}
	public static List<EmployeePOJO> searchAllEmp() {
		openConnection();
		transaction.begin();
		
		String jpql = "from EmployeePOJO";
		query = manager.createQuery(jpql);
		List<EmployeePOJO> emps = query.getResultList();
//		emps.forEach(val-> System.out.println(val.getEmpName()));
		
		transaction.commit();
		closeConnection();
		return emps;
	}
	public EmployeePOJO removeEmp(int id) {
		openConnection();
		transaction.begin();
		
		EmployeePOJO emp = manager.find(EmployeePOJO.class, id);
		manager.remove(emp);
		transaction.commit();
		closeConnection();
		return emp;
	}
	public EmployeePOJO updateEmpDetails(int id, String name, String email, long contact, String designation, double salary) {
		openConnection();
		transaction.begin();
		
		EmployeePOJO emp = manager.find(EmployeePOJO.class, id);
		emp.setEmpName(name);
		emp.setEmail(email);
		emp.setContact(contact);
		emp.setDesignation(designation);
		emp.setSalary(salary);
		
		manager.persist(emp);
		transaction.commit();
		closeConnection();
		return emp;
	}

	
}
