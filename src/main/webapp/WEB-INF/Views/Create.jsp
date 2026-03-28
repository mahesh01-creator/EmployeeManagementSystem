<!DOCTYPE html>
<html lang="en">
<%@page import="com.linkcode.SpringMVC.POJO.EmployeePOJO"%>
<%@page import="java.util.List"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Admin Account</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:30px 15px;
    color:#fff;
    overflow:hidden;
    position:relative;
    background:
        linear-gradient(135deg, rgba(6,10,24,0.96), rgba(14,25,50,0.94), rgba(20,37,74,0.95)),
        url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1600&q=80');
    background-size:cover;
    background-position:center;
    background-attachment:fixed;
}

/* Background glow */
body::before,
body::after{
    content:"";
    position:absolute;
    border-radius:50%;
    filter:blur(90px);
    z-index:0;
}
body::before{
    width:280px;
    height:280px;
    background:rgba(245,158,11,0.20);
    top:-30px;
    left:-50px;
}
body::after{
    width:330px;
    height:330px;
    background:rgba(59,130,246,0.20);
    bottom:-70px;
    right:-70px;
}

/* Floating shapes */
.shape{
    position:absolute;
    border-radius:50%;
    opacity:0.22;
    animation:float 12s infinite ease-in-out;
    z-index:1;
}
.shape1{
    width:160px;
    height:160px;
    background:linear-gradient(135deg,#ffd700,#f59e0b);
    top:12%;
    left:12%;
}
.shape2{
    width:210px;
    height:210px;
    background:linear-gradient(135deg,#38bdf8,#2563eb);
    bottom:10%;
    right:10%;
    animation-delay:2s;
}
.shape3{
    width:120px;
    height:120px;
    background:linear-gradient(135deg,#c084fc,#7c3aed);
    top:20%;
    right:16%;
    animation-delay:4s;
}

@keyframes float{
    0%,100%{transform:translateY(0) rotate(0deg);}
    50%{transform:translateY(-30px) rotate(30deg);}
}

.wrapper{
    width:100%;
    max-width:1120px;
    display:grid;
    grid-template-columns:1fr 1fr;
    background:rgba(255,255,255,0.08);
    border:1px solid rgba(255,255,255,0.14);
    border-radius:30px;
    overflow:hidden;
    backdrop-filter:blur(20px);
    box-shadow:0 25px 60px rgba(0,0,0,0.45);
    position:relative;
    z-index:2;
}

/* Left panel */
.left-panel{
    padding:55px 45px;
    display:flex;
    flex-direction:column;
    justify-content:center;
    background:linear-gradient(180deg, rgba(255,255,255,0.05), rgba(255,255,255,0.02));
    border-right:1px solid rgba(255,255,255,0.08);
}

.brand{
    display:inline-flex;
    align-items:center;
    gap:12px;
    margin-bottom:24px;
}
.brand-icon{
    width:52px;
    height:52px;
    border-radius:16px;
    background:linear-gradient(135deg,#f59e0b,#facc15);
    display:flex;
    align-items:center;
    justify-content:center;
    box-shadow:0 10px 25px rgba(245,158,11,0.35);
}
.brand-icon i{
    font-size:22px;
    color:#111827;
}
.brand h2{
    font-size:28px;
    font-weight:700;
}
.brand h2 span{
    color:#ffd166;
}

.left-panel h1{
    font-size:44px;
    line-height:1.15;
    margin-bottom:16px;
    font-weight:800;
}
.left-panel h1 span{
    background:linear-gradient(90deg,#ffd166,#f59e0b,#7cc4ff);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.left-panel p{
    color:#d5def4;
    font-size:15px;
    line-height:1.9;
    margin-bottom:28px;
}

.highlight-list{
    display:grid;
    gap:16px;
}

.highlight-item{
    display:flex;
    gap:14px;
    align-items:flex-start;
    padding:16px 18px;
    border-radius:18px;
    background:rgba(255,255,255,0.06);
    border:1px solid rgba(255,255,255,0.08);
}

.highlight-item i{
    margin-top:3px;
    color:#ffd166;
    font-size:18px;
}

.highlight-item h4{
    font-size:15px;
    margin-bottom:4px;
}
.highlight-item p{
    margin:0;
    font-size:13px;
    color:#c9d4ec;
    line-height:1.7;
}

/* Right panel */
.right-panel{
    padding:45px 35px;
    display:flex;
    align-items:center;
    justify-content:center;
}

.card{
    width:100%;
    max-width:410px;
    background:rgba(255,255,255,0.07);
    border:1px solid rgba(255,255,255,0.14);
    border-radius:24px;
    padding:34px 28px;
    backdrop-filter:blur(16px);
    box-shadow:0 18px 45px rgba(0,0,0,0.30);
    animation:fadeInUp 0.9s ease;
}

.form-header{
    text-align:center;
    margin-bottom:28px;
}

.form-badge{
    display:inline-block;
    padding:8px 16px;
    border-radius:30px;
    font-size:12px;
    font-weight:600;
    letter-spacing:0.6px;
    color:#fff7d6;
    background:rgba(245,158,11,0.14);
    border:1px solid rgba(245,158,11,0.28);
    margin-bottom:14px;
}

.form-header h2{
    font-size:30px;
    font-weight:700;
    margin-bottom:8px;
}

.form-header p{
    color:#cbd5e1;
    font-size:14px;
    line-height:1.7;
}

.form-group{
    margin-bottom:18px;
}

.form-group label{
    display:block;
    font-size:14px;
    font-weight:600;
    margin-bottom:9px;
    color:#eef2ff;
}

.input-box{
    position:relative;
}

.input-box i{
    position:absolute;
    left:14px;
    top:50%;
    transform:translateY(-50%);
    color:#a9b8d6;
    font-size:14px;
}

.form-group input{
    width:100%;
    padding:14px 14px 14px 42px;
    border-radius:14px;
    border:1px solid rgba(255,255,255,0.12);
    background:rgba(255,255,255,0.08);
    color:#fff;
    font-size:15px;
    outline:none;
    transition:all 0.3s ease;
}

.form-group input::placeholder{
    color:#b7c3db;
}

.form-group input:focus{
    border-color:rgba(245,158,11,0.65);
    background:rgba(255,255,255,0.12);
    box-shadow:0 0 0 4px rgba(245,158,11,0.12);
}

.btn{
    width:100%;
    border:none;
    padding:15px;
    border-radius:16px;
    background:linear-gradient(135deg,#f59e0b,#facc15);
    color:#111827;
    font-size:15px;
    font-weight:700;
    cursor:pointer;
    transition:all 0.3s ease;
    box-shadow:0 12px 28px rgba(245,158,11,0.30);
    margin-top:8px;
}

.btn:hover{
    transform:translateY(-2px);
    box-shadow:0 16px 35px rgba(245,158,11,0.38);
}

.header-links{
    margin-top:20px;
    text-align:center;
}

.header-links a{
    text-decoration:none;
    color:#dbeafe;
    font-size:14px;
    font-weight:500;
    transition:all 0.3s ease;
}

.header-links a:hover{
    color:#ffd166;
}

@keyframes fadeInUp{
    from{
        opacity:0;
        transform:translateY(25px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

@media (max-width: 992px){
    .wrapper{
        grid-template-columns:1fr;
    }
    .left-panel{
        padding:40px 28px 20px;
        border-right:none;
        border-bottom:1px solid rgba(255,255,255,0.08);
    }
    .left-panel h1{
        font-size:34px;
    }
    .right-panel{
        padding:28px 18px 35px;
    }
}

@media (max-width: 576px){
    body{
        padding:16px;
    }
    .left-panel{
        padding:30px 20px 16px;
    }
    .right-panel{
        padding:20px 14px 25px;
    }
    .card{
        padding:26px 18px;
    }
    .left-panel h1{
        font-size:28px;
    }
    .form-header h2{
        font-size:24px;
    }
}
</style>
</head>
<body>

<div class="shape shape1"></div>
<div class="shape shape2"></div>
<div class="shape shape3"></div>

<div class="wrapper">

    <div class="left-panel">
        <div class="brand">
            <div class="brand-icon">
                <i class="fa-solid fa-user-plus"></i>
            </div>
            <h2>Employee<span>MS</span></h2>
        </div>

        <h1>Create your <span>Admin Account</span> and start managing with confidence</h1>
        <p>
            Register securely to access the employee management system and organize workforce operations using a modern, professional, and business-ready platform.
        </p>

        <div class="highlight-list">
            <div class="highlight-item">
                <i class="fa-solid fa-user-shield"></i>
                <div>
                    <h4>Admin Access Setup</h4>
                    <p>Create your account to unlock secure administrative access and protected system functionality.</p>
                </div>
            </div>

            <div class="highlight-item">
                <i class="fa-solid fa-folder-open"></i>
                <div>
                    <h4>Centralized Management</h4>
                    <p>Maintain employee data, records, and operations from a structured and scalable interface.</p>
                </div>
            </div>

            <div class="highlight-item">
                <i class="fa-solid fa-crown"></i>
                <div>
                    <h4>Premium User Experience</h4>
                    <p>Enjoy a luxury-inspired visual interface with clean forms, responsive layout, and seamless navigation.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="right-panel">
        <div class="card">
            <div class="form-header">
                <span class="form-badge">ADMIN REGISTRATION</span>
                <h2>Create Account</h2>
                <p>Set up your credentials to access the employee management portal.</p>
            </div>

            <form action="./create" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-box">
                        <i class="fa-solid fa-user"></i>
                        <input type="text" id="username" name="username" placeholder="Enter username" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-box">
                        <i class="fa-solid fa-lock"></i>
                        <input type="password" id="password" name="password" placeholder="Enter password" required>
                    </div>
                </div>

                <button type="submit" class="btn">
                    <i class="fa-solid fa-user-plus"></i> Create Account
                </button>
            </form>

            <div class="header-links">
                <a href='./login'>Already have an account? LOGIN</a>
            </div>
        </div>
    </div>

</div>

</body>
</html>