<%@page import="com.linkcode.SpringMVC.POJO.EmployeePOJO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management - Remove Employee</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;500&display=swap" rel="stylesheet">

<style>
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}
body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #1f2b4d, #2c3e50, #4ca1af, #1f2b4d);
    background-size: 400% 400%;
    animation: gradientBG 20s ease infinite;
}
.navbar {
    background: rgba(0,0,0,0.6);
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
    padding: 15px 20px;
}

.page-wrapper {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding: 80px 20px 40px;
    min-height: 100vh;
}
.container {
    background: rgba(0, 0, 0, 0.45);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 30px;
    max-width: 900px;
    width: 100%;
    box-shadow: 0 15px 40px rgba(0,0,0,0.6);
    color: white;
}
h2 {
    font-family: 'Playfair Display', serif;
    color: gold;
    text-align: center;
    margin-bottom: 30px;
    font-size: 2.2rem;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.6);
}

.form-section {
    padding: 25px;
    background: rgba(0,0,0,0.35);
    border-radius: 15px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}
.form-group label {
    font-weight: bold;
    color: white;
}
.form-group input[type="text"] {
    padding: 12px;
    border: none;
    border-radius: 8px;
    width: 250px;
    outline: none;
    font-size: 16px;
    background: rgba(255,255,255,0.1);
    color: white;
    transition: all 0.3s ease;
}
.form-group input[type="text"]:focus {
    background: rgba(255,255,255,0.2);
    box-shadow: 0 0 8px gold;
}
.btn-remove {
    background: linear-gradient(135deg, gold, #f1c40f);
    border: none;
    padding: 12px 25px;
    border-radius: 50px;
    color: black;
    font-weight: bold;
    font-size: 16px;
    cursor: pointer;
    transition: all 0.3s ease;
}
.btn-remove:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0,0,0,0.3);
}
.message {
    text-align: center;
    font-size: 1.1em;
    padding: 12px;
    border-radius: 8px;
    font-weight: bold;
    margin-top: 20px;
}
.message.success {
    background: rgba(46,204,113,0.2);
    color: #27ae60;
}
.message.error {
    background: rgba(231,76,60,0.2);
    color: #c0392b;
}


h2.table-heading {
    color: gold;
    text-align: center;
    margin: 30px 0 15px;
    font-size: 2rem;
}
table {
    width: 100%;
    border-collapse: collapse;
    border-radius: 12px;
    overflow: hidden;
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(8px);
    box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}
thead th {
    background: linear-gradient(to right, gold, #f1c40f);
    color: black;
    padding: 15px;
}
tbody td {
    padding: 12px;
    color: white;
}
tbody tr:nth-child(even) {
    background: rgba(255,255,255,0.05);
}
tbody tr:hover {
    background: rgba(255,255,255,0.1);
    transition: background 0.3s ease;
}
.footer {
    text-align: center;
    padding: 20px;
    color: white;
    font-size: 14px;
    margin-top: 40px;
}
@media (max-width: 768px) {
    .container {
        padding: 20px;
    }
    .form-group input[type="text"] {
        width: 100%;
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
        <h2>Remove Employee Record</h2>
        <div class="form-section">
            <form action="remove" method="post">
                <div class="form-group">
                    <label for="id">Employee ID:</label>
                    <input type="text" id="id" name="id" placeholder="Enter ID to remove" required>
                </div>
                <input type="submit" value="Remove" class="btn-remove">
            </form>
        </div>

        <% String msg =(String)request.getAttribute("msg"); %>
        <%if(msg!=null){ %>
            <div class="message success">
                <%=msg %>
            </div>
        <%} %>

        <% List<EmployeePOJO> emps=(List<EmployeePOJO>)request.getAttribute("employees"); %>
        <%if(emps!=null) { %>
            <h2 class="table-heading">Current Employees</h2>
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Contact</th>
                        <th>Designation</th>
                        <th>Salary</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(EmployeePOJO emp : emps){ %>
                    <tr>
                        <td><%=emp.getEmpId() %></td>
                        <td><%=emp.getEmpName() %></td>
                        <td><%=emp.getEmail() %></td>
                        <td><%=emp.getContact() %></td>
                        <td><%=emp.getDesignation() %></td>
                        <td><%=emp.getSalary() %></td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        <%} %>
    </div>
</div>

<div class="footer">
    <p>Employee Management System &copy; 2025</p>
</div>

</body>
</html>
