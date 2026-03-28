<!DOCTYPE html>
<%@page import="com.linkcode.SpringMVC.POJO.EmployeePOJO"%>
<%@page import="java.util.List"%>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Management</title>
    <style>
        :root {
            --light-blue-1: #e9f0f8;
            --light-blue-2: #dbe7f2;
            --main-blue: #3498db;
            --text-dark: #333;
            --text-light: #555;
            --white: #fff;
        }
 
 body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: 'Poppins', sans-serif;
    background: url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d?auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
    background-size: cover;
}


.page-wrapper {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
    padding: 100px 20px 40px 20px;
    box-sizing: border-box;
}

.container {
    background: rgba(255, 255, 255, 0.25);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 30px;
    max-width: 900px;
    width: 100%;
    box-shadow: 0 15px 40px rgba(0,0,0,0.6);
    animation: fadeInUp 1s ease-in-out;
}
h2, h3 {
    font-family: 'Playfair Display', serif;
    color: gold;
    text-align: center;
    margin-bottom: 30px;
    font-size: 2.2rem;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.6);
}
.card {
    background: rgba(255, 255, 255, 0.2);
    backdrop-filter: blur(10px);
    padding: 30px;
    border-radius: 15px;
    margin-bottom: 30px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
}
form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.form-row {
    display: flex;
    flex-direction: column;
    gap: 5px;
}

label {
    font-weight: 500;
    color: black;
}

input[type="text"], input[type="number"] {
    padding: 12px;
    border-radius: 8px;
    border: solid gold 1px;
    outline: none;
    background: rgba(255,255,255,0.15);
    color: grey;
    font-size: 16px;
    backdrop-filter: blur(5px);
}

input[type="submit"] {
    background: linear-gradient(135deg, gold, #f1c40f);
    color: #111;
    padding: 12px;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    transition: all 0.3s ease;
}
input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0,0,0,0.3);
}

/* Table styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 30px;
    border-radius: 12px;
    overflow: hidden;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(8px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
}
th, td {
    padding: 15px;
    text-align: center;
    color: black;
}
th {
    background: linear-gradient(to right, gold, #f1c40f);
    font-weight: 600;
}
tr:nth-child(even) td {
    background-color: rgba(255,255,255,0.05);
}
tr:hover td {
    background-color: rgba(255,255,255,0.1);
}

/* Message Box */
.message {
    text-align: center;
    padding: 15px;
    border-radius: 8px;
    font-weight: bold;
    margin-bottom: 20px;
    background-color: rgba(46, 204, 113, 0.2);
    color: #27ae60;
}
@keyframes fadeInUp {
    0% { opacity: 0; transform: translateY(50px);}
    100% { opacity: 1; transform: translateY(0);}
}
.footer {
    text-align: center;
    padding: 20px;
    color: black;
    font-size: 10px;
}
@media (max-width: 768px) {
    .container {
        width: 95%;
        padding: 20px;
    }
    .form-row {
        flex-direction: column;
    }
    input[type="submit"] {
        padding: 12px;
    }
    table {
        display: block;
        overflow-x: auto;
    }
}

</style>
</head>
<body>
 
    
<jsp:include page="Navbar.jsp"/>
<div class="page-wrapper">
    <div class="container">
        <h2>Employee Management System</h2>

        <%
			String msg = (String) request.getAttribute("msg");
			if(msg != null){
		%>
			<div class="message success">
    		<p><%=msg %></p>
			</div>
		<%
			}
		%>

        <div class="card">
            <form action="./update" method="post">
                <h3>Find Employee to Update</h3>
                <div class="form-row">
                    <label for="find-id">Enter Employee ID:</label>
                    <input type="text" id="find-id" name="id" required>
                </div>
                <input type="submit" value="Find Employee">
            </form>
        </div>

        <hr>

        <%List<EmployeePOJO> emps = (List<EmployeePOJO>)request.getAttribute("emps"); %>
        <% EmployeePOJO emp = (EmployeePOJO)request.getAttribute("emp"); %>
        <%if(emp!=null){ %>
        <div class="card">
            <h3>Update Employee Details</h3>
            <form action="./updateEmployee" method="post">
                <input type="hidden" name="id" value="<%=emp.getEmpId() %>" />

                <div class="form-row">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%=emp.getEmpName() %>" required>
                </div>

                <div class="form-row">
                    <label for="email">Email:</label>
                    <input type="text" id="email" name="email" value="<%=emp.getEmail() %>" required>
                </div>

                <div class="form-row">
                    <label for="contact">Contact:</label>
                    <input type="text" id="contact" name="contact" value="<%=emp.getContact() %>" required>
                </div>

                <div class="form-row">
                    <label for="designation">Designation:</label>
                    <input type="text" id="designation" name="designation" value="<%=emp.getDesignation() %>" required>
                </div>

                <div class="form-row">
                    <label for="salary">Salary:</label>
                    <input type="number" id="salary" name="salary" value="<%=emp.getSalary() %>" required>
                </div>

                <input type="submit" value="Update Employee">
            </form>
        </div>
        <hr>
        <%} %>

        <%if(emps!=null){ %>
        <div class="card">
            <h3>All Employees</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Designation</th>
                        <th>Salary</th>
                    </tr>
                </thead>
                <tbody>
                <%for(EmployeePOJO employees : emps) {%>
                    <tr>
                        <td><%=employees.getEmpId() %></td>
                        <td><%=employees.getEmpName() %></td>
                        <td><%=employees.getEmail() %></td>
                        <td><%=employees.getContact() %></td>
                        <td><%=employees.getDesignation() %></td>
                        <td><%=employees.getSalary() %></td>
                    </tr>
                <%} %>
                </tbody>
            </table>
        </div>
        <%} %>

        <div class="footer">
            Employee Management System © 2025
        </div>
    </div>
</div>

</body>
</html>