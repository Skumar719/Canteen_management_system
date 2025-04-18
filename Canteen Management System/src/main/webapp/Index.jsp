<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickBite - Food Delivery System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.cdnfonts.com/css/black-chancery" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #ffcc5c;
            --accent-color: #88d8b0;
            --dark-color: #292f36;
            --light-color: #f7fff7;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Black Chancery', cursive;
        }

        body {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), 
                        url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80') 
                        no-repeat center center/cover;
            color: var(--light-color);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Navbar */
        .navbar {
            background: rgba(255, 107, 107, 0.95);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .navbar.scrolled {
            padding: 0.8rem 2rem;
            background: rgba(255, 107, 107, 0.98);
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin: 0 1rem;
            font-size: 1.1rem;
            transition: all 0.3s ease;
            padding: 0.5rem 1rem;
            border-radius: 30px;
            position: relative;
        }

        .navbar a:hover {
            color: white;
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
        }

        .navbar .brand {
            color: white;
            font-size: 1.8rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }

        .navbar .brand i {
            margin-right: 0.8rem;
            font-size: 2rem;
            animation: pulse 2s infinite;
        }

        .cta-button {
            background: white;
            color: var(--primary-color);
            font-weight: bold;
            padding: 0.6rem 1.5rem;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        /* Hero Section */
        .hero {
            margin-top: 7rem;
            padding: 2rem;
            text-align: center;
        }

        .hero h1 {
            font-size: 4rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            line-height: 1.2;
            animation: fadeInDown 1s ease;
        }

        .hero p {
            font-size: 1.5rem;
            color: var(--secondary-color);
            margin-bottom: 2rem;
            animation: fadeIn 1.5s ease;
        }

        /* Search Bar */
        .search-container {
            max-width: 700px;
            margin: 0 auto;
            position: relative;
            animation: fadeInUp 1s ease;
        }

        .search-bar {
            display: flex;
            justify-content: center;
            margin-top: 1.5rem;
        }

        .search-bar input {
            padding: 1.2rem 2rem;
            width: 100%;
            font-size: 1.1rem;
            border: none;
            border-radius: 50px;
            outline: none;
            background: rgba(255, 255, 255, 0.15);
            color: white;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .search-bar input::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .search-bar input:focus {
            background: rgba(255, 255, 255, 0.25);
            transform: scale(1.02);
        }

        .search-bar button {
            padding: 1.2rem 2.5rem;
            background: linear-gradient(45deg, var(--primary-color), var(--accent-color));
            color: white;
            font-size: 1.1rem;
            border: none;
            border-radius: 50px;
            margin-left: -50px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.4);
            z-index: 1;
        }

        .search-bar button:hover {
            background: linear-gradient(45deg, var(--accent-color), var(--primary-color));
            transform: translateX(5px);
        }

        /* Features */
        .features {
            padding: 4rem 2rem;
            margin-top: 2rem;
        }

        .section-title {
            font-size: 2.5rem;
            margin-bottom: 3rem;
            color: var(--secondary-color);
            text-align: center;
            position: relative;
        }

        .section-title:after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: var(--primary-color);
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 2rem;
            border-radius: 15px;
            text-align: center;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.4s ease;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .feature-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        .feature-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
            background: linear-gradient(45deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .feature-card h3 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: var(--secondary-color);
        }

        /* Popular Dishes */
        .popular-dishes {
            padding: 4rem 2rem;
            background: rgba(0, 0, 0, 0.3);
        }

        .dish-slider {
            display: flex;
            overflow-x: auto;
            gap: 2rem;
            padding: 1rem;
            scroll-snap-type: x mandatory;
            -webkit-overflow-scrolling: touch;
            max-width: 1200px;
            margin: 0 auto;
        }

        .dish-card {
            min-width: 280px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            overflow: hidden;
            scroll-snap-align: start;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .dish-card:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
        }

        .dish-img {
            height: 200px;
            width: 100%;
            object-fit: cover;
        }

        .dish-info {
            padding: 1.5rem;
        }

        .dish-info h3 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            color: var(--secondary-color);
        }

        .dish-info p {
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 1rem;
        }

        .dish-price {
            font-size: 1.3rem;
            color: var(--primary-color);
            font-weight: bold;
        }

        .order-btn {
            display: inline-block;
            margin-top: 1rem;
            padding: 0.6rem 1.5rem;
            background: var(--primary-color);
            color: white;
            border-radius: 30px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .order-btn:hover {
            background: var(--accent-color);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        /* How It Works */
        .how-it-works {
            padding: 4rem 2rem;
            text-align: center;
        }

        .steps {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 2rem;
            max-width: 1000px;
            margin: 0 auto;
        }

        .step {
            flex: 1;
            min-width: 200px;
            position: relative;
        }

        .step-number {
            width: 60px;
            height: 60px;
            background: var(--primary-color);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: bold;
            margin: 0 auto 1rem;
            position: relative;
            z-index: 1;
        }

        .step-content {
            background: rgba(255, 255, 255, 0.1);
            padding: 1.5rem;
            border-radius: 15px;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            height: 100%;
        }

        .step-content h3 {
            color: var(--secondary-color);
            margin-bottom: 1rem;
        }

        /* App Download */
        .app-section {
            padding: 4rem 2rem;
            background: rgba(0, 0, 0, 0.3);
        }

        .app-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 4rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .app-content {
            flex: 1;
            min-width: 300px;
        }

        .app-content h2 {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--secondary-color);
        }

        .app-content p {
            font-size: 1.1rem;
            color: rgba(255, 255, 255, 0.9);
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .app-buttons {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .app-btn {
            display: flex;
            align-items: center;
            gap: 0.8rem;
            padding: 0.8rem 1.5rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .app-btn:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
        }

        .app-btn i {
            font-size: 1.8rem;
        }

        .btn-text small {
            display: block;
            font-size: 0.7rem;
            opacity: 0.8;
        }

        .btn-text span {
            font-size: 1.1rem;
            font-weight: bold;
        }

        .app-image {
            flex: 1;
            min-width: 300px;
            max-width: 400px;
            animation: float 3s ease-in-out infinite;
        }

        .app-image img {
            width: 100%;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
        }

        /* Footer */
        footer {
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 4rem 2rem 2rem;
            backdrop-filter: blur(5px);
        }

        .footer-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-column h3 {
            font-size: 1.5rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
        }

        .footer-column h3:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 2px;
            background: var(--secondary-color);
        }

        .footer-column p, 
        .footer-column a {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 1rem;
            display: block;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .footer-column a:hover {
            color: var(--secondary-color);
            padding-left: 5px;
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .social-links a {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            background: var(--primary-color);
            transform: translateY(-5px);
        }

        .copyright {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 0.9rem;
            color: rgba(255, 255, 255, 0.5);
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes fadeInDown {
            from { 
                opacity: 0; 
                transform: translateY(-20px);
            }
            to { 
                opacity: 1; 
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from { 
                opacity: 0; 
                transform: translateY(20px);
            }
            to { 
                opacity: 1; 
                transform: translateY(0);
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .navbar {
                padding: 0.8rem 1rem;
                flex-direction: column;
            }
            
            .navbar .brand {
                margin-bottom: 0.5rem;
            }
            
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .hero p {
                font-size: 1.2rem;
            }
            
            .search-bar {
                flex-direction: column;
                gap: 1rem;
            }
            
            .search-bar button {
                margin-left: 0;
                width: 100%;
            }
            
            .app-container {
                text-align: center;
            }
            
            .app-buttons {
                justify-content: center;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar" id="navbar">
        <div class="brand">
            <i class="fas fa-utensils"></i> QuickBite
        </div>
        <div>
            <a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
            <a href="register.jsp" class="cta-button"><i class="fas fa-user-plus"></i> Sign Up</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <h1 class="animate__animated animate__fadeInDown">Delicious Food Delivered Fast</h1>
        <p class="animate__animated animate__fadeIn">From campus favorites to gourmet meals - we've got you covered</p>
        
        <div class="search-container animate__animated animate__fadeInUp">
            <div class="search-bar">
                <input type="text" placeholder="What are you craving today?">
                <button><i class="fas fa-search"></i> Find Food</button>
            </div>
        </div>
    </section>

    <!-- Features -->
    <section class="features">
        <h2 class="section-title animate__animated animate__fadeIn"><i class="fas fa-star"></i> Why Choose QuickBite?</h2>
        <div class="feature-grid">
            <div class="feature-card animate__animated animate__fadeInUp">
                <div class="feature-icon">
                    <i class="fas fa-bolt"></i>
                </div>
                <h3>Lightning Fast</h3>
                <p>Average delivery time under 30 minutes with our optimized network of campus delivery partners.</p>
            </div>
            <div class="feature-card animate__animated animate__fadeInUp animate__delay-1s">
                <div class="feature-icon">
                    <i class="fas fa-heart"></i>
                </div>
                <h3>Healthy Options</h3>
                <p>Special nutritionist-approved meals for health-conscious students and faculty.</p>
            </div>
            <div class="feature-card animate__animated animate__fadeInUp animate__delay-2s">
                <div class="feature-icon">
                    <i class="fas fa-tag"></i>
                </div>
                <h3>Student Discounts</h3>
                <p>Exclusive deals and loyalty rewards for our campus community members.</p>
            </div>
        </div>
    </section>

    <!-- Popular Dishes -->
    <section class="popular-dishes">
        <h2 class="section-title animate__animated animate__fadeIn"><i class="fas fa-fire"></i> Today's Specials</h2>
        <div class="dish-slider">
            <div class="dish-card">
                <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=781&q=80" alt="Burger" class="dish-img">
                <div class="dish-info">
                    <h3>Gourmet Burger</h3>
                    <p>Juicy beef patty with cheddar and special sauce</p>
                    <div class="dish-price">$9.99</div>
                    <a href="#" class="order-btn">Order Now</a>
                </div>
            </div>
            <div class="dish-card">
                <img src="https://images.unsplash.com/photo-1565557623262-b51c2513a641?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1371&q=80" alt="Pizza" class="dish-img">
                <div class="dish-info">
                    <h3>Margherita Pizza</h3>
                    <p>Classic pizza with fresh mozzarella and basil</p>
                    <div class="dish-price">$12.99</div>
                    <a href="#" class="order-btn">Order Now</a>
                </div>
            </div>
            <div class="dish-card">
                <img src="https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80" alt="Salad" class="dish-img">
                <div class="dish-info">
                    <h3>Superfood Salad</h3>
                    <p>Kale, quinoa, avocado and nutrient-packed ingredients</p>
                    <div class="dish-price">$8.99</div>
                    <a href="#" class="order-btn">Order Now</a>
                </div>
            </div>
            <div class="dish-card">
                <img src="https://images.unsplash.com/photo-1569718212165-3a8278d5f624?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80" alt="Sushi" class="dish-img">
                <div class="dish-info">
                    <h3>Sushi Combo</h3>
                    <p>Fresh salmon, tuna and California rolls with wasabi</p>
                    <div class="dish-price">$14.99</div>
                    <a href="#" class="order-btn">Order Now</a>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works -->
    <section class="how-it-works">
        <h2 class="section-title animate__animated animate__fadeIn"><i class="fas fa-cogs"></i> How It Works</h2>
        <div class="steps">
            <div class="step animate__animated animate__fadeIn">
                <div class="step-number">1</div>
                <div class="step-content">
                    <h3>Choose Your Meal</h3>
                    <p>Browse hundreds of options from campus restaurants and food stalls</p>
                </div>
            </div>
            <div class="step animate__animated animate__fadeIn animate__delay-1s">
                <div class="step-number">2</div>
                <div class="step-content">
                    <h3>Customize & Order</h3>
                    <p>Add special instructions and pay securely online</p>
                </div>
            </div>
            <div class="step animate__animated animate__fadeIn animate__delay-2s">
                <div class="step-number">3</div>
                <div class="step-content">
                    <h3>Fast Delivery</h3>
                    <p>Track your order in real-time until it arrives at your location</p>
                </div>
            </div>
        </div>
    </section>

    <!-- App Download -->
    <section class="app-section">
        <div class="app-container">
            <div class="app-content animate__animated animate__fadeInLeft">
                <h2>Get the QuickBite App</h2>
                <p>Download our mobile app for exclusive deals, faster ordering, and personalized recommendations based on your taste preferences. Available on iOS and Android.</p>
                <div class="app-buttons">
                    <a href="#" class="app-btn">
                        <i class="fab fa-apple"></i>
                        <div class="btn-text">
                            <small>Download on the</small>
                            <span>App Store</span>
                        </div>
                    </a>
                    <a href="#" class="app-btn">
                        <i class="fab fa-google-play"></i>
                        <div class="btn-text">
                            <small>Get it on</small>
                            <span>Google Play</span>
                        </div>
                    </a>
                </div>
            </div>
            <div class="app-image animate__animated animate__fadeInRight">
                <img src="https://cdn.dribbble.com/users/1787323/screenshots/11327642/media/0b1c2d6f9b9500f3a6a4b6895d7f5a9d.png" alt="QuickBite App">
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="footer-container">
            <div class="footer-column">
                <h3>QuickBite</h3>
                <p>Delivering happiness one meal at a time. Our mission is to connect students with great local food options quickly and affordably.</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-tiktok"></i></a>
                </div>
            </div>
            <div class="footer-column">
                <h3>Quick Links</h3>
                <a href="#">Home</a>
                <a href="#">About Us</a>
                <a href="#">Restaurants</a>
                <a href="#">How It Works</a>
                <a href="#">Careers</a>
            </div>
            <div class="footer-column">
                <h3>Help</h3>
                <a href="#">Contact Us</a>
                <a href="#">FAQs</a>
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
                <a href="#">Refund Policy</a>
            </div>
            <div class="footer-column">
                <h3>Contact</h3>
                <p><i class="fas fa-map-marker-alt"></i> 123 Campus Drive, University Town</p>
                <p><i class="fas fa-phone"></i> (123) 456-7890</p>
                <p><i class="fas fa-envelope"></i> support@quickbite.edu</p>
                <p><i class="fas fa-clock"></i> 24/7 Student Support</p>
            </div>
        </div>
        <div class="copyright">
            &copy; 2023 QuickBite Campus Delivery. All rights reserved.
        </div>
    </footer>

    <script>
        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const navbar = document.getElementById('navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Animate elements when they come into view
        const animateOnScroll = function() {
            const elements = document.querySelectorAll('.feature-card, .dish-card, .step');
            
            elements.forEach(element => {
                const elementPosition = element.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.3;
                
                if (elementPosition < screenPosition) {
                    element.style.opacity = '1';
                    element.style.transform = 'translateY(0)';
                }
            });
        };

        // Set initial state for animation
        document.querySelectorAll('.feature-card, .dish-card, .step').forEach(el => {
            el.style.opacity = '0';
            el.style.transform = 'translateY(20px)';
            el.style.transition = 'all 0.6s ease';
        });

        window.addEventListener('scroll', animateOnScroll);
        window.addEventListener('load', animateOnScroll);
    </script>
</body>
</html>