<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - Employee Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;500&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1f4037, #2c5364, #0f2027, #203a43);
            background-size: 400% 400%;
            animation: gradientBG 20s ease infinite;
            color: white;
        }

    
        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .hero-section {
            position: relative;
            text-align: center;
            padding: 150px 20px;
            background: url('https://images.unsplash.com/photo-1531497865147-9a6e7a1e2f91?auto=format&fit=crop&w=1650&q=80') no-repeat center center/cover;
            border-bottom: 3px solid gold;
        }
        .hero-overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: linear-gradient(rgba(0,0,0,0.7), rgba(31,43,77,0.7));
            z-index: 1;
        }
        .hero-content {
            position: relative;
            z-index: 2;
        }
        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: 700;
            font-family: 'Playfair Display', serif;
            color: gold;
            text-shadow: 0 4px 12px rgba(0,0,0,0.8);
        }
        .hero-section p {
            font-size: 1.3rem;
            margin-top: 20px;
            color: #f1f1f1;
        }
        .hero-section .btn {
            margin-top: 30px;
            background: linear-gradient(135deg, gold, #f1c40f);
            border: none;
            color: black;
            font-weight: bold;
            padding: 12px 30px;
            border-radius: 50px;
            transition: all 0.3s ease;
        }
        .hero-section .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
        }

      
        .action-cards .card {
            border: none;
            border-radius: 18px;
            background: rgba(255,255,255,0.1);
            backdrop-filter: blur(12px);
            color: white;
            transition: all 0.4s ease;
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
        }
        .action-cards .card:hover {
            transform: translateY(-10px) scale(1.04);
            box-shadow: 0 12px 35px rgba(0,0,0,0.6);
            border: 1px solid gold;
        }
        .action-cards .card-title {
            color: gold;
            font-family: 'Playfair Display', serif;
            font-weight: 600;
        }
        .action-cards .btn {
            border-radius: 40px;
            font-weight: bold;
            transition: all 0.3s ease;
        }
        .btn-primary { background: linear-gradient(135deg, #1f2b4d, #4ca1af); border: none; }
        .btn-success { background: linear-gradient(135deg, #11998e, #38ef7d); border: none; }
        .btn-warning { background: linear-gradient(135deg, gold, #f1c40f); border: none; color: black; }
        .btn-danger { background: linear-gradient(135deg, #e52d27, #b31217); border: none; }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.4);
        }


        footer {
            background: rgba(0,0,0,0.85);
            color: #ddd;
            padding: 25px 0;
            text-align: center;
            border-top: 2px solid rgba(255,215,0,0.4);
        }
        footer p {
            margin: 0;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>

    <jsp:include page="Navbar.jsp"/>

    <section class="hero-section">
        <div class="hero-overlay"></div>
        <div class="hero-content container">
            <h1 class="animate__animated animate__fadeInDown">Welcome to Employee Management</h1>
            <p class="animate__animated animate__fadeInUp">Manage employee data efficiently and elegantly — add, search, update, and delete records seamlessly.</p>
            <a href="#actions" class="btn animate__animated animate__fadeInUp">Get Started</a>
        </div>
    </section>

    <section id="actions" class="container my-5 action-cards">
        <div class="row g-4 text-center">
            <div class="col-md-3">
                <div class="card h-100 p-4">
                    <h5 class="card-title">Add Employee</h5>
                    <p class="card-text">Create a new employee record with ease.</p>
                    <a href="./add" class="btn btn-primary">Add</a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card h-100 p-4">
                    <h5 class="card-title">Search Employee</h5>
                    <p class="card-text">Find employee details quickly and easily.</p>
                    <a href="./search" class="btn btn-success">Search</a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card h-100 p-4">
                    <h5 class="card-title">Update Info</h5>
                    <p class="card-text">Modify employee data whenever necessary.</p>
                    <a href="./update" class="btn btn-warning">Update</a>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card h-100 p-4">
                    <h5 class="card-title">Remove Employee</h5>
                    <p class="card-text">Delete records securely and efficiently.</p>
                    <a href="./remove" class="btn btn-danger">Remove</a>
                </div>
            </div>
        </div>
    </section>
    
    <footer>
        <div class="container">
            <p>&copy; 2025 Employee Management System. All rights reserved.</p>
        </div>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
