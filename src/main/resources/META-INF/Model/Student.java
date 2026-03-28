package StudentManagment.Model;

import java.util.HashSet;
import java.util.Set;

import javax.annotation.processing.Generated;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Entity
public class Student 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int sId;
	private String sName;
	private String eMail;
	private double Pfees;
	
	@ManyToMany
	private Set<Course> courses = new HashSet<Course>();

}
