package com.linkcode.SpringMVC.POJO;

import javax.annotation.processing.Generated;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class AdminPOJO 
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	private int id;
	private String uName;
	private String pass;
	
}
