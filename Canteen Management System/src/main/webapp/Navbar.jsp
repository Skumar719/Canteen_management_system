<nav class="navbar">
    <div class="nav-container">
        <div class="nav-brand">
            <i class="fas fa-utensils"></i>
            <span>QuickBite</span>
        </div>
        <div class="nav-links">
            <a href="userdashboard.jsp" class="nav-link">
                <i class="fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
            <a href="menu.jsp" class="nav-link">
                <i class="fas fa-burger"></i>
                <span>Menu</span>
            </a>
            <a href="About.jsp" class="nav-link">
                <i class="fas fa-info-circle"></i>
                <span>About</span>
            </a>
            <a href="contact.jsp" class="nav-link">
                <i class="fas fa-envelope"></i>
                <span>Contact</span>
            </a>
            <a href="userprofile.jsp" class="nav-link profile">
                <i class="fas fa-user-circle"></i>
                <span>Profile</span>
            </a>
        </div>
        <div class="mobile-menu-btn">
            <i class="fas fa-bars"></i>
        </div>
    </div>
</nav>

<style>
    /* Modern Navigation Bar Styles */
    .navbar {
        background: linear-gradient(135deg, #ff6f61 0%, #ff8e53 100%);
        padding: 0;
        position: sticky;
        top: 0;
        z-index: 1000;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
        transition: all 0.3s ease;
    }
    
    .nav-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        height: 70px;
    }
    
    .nav-brand {
        display: flex;
        align-items: center;
        color: white;
        font-size: 1.5rem;
        font-weight: 700;
        cursor: pointer;
    }
    
    .nav-brand i {
        margin-right: 10px;
        font-size: 1.8rem;
        color: #fff;
        transition: transform 0.3s ease;
    }
    
    .nav-brand:hover i {
        transform: rotate(15deg);
    }
    
    .nav-links {
        display: flex;
        align-items: center;
    }
    
    .nav-link {
        color: rgba(255, 255, 255, 0.9);
        text-decoration: none;
        margin: 0 10px;
        padding: 10px 15px;
        border-radius: 8px;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
        font-weight: 500;
    }
    
    .nav-link i {
        margin-right: 8px;
        font-size: 1.1rem;
    }
    
    .nav-link:before {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 0;
        height: 3px;
        background: white;
        transition: width 0.3s ease;
    }
    
    .nav-link:hover {
        color: white;
        background: rgba(255, 255, 255, 0.15);
        transform: translateY(-2px);
    }
    
    .nav-link:hover:before {
        width: 100%;
    }
    
    .nav-link.profile {
        background: rgba(255, 255, 255, 0.2);
        padding: 10px 15px;
        border-radius: 30px;
    }
    
    .nav-link.profile:hover {
        background: rgba(255, 255, 255, 0.3);
    }
    
    .mobile-menu-btn {
        display: none;
        color: white;
        font-size: 1.5rem;
        cursor: pointer;
    }
    
    /* Responsive Design */
    @media (max-width: 768px) {
        .nav-container {
            padding: 0 15px;
        }
        
        .nav-links {
            position: fixed;
            top: 70px;
            left: -100%;
            width: 100%;
            height: calc(100vh - 70px);
            background: linear-gradient(135deg, #ff6f61 0%, #ff8e53 100%);
            flex-direction: column;
            align-items: center;
            justify-content: center;
            transition: all 0.5s ease;
            z-index: 999;
        }
        
        .nav-links.active {
            left: 0;
        }
        
        .nav-link {
            margin: 15px 0;
            padding: 15px 25px;
            font-size: 1.2rem;
        }
        
        .mobile-menu-btn {
            display: block;
        }
    }
    
    /* Animation for navbar on scroll */
    .navbar.scrolled {
        height: 60px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    
    .navbar.scrolled .nav-container {
        height: 60px;
    }
</style>

<script>
    // Mobile menu toggle
    document.querySelector('.mobile-menu-btn').addEventListener('click', function() {
        document.querySelector('.nav-links').classList.toggle('active');
    });
    
    // Navbar scroll effect
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
</script>