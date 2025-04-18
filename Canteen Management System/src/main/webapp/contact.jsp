<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String status = request.getParameter("status");
    String alertClass = "";
    String alertMessage = "";
    
    if (status != null) {
        if (status.equals("success")) {
            alertClass = "alert-success";
            alertMessage = "Your message has been sent successfully! We'll get back to you soon.";
        } else if (status.equals("error")) {
            alertClass = "alert-danger";
            alertMessage = "There was an error sending your message. Please try again later.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us | Campus Canteen</title>
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
        
        .contact-hero {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 5rem 0;
            text-align: center;
            margin-bottom: 2rem;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
        }
        
        .contact-hero h1 {
            font-weight: 700;
            font-size: 3rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        
        .contact-container {
            padding: 2rem 0;
        }
        
        .contact-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
            border: none;
            height: 100%;
            padding: 2rem;
        }
        
        .contact-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }
        
        .section-title {
            position: relative;
            padding-bottom: 15px;
            margin-bottom: 1.5rem;
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
        
        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #ddd;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(255, 107, 107, 0.25);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 12px 24px;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn-primary:hover {
            background-color: #e05a50;
            transform: translateY(-2px);
        }
        
        .contact-info-item {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        .icon-box {
            width: 50px;
            height: 50px;
            background-color: var(--primary-color);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-size: 1.2rem;
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
        
        .alert {
            border-radius: 8px;
        }
        
        @media (max-width: 768px) {
            .contact-hero {
                padding: 3rem 0;
                clip-path: polygon(0 0, 100% 0, 100% 95%, 0 100%);
            }
            
            .contact-hero h1 {
                font-size: 2.2rem;
            }
            
            .contact-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="contact-hero">
        <div class="container">
            <h1><i class="fas fa-envelope"></i> Contact Us</h1>
            <p class="lead">We're here to help and answer any questions you may have</p>
        </div>
    </section>

    <!-- Alert Message -->
    <% if (!alertMessage.isEmpty()) { %>
        <div class="container mb-4">
            <div class="alert <%= alertClass %> alert-dismissible fade show d-flex align-items-center">
                <i class="fas <%= alertClass.equals("alert-success") ? "fa-check-circle" : "fa-exclamation-triangle" %> me-2"></i>
                <div><%= alertMessage %></div>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </div>
    <% } %>

    <!-- Contact Section -->
    <div class="container contact-container">
        <div class="row g-4">
            <!-- Contact Form Column -->
            <div class="col-lg-7">
                <div class="contact-card">
                    <h2 class="section-title"><i class="fas fa-paper-plane"></i> Send us a message</h2>
                    <form action="MessageManagementServlet" method="post">
                        <div class="mb-4">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                        </div>
                        <div class="mb-4">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                        </div>
                        <div class="mb-4">
                            <label for="subject" class="form-label">Subject</label>
                            <input type="text" class="form-control" id="subject" name="subject" placeholder="What is this regarding?" required>
                        </div>
                        <div class="mb-4">
                            <label for="message" class="form-label">Your Message</label>
                            <textarea class="form-control" id="message" name="message" rows="6" placeholder="Type your message here..." required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-paper-plane me-2"></i> Send Message
                        </button>
                    </form>
                </div>
            </div>
            
            <!-- Contact Info Column -->
            <div class="col-lg-5">
                <div class="contact-card">
                    <h2 class="section-title"><i class="fas fa-info-circle"></i> Contact Information</h2>
                    
                    <div class="contact-info-item">
                        <div class="icon-box">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <div>
                            <h5>Our Location</h5>
                            <p>123 University Avenue, Campus Town, CT 12345</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="icon-box">
                            <i class="fas fa-phone"></i>
                        </div>
                        <div>
                            <h5>Phone Number</h5>
                            <p>+1 (555) 123-4567</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="icon-box">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <div>
                            <h5>Email Address</h5>
                            <p>contact@campuscanteen.edu</p>
                        </div>
                    </div>
                    
                    <div class="contact-info-item">
                        <div class="icon-box">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div>
                            <h5>Opening Hours</h5>
                            <p>Monday-Friday: 8:00 AM - 8:00 PM</p>
                            <p>Saturday-Sunday: 9:00 AM - 5:00 PM</p>
                        </div>
                    </div>
                    
                    <hr class="my-4">
                    
                    <h5 class="mb-3">Follow Us On Social Media</h5>
                    <div class="d-flex">
                        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>