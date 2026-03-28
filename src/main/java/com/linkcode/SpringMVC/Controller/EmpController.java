package com.linkcode.SpringMVC.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.linkcode.SpringMVC.POJO.AdminPOJO;
import com.linkcode.SpringMVC.POJO.EmployeePOJO;
import com.linkcode.SpringMVC.Service.AdminService;
import com.linkcode.SpringMVC.Service.EmpService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EmpController 
{
	@Autowired
	private EmpService service;
	@Autowired
	private AdminService AdminService;
	
	
	@GetMapping("/")
	public String index() {
	    return "index"; // your index.jsp
	}
	
	@GetMapping("/home")
	public String home(@SessionAttribute(name = "login" , required = false) AdminPOJO admin,ModelMap map) 
	{
		if (admin!=null) 
		{
			return "Home";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
		
	}
	@GetMapping("/add")
	public String add(@SessionAttribute(name = "login" , required = false) AdminPOJO admin,ModelMap map) 
	{
		if (admin!=null) 
		{
			return "AddEmp";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
	}
	
	@PostMapping("/add")
	public String addData(@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("contact") long contact,
			@RequestParam("designation") String designation,
			@RequestParam("salary") double salary,
			@SessionAttribute(name = "login" , required = false) AdminPOJO admin,
			ModelMap map)
	{
		if (admin!=null) 
		{
			service.addEmployee(name,email,contact,designation,salary);
			return "AddEmp";	
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
	}
	
	
	@GetMapping("/search")
	public String search(@SessionAttribute(name = "login" , required = false) AdminPOJO admin,ModelMap map) 
	{
		if (admin!=null) 
		{
			return "Search";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";	
	}
	
	@PostMapping("/search")
	public String search(@RequestParam("id") int id,ModelMap map,@SessionAttribute(name = "login" , required = false) AdminPOJO admin) 
	{
		if (admin!=null) 
		{
			EmployeePOJO emp = service.search(id);
			if (emp!=null) 
			{
				map.addAttribute("msg", "Employee Found");
				map.addAttribute("emp", emp);	
				return "Search";
			}
			map.addAttribute("msg", "Employee Doesn't exists!!!!!!!!!!!");
			return "Search";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
	}
	
	@GetMapping("/remove")
	public String remove(ModelMap map, @SessionAttribute(name = "login" , required = false) AdminPOJO admin) 
	{
		if (admin!=null) 
		{
			List<EmployeePOJO> employees = EmpService.searchAllEmp();
			if (employees!=null) 
			{
				map.addAttribute("employees", employees);
				return "Remove";	
			}
			return "Remove";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
	}
	
	@PostMapping("/remove")
	public String removeData(@RequestParam("id") int id, ModelMap map,@SessionAttribute(name = "login" , required = false) AdminPOJO admin) 
	{
		if (admin!=null) 
		{
			List<EmployeePOJO> employees = EmpService.searchAllEmp();
			EmployeePOJO emp = service.removeEmp(id);
			if (emp != null) 
			{
				String msg = "Employee " +emp.getEmpId()+". "+emp.getEmpName() + " has been removed successfully.";
				map.addAttribute("msg", msg);
				map.addAttribute("employees", employees);
				return "Remove";
			}
			map.addAttribute("employees", employees);
			map.addAttribute("msg","Employee With This ID "+"("+id+")"+" Is Not Present!!!!!!!!");
			return "Remove";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
	}
	
	@GetMapping("/create")
	public String createAdmin() 
	{
		return "Create";
		
	}
	
	@PostMapping("/create")
	public String createAdmin(@RequestParam("username") String user,
			@RequestParam("password") String pass,ModelMap map) 
	{
		AdminPOJO admin = AdminService.addAdmin(user,pass);
		
		if (admin!=null) 
		{
			map.addAttribute("msg", "Account Created Succesfully.....");
			return "Login";
		}
		map.addAttribute("msg", "Account Not Created...");
		
		return "Create";
	}
	
	@GetMapping("/login")
	public String login() 
	{
		return "Login";
		
	}
	
	@PostMapping("/login")
	public String loginAdmin(@RequestParam("username") String user,
	                         @RequestParam("password") String pass,
	                         ModelMap map,
	                         HttpServletRequest request) {

	    AdminPOJO admin = AdminService.searchAdmin(user, pass);

	    if (admin != null) 
	    {
	        HttpSession session = request.getSession();
	        session.setAttribute("login", admin);
	        session.setMaxInactiveInterval(5000);
	        return "Home";
	    }

	    map.addAttribute("msg", "Incorrect Credentials!");
	    return "Login";
	}
	
	@GetMapping("/update")
	public String update(ModelMap map,@SessionAttribute(name = "login" , required = false) AdminPOJO admin) 
	{
		if (admin!=null) 
		{
			List<EmployeePOJO> emps = service.searchAllEmp();
			if(emps!=null) 
			{
				map.addAttribute("emps",emps);
				return "Update";
			}
			return "Update";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
	}
	
	@PostMapping("/update")
	public String findEmp(@RequestParam("id") int id, ModelMap map,@SessionAttribute(name = "login" , required = false) AdminPOJO admin) 
	{
		if (admin!=null) 
		{
			EmployeePOJO emp = service.search(id);
			if (emp!=null)
			{
				map.addAttribute("emp", emp);
				return "Update";	
			}
			
			return "Update";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
	}
	
	@PostMapping("/updateEmployee")
	public String updateData(@RequestParam("id") int id,
							 @RequestParam("name") String name,
							 @RequestParam("email") String email,
							 @RequestParam("contact") long contact,
							 @RequestParam("designation") String designation,
							 @RequestParam("salary") double salary,
							 ModelMap map,
							 @SessionAttribute(name = "login" , required = false) AdminPOJO admin)
	{
		if (admin!=null) 
		{
			EmployeePOJO emp = service.updateEmpDetails(id,name,email,contact,designation,salary);
			
			if (emp!=null) 
			{
				map.addAttribute("msg", "Employee Updated Sucessfullyyyy");
			}
			else {
				map.addAttribute("msg", "Employee Updated Failed");
			}
			return "Update";
		}
		map.addAttribute("msg", "Please LoggedIn Yourself First!!!!!!!!");
		return "Login";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) 
	{
		session.invalidate();
		return "login";
	}
	

}
