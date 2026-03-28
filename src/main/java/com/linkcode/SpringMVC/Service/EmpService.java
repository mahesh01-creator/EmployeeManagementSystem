package com.linkcode.SpringMVC.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linkcode.SpringMVC.POJO.AdminPOJO;
import com.linkcode.SpringMVC.POJO.EmployeePOJO;
import com.linkcode.SpringMVC.Repositry.EmpRepositry;

@Service
public class EmpService 
{
	@Autowired
	private EmpRepositry repositry;

	public void addEmployee(String name, String email, long contact, String designation, double salary) 
	{
		repositry.addEmp(name, email, contact, designation, salary);

	}

	public EmployeePOJO search(int id) 
	{
		EmployeePOJO emp = repositry.searchEmp(id);
		return emp;
	}

	public static List<EmployeePOJO> searchAllEmp() {
		List<EmployeePOJO> employees = EmpRepositry.searchAllEmp();
		return employees;
	}

	public EmployeePOJO removeEmp(int id) {
		EmployeePOJO emp = repositry.removeEmp(id);
		return emp;
	}

	public EmployeePOJO updateEmpDetails(int id, String name, String email, long contact, String designation, double salary) {
		EmployeePOJO emp = repositry.updateEmpDetails(id , name, email, contact, designation, salary);
		return emp;
	}

	

}
