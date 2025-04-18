<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile | Campus Canteen</title>
    <%@ include file="Navbar.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #ff8e8e;
            --accent-color: #6f42c1;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            color: var(--dark-color);
        }
        
        .profile-hero {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 4rem 0;
            text-align: center;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
            margin-bottom: 2rem;
        }
        
        .profile-hero h1 {
            font-weight: 700;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        
        .profile-container {
            max-width: 600px;
            margin: 0 auto 3rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            padding: 2.5rem;
            position: relative;
            top: -50px;
        }
        
        .profile-name {
            font-weight: 600;
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
            text-align: center;
        }
        
        .profile-email {
            color: var(--secondary-color);
            font-size: 1.1rem;
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .profile-stats {
            display: flex;
            justify-content: space-around;
            margin: 2rem 0;
            padding: 1rem 0;
            border-top: 1px solid #eee;
            border-bottom: 1px solid #eee;
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-number {
            font-weight: 700;
            font-size: 1.5rem;
            color: var(--primary-color);
        }
        
        .stat-label {
            color: var(--secondary-color);
            font-size: 0.9rem;
        }
        
        .btn-container {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
            margin-top: 2rem;
        }
        
        .profile-btn {
            padding: 10px 20px;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
            min-width: 180px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .profile-btn i {
            font-size: 1rem;
        }
        
        .dashboard-btn {
            background: var(--primary-color);
            color: white;
            border: none;
        }
        
        .dashboard-btn:hover {
            background: #e05a50;
            transform: translateY(-3px);
        }
        
        .password-btn {
            background: var(--accent-color);
            color: white;
            border: none;
        }
        
        .password-btn:hover {
            background: #5d3aa2;
            transform: translateY(-3px);
        }
        
        .logout-btn {
            background: #dc3545;
            color: white;
            border: none;
        }
        
        .logout-btn:hover {
            background: #c82333;
            transform: translateY(-3px);
        }
        
        @media (max-width: 768px) {
            .profile-hero {
                padding: 3rem 0;
                clip-path: polygon(0 0, 100% 0, 100% 95%, 0 100%);
            }
            
            .profile-container {
                padding: 1.5rem;
                top: -30px;
            }
            
            .btn-container {
                flex-direction: column;
                gap: 10px;
            }
            
            .profile-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="profile-hero">
        <div class="container">
            <h1><i class="fas fa-user-circle"></i> My Profile</h1>
        </div>
    </section>

    <!-- Profile Container -->
    <div class="container">
        <div class="profile-container">
            <!-- User Info -->
            <h2 class="profile-name"><%= session.getAttribute("username") != null ? session.getAttribute("username") : "Guest" %></h2>
            <p class="profile-email"><i class="fas fa-envelope"></i> <%= session.getAttribute("email") != null ? session.getAttribute("email") : "Not Available" %></p>
            
            <!-- Stats (can be dynamic if you have this data) -->
         
            
            <!-- Action Buttons -->
            <div class="btn-container">
                <a href="userdashboard.jsp" class="btn profile-btn dashboard-btn">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
                <a href="changepass.jsp" class="btn profile-btn password-btn">
                    <i class="fas fa-key"></i> Change Password
                </a>
                <a href="LogoutServlet" class="btn profile-btn logout-btn">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>