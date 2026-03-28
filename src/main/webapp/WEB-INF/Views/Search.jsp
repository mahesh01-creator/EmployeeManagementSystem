<%@page import="org.springframework.ui.ModelMap"%>
<%@page import="com.linkcode.SpringMVC.POJO.EmployeePOJO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Search</title>
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
    background: url('https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
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
    background: rgba(255, 255, 255, 0.60);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 30px;
    max-width: 900px;
    width: 100%;
    box-shadow: 0 15px 40px rgba(0,0,0,0.6);
    animation: fadeInUp 1s ease-in-out;
}

h2 {
    font-family: 'Playfair Display', serif;
    color: gold;
    text-align: center;
    margin-bottom: 30px;
    font-size: 2.2rem;
    text-shadow: 1px 1px 5px rgba(0,0,0,0.6);
}

.search-box {
    display: flex;
    align-items: center;
    border: 2px solid rgba(255,255,255,0.4);
    border-radius: 50px;
    padding: 10px 20px;
    width: 100%;
    max-width: 500px;
    margin: 0 auto;
    background: rgba(255,255,255,0.2);
    box-shadow: 0 4px 15px rgba(0,0,0,0.3);
    transition: all 0.3s ease;
}
.search-box:hover {
    border-color: gold;
    box-shadow: 0 6px 20px rgba(0,0,0,0.4);
}
.search-box input[type="text"] {
    border: none;
    flex-grow: 1;
    padding: 12px;
    font-size: 16px;
    outline: none;
    background: transparent;
    color: white;
}
.search-box input[type="submit"] {
    background: linear-gradient(135deg, gold, #f1c40f);
    color: #111;
    border: none;
    padding: 10px 20px;
    border-radius: 50px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    transition: all 0.3s ease;
}
.search-box input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(0,0,0,0.4);
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 30px;
    border-radius: 12px;
    overflow: hidden;
    background: rgba(255,255,255,0.2);
    backdrop-filter: blur(8px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.3);
}
table th, table td {
    padding: 15px;
    text-align: left;
}
table th {
    background: linear-gradient(to right, gold, #f1c40f);
    color: #111;
    font-weight: 600;
    text-transform: uppercase;
}
table tr:nth-child(even) {
    background-color: rgba(255,255,255,0.05);
}
table tr:hover {
    background-color: rgba(255,255,255,0.1);
    transition: background-color 0.3s ease;
}


.message {
    text-align: center;
    padding: 15px;
    border-radius: 8px;
    font-weight: bold;
    margin-top: 20px;
    background: rgba(231, 76, 60, 0.2);
    color: #c0392b;
}
@keyframes fadeInUp {
    0% { opacity: 0; transform: translateY(50px);}
    100% { opacity: 1; transform: translateY(0);}
}

@media (max-width: 768px) {
    .container {
        width: 95%;
        padding: 20px;
    }
    .search-box {
        flex-direction: column;
        padding: 15px;
    }
    .search-box input[type="text"] {
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
        <h2>Search Employee</h2>

        <form action="./search" method="post">
            <div class="search-box">
                <input type="text" name="id" placeholder="Enter Employee ID" required>
                <input type="submit" value="Search">
            </div>
        </form>

        <%String msg=(String)request.getAttribute("msg");%> 
        <%EmployeePOJO emp= (EmployeePOJO)request.getAttribute("emp"); %>

        <%if(msg!=null) {%>
            <div class="message error">
                <h3><%=msg %></h3>
            </div>
        <%} %>

        <%if(emp!=null) {%>
            <table class="result-table">
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
                    <tr>
                        <td><%=emp.getEmpId() %></td>
                        <td><%=emp.getEmpName() %></td>
                        <td><%=emp.getEmail() %></td>
                        <td><%=emp.getContact() %></td>
                        <td><%=emp.getDesignation() %></td>
                        <td><%=emp.getSalary() %></td>
                    </tr>
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
