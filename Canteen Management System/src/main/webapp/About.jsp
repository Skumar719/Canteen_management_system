<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Canteen Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #ff8e8e;
            --light-color: #fff5f5;
            --dark-color: #333;
            --accent-color: #ffd166;
        }
        
        body {
            background-color: var(--light-color);
            font-family: 'Poppins', sans-serif;
            color: var(--dark-color);
            line-height: 1.7;
        }
        
        .hero-section {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 5rem 0;
            text-align: center;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
            margin-bottom: 3rem;
        }
        
        .hero-section h1 {
            font-weight: 700;
            font-size: 3.5rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        
        .hero-section p {
            font-size: 1.2rem;
            max-width: 700px;
            margin: 0 auto;
            opacity: 0.9;
        }
        
        .content-card {
            background: white;
            padding: 3rem;
            margin: 2rem auto;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s ease;
            border: none;
        }
        
        .content-card:hover {
            transform: translateY(-5px);
        }
        
        .section-title {
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 2rem;
            color: var(--primary-color);
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 60px;
            height: 4px;
            background: var(--accent-color);
            border-radius: 2px;
        }
        
        .value-card {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s ease;
        }
        
        .value-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .value-card i {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .team-member {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .team-member img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        
        .team-member:hover img {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        
        .team-member h5 {
            font-weight: 600;
            margin-top: 1rem;
        }
        
        .team-member p {
            color: var(--secondary-color);
            font-weight: 500;
        }
        
        .testimonial-card {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            border-top: 4px solid var(--accent-color);
            position: relative;
        }
        
        .testimonial-card i.fa-quote-left {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 2rem;
            color: rgba(0,0,0,0.05);
        }
        
        .testimonial-card p {
            font-style: italic;
            position: relative;
            z-index: 1;
        }
        
        .testimonial-card strong {
            color: var(--primary-color);
        }
        
        .specialty-badge {
            display: inline-block;
            background: var(--light-color);
            color: var(--primary-color);
            padding: 8px 15px;
            border-radius: 50px;
            margin: 0.5rem;
            font-weight: 500;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        
        .specialty-badge:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-3px);
        }
        
        .social-icon {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--light-color);
            color: var(--primary-color);
            margin-right: 10px;
            transition: all 0.3s ease;
        }
        
        .social-icon:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-3px);
        }
        
        @media (max-width: 768px) {
            .hero-section {
                padding: 3rem 0;
                clip-path: polygon(0 0, 100% 0, 100% 95%, 0 100%);
            }
            
            .hero-section h1 {
                font-size: 2.5rem;
            }
            
            .content-card {
                padding: 2rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="Navbar.jsp" %>
    
    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <h1><i class="fas fa-utensils"></i> About Our Canteen</h1>
            <p class="lead">Where culinary excellence meets warm hospitality</p>
        </div>
    </section>

    <div class="container">
        <!-- Welcome Section -->
        <div class="content-card">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h2 class="section-title"><i class="fas fa-smile-beam"></i> Welcome to Our Canteen</h2>
                    <p>Our canteen is more than just a place to eat – it's a vibrant hub where students, staff, and visitors come together to enjoy delicious, fresh, and nutritious meals in a welcoming atmosphere.</p>
                    <p>We take pride in maintaining the highest standards of hygiene, taste, and customer satisfaction, ensuring every visit is a delightful experience.</p>
                </div>
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80" 
                         alt="Canteen Interior" class="img-fluid rounded-3 shadow">
                </div>
            </div>
        </div>

        <!-- Core Values -->
        <div class="content-card">
            <h2 class="section-title text-center"><i class="fas fa-star"></i> Our Core Values</h2>
            <div class="row">
                <div class="col-md-6 col-lg-3">
                    <div class="value-card text-center">
                        <i class="fas fa-seedling"></i>
                        <h4>Quality First</h4>
                        <p>We use only the freshest, locally sourced ingredients in all our meals.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="value-card text-center">
                        <i class="fas fa-wallet"></i>
                        <h4>Affordability</h4>
                        <p>Delicious meals at prices that won't break your budget.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="value-card text-center">
                        <i class="fas fa-heart"></i>
                        <h4>Customer Care</h4>
                        <p>Your satisfaction is our top priority every single day.</p>
                    </div>
                </div>
                <div class="col-md-6 col-lg-3">
                    <div class="value-card text-center">
                        <i class="fas fa-recycle"></i>
                        <h4>Sustainability</h4>
                        <p>Eco-friendly practices that protect our planet.</p>
                    </div>
                </div>
            </div>
        </div>

   

        <!-- Team Section -->
        <div class="content-card">
            <h2 class="section-title text-center"><i class="fas fa-users"></i> Meet Our Team</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="image/rishi.jpeg" alt="Rishikesh Kumar">
                        <h5>Rishikesh Kumar</h5>
                        <p>Head Chef</p>
                        <p class="text-muted">With 10+ years of culinary experience</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="image/rishi.jpeg" alt="Sarah Lee">
                        <h5>Sarah Lee</h5>
                        <p>Canteen Manager</p>
                        <p class="text-muted">Ensuring everything runs smoothly</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="team-member">
                        <img src="image/rishi.jpeg" alt="David Smith">
                        <h5>David Smith</h5>
                        <p>Customer Service</p>
                        <p class="text-muted">Always here with a smile</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Specialties -->
     

        <!-- Testimonials -->
        <div class="content-card">
            <h2 class="section-title text-center"><i class="fas fa-comment-alt"></i> What Our Customers Say</h2>
            <div class="row">
                <div class="col-md-6">
                    <div class="testimonial-card">
                        <i class="fas fa-quote-left"></i>
                        <p>The food is absolutely amazing, and the prices are unbeatable! The variety changes daily but the quality never drops. Best place to grab a meal on campus.</p>
                        <strong>— Alex R., Student</strong>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="testimonial-card">
                        <i class="fas fa-quote-left"></i>
                        <p>I love the variety of options and the friendly staff. The canteen has become my go-to spot for lunch breaks. A great place to eat and relax between classes!</p>
                        <strong>— Emma W., Faculty</strong>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sustainability -->
        <div class="content-card">
            <h2 class="section-title"><i class="fas fa-leaf"></i> Our Sustainability Efforts</h2>
            <p>We're committed to protecting our planet through responsible practices:</p>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="d-flex align-items-start mb-4">
                        <i class="fas fa-recycle fa-2x me-3" style="color: var(--primary-color);"></i>
                        <div>
                            <h5>Eco-Friendly Packaging</h5>
                            <p>We use 100% biodegradable containers and utensils to minimize plastic waste.</p>
                        </div>
                    </div>
                    
                    <div class="d-flex align-items-start mb-4">
                        <i class="fas fa-tractor fa-2x me-3" style="color: var(--primary-color);"></i>
                        <div>
                            <h5>Local Sourcing</h5>
                            <p>Over 80% of our ingredients come from local farms within 50 miles.</p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="d-flex align-items-start mb-4">
                        <i class="fas fa-glass-martini-alt fa-2x me-3" style="color: var(--primary-color);"></i>
                        <div>
                            <h5>Reusable Incentives</h5>
                            <p>Get discounts when you bring your own cups and containers.</p>
                        </div>
                    </div>
                    
                    <div class="d-flex align-items-start mb-4">
                        <i class="fas fa-trash-alt fa-2x me-3" style="color: var(--primary-color);"></i>
                        <div>
                            <h5>Waste Reduction</h5>
                            <p>We compost food waste and donate excess food to local shelters.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Contact -->
     
            
         
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>