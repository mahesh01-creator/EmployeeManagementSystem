package StudentManagment.Model;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
//@Data
@NoArgsConstructor
@Entity
public class Course 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cId;
	private String cTitle;
	private String duration;
	private double Fees;
	
	
	@ManyToMany(mappedBy = "courses")
	private Set<Student> students = new HashSet<Student>();
}
