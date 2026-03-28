<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Management System | Smart Workforce Solution</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #0b1020, #11182f, #1b2450);
            color: #fff;
            overflow-x: hidden;
            position: relative;
        }

        /* Background glow effects */
        body::before,
        body::after {
            content: "";
            position: absolute;
            border-radius: 50%;
            filter: blur(100px);
            z-index: 0;
        }

        body::before {
            width: 300px;
            height: 300px;
            background: rgba(0, 170, 255, 0.25);
            top: 50px;
            left: -80px;
        }

        body::after {
            width: 350px;
            height: 350px;
            background: rgba(128, 90, 213, 0.25);
            bottom: 30px;
            right: -100px;
        }

        .container {
            width: 90%;
            max-width: 1300px;
            margin: auto;
            position: relative;
            z-index: 2;
        }

        /* Navbar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 24px 0;
        }

        .logo {
            font-size: 28px;
            font-weight: 700;
            color: #fff;
            letter-spacing: 1px;
        }

        .logo span {
            color: #64b5ff;
        }

        .nav-buttons {
            display: flex;
            gap: 15px;
        }

        .btn {
            padding: 12px 24px;
            border-radius: 40px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
            border: 1px solid transparent;
        }

        .btn-outline {
            color: #fff;
            border: 1px solid rgba(255,255,255,0.25);
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(10px);
        }

        .btn-outline:hover {
            background: rgba(255,255,255,0.12);
            transform: translateY(-2px);
        }

        .btn-primary {
            background: linear-gradient(135deg, #4facfe, #6a5af9);
            color: white;
            box-shadow: 0 10px 30px rgba(79, 172, 254, 0.35);
        }

        .btn-primary:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 15px 35px rgba(79, 172, 254, 0.45);
        }

        /* Hero */
        .hero {
            display: grid;
            grid-template-columns: 1.2fr 1fr;
            align-items: center;
            gap: 40px;
            padding: 60px 0 80px;
        }

        .hero-content h4 {
            color: #9dc7ff;
            font-size: 18px;
            font-weight: 500;
            margin-bottom: 12px;
            letter-spacing: 1px;
        }

        .hero-content h1 {
            font-size: 58px;
            line-height: 1.15;
            margin-bottom: 20px;
            font-weight: 800;
        }

        .hero-content h1 span {
            background: linear-gradient(90deg, #6dd5fa, #8e7dff, #d66efd);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-content p {
            font-size: 17px;
            color: #d6ddf5;
            line-height: 1.8;
            margin-bottom: 30px;
            max-width: 650px;
        }

        .hero-buttons {
            display: flex;
            gap: 18px;
            flex-wrap: wrap;
            margin-bottom: 35px;
        }

        .stats {
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
        }

        .stat-box {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.12);
            backdrop-filter: blur(14px);
            border-radius: 20px;
            padding: 18px 24px;
            min-width: 150px;
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
        }

        .stat-box h3 {
            font-size: 28px;
            color: #fff;
            margin-bottom: 4px;
        }

        .stat-box p {
            font-size: 14px;
            margin: 0;
            color: #c8d3f0;
        }

        /* Hero card */
        .hero-visual {
            display: flex;
            justify-content: center;
        }

        .dashboard-card {
            width: 100%;
            max-width: 500px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255,255,255,0.14);
            backdrop-filter: blur(18px);
            border-radius: 28px;
            padding: 30px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.28);
            position: relative;
            overflow: hidden;
        }

        .dashboard-card::before {
            content: "";
            position: absolute;
            width: 180px;
            height: 180px;
            background: rgba(100, 181, 255, 0.15);
            top: -60px;
            right: -60px;
            border-radius: 50%;
            filter: blur(10px);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            position: relative;
            z-index: 2;
        }

        .card-header h3 {
            font-size: 22px;
            font-weight: 700;
        }

        .status-badge {
            background: rgba(72, 187, 120, 0.18);
            color: #86efac;
            padding: 8px 16px;
            border-radius: 30px;
            font-size: 13px;
            border: 1px solid rgba(134, 239, 172, 0.25);
        }

        .mini-panel {
            background: rgba(255,255,255,0.06);
            border-radius: 18px;
            padding: 18px;
            margin-bottom: 16px;
            border: 1px solid rgba(255,255,255,0.08);
            position: relative;
            z-index: 2;
        }

        .mini-panel h4 {
            font-size: 16px;
            margin-bottom: 10px;
            color: #dce8ff;
        }

        .mini-panel p {
            font-size: 14px;
            color: #b9c7e8;
            line-height: 1.7;
        }

        .progress-bar {
            width: 100%;
            height: 10px;
            background: rgba(255,255,255,0.09);
            border-radius: 20px;
            overflow: hidden;
            margin-top: 12px;
        }

        .progress-fill {
            width: 82%;
            height: 100%;
            background: linear-gradient(90deg, #4facfe, #8e7dff);
            border-radius: 20px;
        }

        /* Features */
        .section-title {
            text-align: center;
            margin-bottom: 18px;
            font-size: 38px;
            font-weight: 700;
        }

        .section-subtitle {
            text-align: center;
            color: #cbd6f1;
            max-width: 760px;
            margin: 0 auto 50px;
            line-height: 1.8;
            font-size: 16px;
        }

        .features {
            padding: 30px 0 80px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }

        .feature-card {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(255,255,255,0.12);
            backdrop-filter: blur(16px);
            border-radius: 24px;
            padding: 28px;
            transition: all 0.35s ease;
            box-shadow: 0 10px 35px rgba(0,0,0,0.16);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            border-color: rgba(100, 181, 255, 0.35);
            box-shadow: 0 20px 50px rgba(0,0,0,0.22);
        }

        .feature-icon {
            width: 62px;
            height: 62px;
            border-radius: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, rgba(79,172,254,0.18), rgba(106,90,249,0.20));
            color: #8fc7ff;
            font-size: 24px;
            margin-bottom: 18px;
        }

        .feature-card h3 {
            font-size: 21px;
            margin-bottom: 12px;
        }

        .feature-card p {
            color: #c8d3ee;
            line-height: 1.8;
            font-size: 15px;
        }

        /* CTA section */
        .cta-section {
            padding: 30px 0 90px;
        }

        .cta-box {
            background: linear-gradient(135deg, rgba(79,172,254,0.12), rgba(106,90,249,0.12));
            border: 1px solid rgba(255,255,255,0.14);
            backdrop-filter: blur(18px);
            border-radius: 30px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 15px 50px rgba(0,0,0,0.20);
        }

        .cta-box h2 {
            font-size: 36px;
            margin-bottom: 16px;
        }

        .cta-box p {
            color: #d7e1f7;
            max-width: 800px;
            margin: 0 auto 28px;
            line-height: 1.8;
        }

        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 18px;
            flex-wrap: wrap;
        }

        /* Footer */
        footer {
            border-top: 1px solid rgba(255,255,255,0.08);
            padding: 25px 0;
            text-align: center;
            color: #bfc9e6;
            font-size: 14px;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .hero {
                grid-template-columns: 1fr;
                text-align: center;
            }

            .hero-content p {
                margin-left: auto;
                margin-right: auto;
            }

            .hero-buttons,
            .stats {
                justify-content: center;
            }

            .feature-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .hero-content h1 {
                font-size: 44px;
            }
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 20px;
            }

            .feature-grid {
                grid-template-columns: 1fr;
            }

            .hero-content h1 {
                font-size: 36px;
            }

            .section-title {
                font-size: 30px;
            }

            .cta-box {
                padding: 30px 20px;
            }

            .cta-box h2 {
                font-size: 28px;
            }

            .btn {
                width: 100%;
                text-align: center;
            }

            .nav-buttons {
                width: 100%;
                flex-direction: column;
            }

            .hero-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>

<div class="container">

    <!-- Navbar -->
    <nav class="navbar">
        <div class="logo">Employee<span>MS</span></div>
        <div class="nav-buttons">
            <a href="login" class="btn btn-outline">Login</a>
            <a href="create" class="btn btn-primary">Get Started</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h4>SMART WORKFORCE MANAGEMENT PLATFORM</h4>
            <h1>Modern <span>Employee Management System</span> for Efficient Business Operations</h1>
            <p>
                Streamline employee records, organize workforce data, and simplify administrative tasks with a secure,
                scalable, and user-friendly employee management solution. Designed to enhance productivity, improve data handling,
                and provide seamless access to workforce information.
            </p>

            <div class="hero-buttons">
                <a href="login" class="btn btn-primary">
                    <i class="fa-solid fa-right-to-bracket"></i> Login
                </a>
                <a href="create" class="btn btn-outline">
                    <i class="fa-solid fa-user-plus"></i> Sign Up
                </a>
            </div>

            <div class="stats">
                <div class="stat-box">
                    <h3>Secure</h3>
                    <p>Protected access control</p>
                </div>
                <div class="stat-box">
                    <h3>Scalable</h3>
                    <p>Built with Spring MVC</p>
                </div>
                <div class="stat-box">
                    <h3>Efficient</h3>
                    <p>Faster employee operations</p>
                </div>
            </div>
        </div>

        <div class="hero-visual">
            <div class="dashboard-card">
                <div class="card-header">
                    <h3>System Overview</h3>
                    <span class="status-badge">Active</span>
                </div>

                <div class="mini-panel">
                    <h4><i class="fa-solid fa-users"></i> Employee Records</h4>
                    <p>
                        Centralized and well-structured employee information management for easy tracking,
                        updating, and administration.
                    </p>
                </div>

                <div class="mini-panel">
                    <h4><i class="fa-solid fa-chart-line"></i> Performance Workflow</h4>
                    <p>
                        Optimized operations with smooth navigation, clean UI pages, and reliable backend processing.
                    </p>
                    <div class="progress-bar">
                        <div class="progress-fill"></div>
                    </div>
                </div>

                <div class="mini-panel">
                    <h4><i class="fa-solid fa-shield-halved"></i> Secure Access</h4>
                    <p>
                        Authentication-based access to manage employee data safely with professional enterprise-style design.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Features -->
    <section class="features">
        <h2 class="section-title">Core System Features</h2>
        <p class="section-subtitle">
            This Employee Management System is designed to provide a clean, professional, and practical solution
            for managing employee-related operations with better usability, organized records, and reliable workflows.
        </p>

        <div class="feature-grid">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-id-badge"></i>
                </div>
                <h3>Employee Profile Management</h3>
                <p>
                    Maintain employee details in a structured format with easy data access, updates, and record handling.
                </p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-database"></i>
                </div>
                <h3>Centralized Data Handling</h3>
                <p>
                    Store and manage all employee information efficiently using a robust backend and database integration.
                </p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-lock"></i>
                </div>
                <h3>Authentication Access</h3>
                <p>
                    Secure login and signup functionality helps ensure that only authorized users access the system.
                </p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-layer-group"></i>
                </div>
                <h3>MVC Architecture</h3>
                <p>
                    Built on Spring MVC architecture for better code organization, maintainability, and scalability.
                </p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-gauge-high"></i>
                </div>
                <h3>User-Friendly Interface</h3>
                <p>
                    Designed with intuitive JSP pages and modern layouts to improve navigation and user experience.
                </p>
            </div>

            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fa-solid fa-briefcase"></i>
                </div>
                <h3>Business Ready Design</h3>
                <p>
                    A professional interface suitable for showcasing as an academic, internship, or portfolio project.
                </p>
            </div>
        </div>
    </section>

    <!-- CTA -->
    <section class="cta-section">
        <div class="cta-box">
            <h2>Access the Employee Management Portal</h2>
            <p>
                Get started with a premium workforce management experience. Sign in to manage employee records,
                or create a new account to access the system and explore its features.
            </p>

            <div class="cta-buttons">
                <a href="login" class="btn btn-primary">
                    <i class="fa-solid fa-right-to-bracket"></i> Login Now
                </a>
                <a href="create" class="btn btn-outline">
                    <i class="fa-solid fa-user-plus"></i> Create Account
                </a>
            </div>
        </div>
    </section>

</div>

<footer>
    © 2025 Employee Management System.
</footer>

</body>
</html>