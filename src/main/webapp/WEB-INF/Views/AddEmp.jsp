<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String msg = (String) request.getAttribute("msg"); %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Employee</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;500&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">

<style>

body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #1f2b4d, #2c3e50, #4ca1af, #1f2b4d);
    background-size: 400% 400%;
    animation: gradientBG 15s ease infinite;
}
@keyframes gradientBG {
    0% { background-position: 0% 50% }
    50% { background-position: 100% 50% }
    100% { background-position: 0% 50% }
}

.page-wrapper {
    display: flex;
    justify-content: center;
    align-items: center;
    height: calc(100vh - 70px); /* subtract navbar height */
    padding: 20px;
    box-sizing: border-box;
}

.main-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: stretch;
    background: rgba(255, 255, 255, 0.12);
    backdrop-filter: blur(12px);
    border-radius: 20px;
    box-shadow: 0 15px 40px rgba(0,0,0,0.6);
    overflow: hidden;
    width: 90%;
    max-width: 950px;
    min-height: 420px;
    max-height: 620px;   /* prevents it from looking too tall */
    margin: auto;
    animation: fadeInUp 1s ease-in-out;
}


.form-section {
    flex: 1;
    min-width: 280px;
    padding: 35px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}


h2 {
    font-family: 'Playfair Display', serif;
    font-size: 1.8rem;
    color: gold;
    text-align: center;
    margin-bottom: 20px;
    text-shadow: 1px 1px 6px rgba(0,0,0,0.5);
}

.form-group {
    margin-bottom: 15px;
}
label {
    font-weight: 500;
    color: #fff;
}
input {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    border: none;
    border-radius: 8px;
    font-size: 15px;
    outline: none;
    background: rgba(255,255,255,0.15);
    color: #fff;
    transition: 0.3s;
}
input:focus {
    background: rgba(255,255,255,0.25);
    box-shadow: 0 0 6px rgba(255,215,0,0.7);
}

button {
    width: 100%;
    padding: 12px;
    background: linear-gradient(135deg, #ffd700, #ff9900);
    border: none;
    border-radius: 40px;
    color: #1f2b4d;
    font-weight: bold;
    font-size: 15px;
    cursor: pointer;
    transition: 0.3s;
}
button:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(255,215,0,0.6);
}

.image-section {
    flex: 1;
    min-width: 280px;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 25px;
    background: rgba(0,0,0,0.25);
}
.employee-img {
    width: 260px;
    max-width: 100%;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.6);
    animation: float 4s ease-in-out infinite;
}
@keyframes float {
    0% { transform: translateY(0) }
    50% { transform: translateY(-15px) }
    100% { transform: translateY(0) }
}


.msg {
    text-align: center;
    padding: 10px;
    margin-top: 15px;
    background: rgba(0, 0, 0, 0.5);
    color: #ffd700;
    border-radius: 10px;
}


@media (max-width: 768px) {
    .main-container {
        flex-direction: column;
        max-height: none;   /* allow auto height on small screens */
    }
    .form-section {
        padding: 25px;
    }
    .image-section {
        display: none; /* hide image for mobiles */
    }
}
</style>

</head>
<body>


<jsp:include page="Navbar.jsp" />

<div class="page-wrapper">
    <div class="main-container">
        <!-- Left Form Section -->
        <div class="form-section">
            <h2>Add New Employee</h2>
            <form action="./add" method="post">
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="name" placeholder="e.g., John Doe" required>
                </div>
                <div class="form-group">
                    <label for="emailAddress">Email Address</label>
                    <input type="email" id="emailAddress" name="email" placeholder="e.g., example@domain.com" required>
                </div>
                <div class="form-group">
                    <label for="contactNumber">Contact Number</label>
                    <input type="tel" id="contactNumber" name="contact" placeholder="e.g., 9876543210" required>
                </div>
                <div class="form-group">
                    <label for="designation">Designation</label>
                    <input type="text" id="designation" name="designation" placeholder="e.g., Software Engineer" required>
                </div>
                <div class="form-group">
                    <label for="salary">Salary</label>
                    <input type="number" id="salary" name="salary" placeholder="e.g., 50000" required>
                </div>
                <button type="submit">Add Employee</button>
            </form>

            <% if (msg != null) { %>
                <div class="msg"><%= msg %></div>
            <% } %>
        </div>

        <!-- Right Animated Section -->
        <div class="image-section">
            <img src="https://media.istockphoto.com/id/1819650280/photo/hr-hrm-human-resources-management-concept-check-resume-screening-employee-information-job.webp?a=1&b=1&s=612x612&w=0&k=20&c=GxGddmhbPviKO_sm67sAoRNsBUwzKKWJP3REZxqhwR8=" 
                 alt="Luxury Employee Illustration" class="employee-img">
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
