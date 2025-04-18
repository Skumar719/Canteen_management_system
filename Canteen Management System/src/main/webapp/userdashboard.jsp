<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard | Campus Canteen</title>
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
        
        .dashboard-hero {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 4rem 0;
            text-align: center;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
            margin-bottom: 2rem;
        }
        
        .dashboard-hero h1 {
            font-weight: 700;
            font-size: 2.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        
        .dashboard-hero p {
            font-size: 1.2rem;
            max-width: 600px;
            margin: 0 auto;
            opacity: 0.9;
        }
        
        .dashboard-container {
            max-width: 1200px;
            margin: 0 auto 3rem;
            padding: 0 20px;
        }
        
        .carousel-container {
            margin-bottom: 3rem;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }
        
        .carousel-item img {
            height: 400px;
            object-fit: cover;
        }
        
        .carousel-caption {
            background: rgba(0, 0, 0, 0.6);
            padding: 1rem;
            border-radius: 8px;
            bottom: 30px;
        }
        
        .carousel-caption h5 {
            font-weight: 600;
            font-size: 1.5rem;
        }
        
        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 25px;
            margin-top: 2rem;
        }
        
        .dashboard-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            border: none;
        }
        
        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.12);
        }
        
        .card-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--light-color);
            border-radius: 50%;
            color: var(--primary-color);
            font-size: 2rem;
        }
        
        .card-title {
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }
        
        .card-link {
            display: inline-block;
            margin-top: 1.5rem;
            padding: 10px 20px;
            background: var(--primary-color);
            color: white;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .card-link:hover {
            background: #e05a50;
            transform: translateY(-3px);
            color: white;
        }
        
        .card-link i {
            margin-left: 8px;
        }
        
        @media (max-width: 768px) {
            .dashboard-hero {
                padding: 3rem 0;
                clip-path: polygon(0 0, 100% 0, 100% 95%, 0 100%);
            }
            
            .dashboard-hero h1 {
                font-size: 2rem;
            }
            
            .carousel-item img {
                height: 300px;
            }
            
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="dashboard-hero">
        <div class="container">
            <h1><i class="fas fa-tachometer-alt"></i> User Dashboard</h1>
            <p>Welcome back, <%= session.getAttribute("username") != null ? session.getAttribute("username") : "User" %>! Manage your canteen experience</p>
        </div>
    </section>

    <!-- Main Content -->
    <div class="dashboard-container">
        <!-- Food Carousel -->
        <div class="carousel-container">
            <div id="foodCarousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="image/fff.jpg" class="d-block w-100" alt="Burger">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Delicious Burgers</h5>
                            <p>Try our special grilled burgers with secret sauce!</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="image/lll.jpg" class="d-block w-100" alt="Pizza">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Hot & Fresh Pizza</h5>
                            <p>Get a cheesy delight straight to your table</p>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="image/kkk.jpg" class="d-block w-100" alt="Beverages">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>Refreshing Beverages</h5>
                            <p>Cool down with our special drinks</p>
                        </div>
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#foodCarousel" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#foodCarousel" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>

        <!-- Dashboard Cards -->
        <div class="dashboard-grid">
            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-utensils"></i>
                </div>
                <h3 class="card-title">Explore Menu</h3>
                <p>Browse our delicious food options and place your order</p>
                <a href="menu.jsp" class="card-link">
                    View Menu <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-clipboard-list"></i>
                </div>
                <h3 class="card-title">My Orders</h3>
                <p>Track your current and past orders</p>
                <a href="order.jsp" class="card-link">
                    View Orders <i class="fas fa-arrow-right"></i>
                </a>
            </div>

            <div class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-user-circle"></i>
                </div>
                <h3 class="card-title">My Profile</h3>
                <p>Update your personal information and preferences</p>
                <a href="userprofile.jsp" class="card-link">
                    Edit Profile <i class="fas fa-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>