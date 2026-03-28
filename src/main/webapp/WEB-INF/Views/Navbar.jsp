<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Management</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@400;500&display=swap" rel="stylesheet">

<style>
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.custom-navbar {
    background: linear-gradient(135deg, rgba(31,43,77,0.95), rgba(44,62,80,0.95), rgba(76,161,175,0.95));
    background-size: 400% 400%;
    animation: gradientBG 18s ease infinite;
    box-shadow: 0 8px 25px rgba(0,0,0,0.5);
    font-family: 'Poppins', sans-serif;
    padding: 14px 30px;
    backdrop-filter: blur(12px);
    border-bottom: 2px solid rgba(255, 215, 0, 0.3);
    transition: all 0.3s ease;
}

.custom-navbar .navbar-brand {
    font-weight: 700;
    font-size: 1.9rem;
    color: gold;
    font-family: 'Playfair Display', serif;
    text-shadow: 0 2px 5px rgba(0,0,0,0.6);
    transition: transform 0.3s ease;
}
.custom-navbar .navbar-brand:hover {
    transform: scale(1.08);
}

.custom-navbar .navbar-nav .nav-link {
    font-weight: 500;
    color: white;
    margin-left: 18px;
    padding: 10px 18px;
    border-radius: 10px;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.custom-navbar .navbar-nav .nav-link:hover {
    background: rgba(255, 215, 0, 0.15);
    color: gold;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.4);
}
.custom-navbar .navbar-nav .nav-link:active {
    transform: scale(0.95);
}

.custom-navbar .navbar-nav .nav-link.active {
    color: gold;
    font-weight: 600;
    border-bottom: 2px solid gold;
}

.custom-navbar .navbar-toggler {
    border: none;
    color: white;
    font-size: 1.4rem;
}
.custom-navbar .navbar-toggler:focus {
    outline: none;
    box-shadow: none;
}
.custom-navbar .navbar-toggler:hover {
    background: rgba(255, 255, 255, 0.2);
    border-radius: 6px;
}

/* Navbar collapse background */
.custom-navbar .navbar-collapse {
    background: rgba(25, 35, 50, 0.95);
    padding: 12px;
    border-radius: 12px;
    margin-top: 10px;
    box-shadow: inset 0 0 8px rgba(0,0,0,0.4);
}

@media (max-width: 991.98px) {
    .custom-navbar .navbar-nav {
        text-align: center;
    }
    .custom-navbar .navbar-nav .nav-link {
        margin: 6px 0;
        display: block;
    }
}
</style>
</head>
<body>

<nav class="navbar navbar-expand-lg custom-navbar sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="./home">
        	<div class="brand">
            	<div class="brand-icon">
                	<i class="fa-solid fa-user-plus"></i>
            	</div>
            		<h2>Employee<span>MS</span></h2>
        		</div>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup">
            <span class="navbar-toggler-icon">☰</span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link" href="./home">Home</a>
                <a class="nav-link" href="./add">Add</a>
                <a class="nav-link" href="./search">Search</a>
                <a class="nav-link" href="./update">Update</a>
                <a class="nav-link" href="./remove">Remove</a>
                <a class="nav-link" href="./logout">Logout</a>
            </div>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
