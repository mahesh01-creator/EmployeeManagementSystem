package com.linkcode.SpringMVC.POJO;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;

@Entity
@Data
public class EmployeePOJO 
{
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int empId;
	private String empName;
	private String email;
	private long contact;
	private String designation;
	private double salary;

}
