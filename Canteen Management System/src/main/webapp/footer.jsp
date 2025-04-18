<footer class="site-footer">
    <div class="footer-container">
        <div class="footer-brand">
            <i class="fas fa-utensils footer-logo"></i>
            <span class="footer-title">Canteen Management</span>
            <p class="footer-tagline">Delivering deliciousness since 2025</p>
        </div>
        
        <div class="footer-links">
            <div class="footer-column">
                <h3 class="footer-heading">Quick Links</h3>
                <ul class="footer-list">
                    <li><a href="userdashboard.jsp" class="footer-link">Dashboard</a></li>
                    <li><a href="menu.jsp" class="footer-link">Menu</a></li>
                    <li><a href="About.jsp" class="footer-link">About Us</a></li>
                    <li><a href="contact.jsp" class="footer-link">Contact</a></li>
                </ul>
            </div>
            
            <div class="footer-column">
                <h3 class="footer-heading">Contact Us</h3>
                <ul class="footer-list">
                    <li><i class="fas fa-map-marker-alt"></i> 123 Campus Drive, University</li>
                    <li><i class="fas fa-phone"></i> (123) 456-7890</li>
                    <li><i class="fas fa-envelope"></i> info@canteenmgmt.edu</li>
                </ul>
            </div>
            
            <div class="footer-column">
                <h3 class="footer-heading">Opening Hours</h3>
                <ul class="footer-list">
                    <li>Monday - Friday: 7am - 8pm</li>
                    <li>Saturday: 9am - 5pm</li>
                    <li>Sunday: 10am - 3pm</li>
                </ul>
            </div>
        </div>
        
        <div class="footer-social">
            <a href="#" class="social-icon" aria-label="Facebook">
                <i class="fab fa-facebook-f"></i>
            </a>
            <a href="#" class="social-icon" aria-label="Twitter">
                <i class="fab fa-twitter"></i>
            </a>
            <a href="#" class="social-icon" aria-label="Instagram">
                <i class="fab fa-instagram"></i>
            </a>
            <a href="#" class="social-icon" aria-label="LinkedIn">
                <i class="fab fa-linkedin-in"></i>
            </a>
        </div>
    </div>
    
    <div class="footer-bottom">
        <p>&copy; 2025 Canteen Management System. All rights reserved.</p>
        <div class="footer-legal">
            <a href="#" class="legal-link">Privacy Policy</a>
            <span> | </span>
            <a href="#" class="legal-link">Terms of Service</a>
            <span> | </span>
            <a href="#" class="legal-link">Cookie Policy</a>
        </div>
    </div>
</footer>

<style>
    /* Modern Footer Styles */
    .site-footer {
        background: linear-gradient(135deg, #ff6b6b 0%, #ff8e53 100%);
        color: white;
        padding: 40px 0 0;
        margin-top: 50px;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: grid;
        grid-template-columns: 1fr;
        gap: 30px;
    }
    
    .footer-brand {
        text-align: center;
    }
    
    .footer-logo {
        font-size: 2.5rem;
        margin-bottom: 10px;
        color: white;
        transition: transform 0.3s ease;
    }
    
    .footer-logo:hover {
        transform: rotate(15deg) scale(1.1);
    }
    
    .footer-title {
        display: block;
        font-size: 1.8rem;
        font-weight: 700;
        margin-bottom: 5px;
    }
    
    .footer-tagline {
        font-size: 1rem;
        opacity: 0.9;
        margin-bottom: 20px;
    }
    
    .footer-links {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 30px;
    }
    
    .footer-column {
        margin-bottom: 20px;
    }
    
    .footer-heading {
        font-size: 1.3rem;
        margin-bottom: 20px;
        position: relative;
        padding-bottom: 10px;
    }
    
    .footer-heading:after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        width: 50px;
        height: 2px;
        background: white;
    }
    
    .footer-list {
        list-style: none;
        padding: 0;
    }
    
    .footer-list li {
        margin-bottom: 12px;
        display: flex;
        align-items: center;
    }
    
    .footer-list i {
        margin-right: 10px;
        width: 20px;
        text-align: center;
    }
    
    .footer-link {
        color: rgba(255, 255, 255, 0.9);
        text-decoration: none;
        transition: all 0.3s ease;
        position: relative;
    }
    
    .footer-link:after {
        content: '';
        position: absolute;
        width: 0;
        height: 1px;
        bottom: -2px;
        left: 0;
        background-color: white;
        transition: width 0.3s ease;
    }
    
    .footer-link:hover {
        color: white;
        padding-left: 5px;
    }
    
    .footer-link:hover:after {
        width: 100%;
    }
    
    .footer-social {
        display: flex;
        justify-content: center;
        gap: 20px;
        margin: 30px 0;
    }
    
    .social-icon {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 50%;
        color: white;
        font-size: 1.2rem;
        transition: all 0.3s ease;
    }
    
    .social-icon:hover {
        background: white;
        color: #ff6b6b;
        transform: translateY(-5px);
    }
    
    .footer-bottom {
        background: rgba(0, 0, 0, 0.1);
        padding: 20px 0;
        text-align: center;
    }
    
    .footer-bottom p {
        margin-bottom: 10px;
        font-size: 0.9rem;
    }
    
    .footer-legal {
        display: flex;
        justify-content: center;
        flex-wrap: wrap;
        gap: 10px;
    }
    
    .legal-link {
        color: rgba(255, 255, 255, 0.8);
        text-decoration: none;
        font-size: 0.85rem;
        transition: color 0.3s ease;
    }
    
    .legal-link:hover {
        color: white;
    }
    
    /* Responsive Design */
    @media (min-width: 768px) {
        .footer-container {
            grid-template-columns: 1fr 2fr;
        }
        
        .footer-brand {
            text-align: left;
        }
    }
</style>