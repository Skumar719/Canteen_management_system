<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu - Campus Canteen</title>
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
            --text-color: #333333;
            --border-color: #e0e0e0;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #ffffff;
            color: var(--text-color);
            line-height: 1.6;
        }
        
        .menu-header {
            background: white;
            color: var(--text-color);
            padding: 3rem 0 2rem;
            text-align: center;
            margin-bottom: 1.5rem;
            border-bottom: 1px solid var(--border-color);
        }
        
        .menu-header h1 {
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
        }
        
        .menu-header .lead {
            font-weight: 400;
            font-size: 1.1rem;
            color: #666;
        }
        
        .menu-container {
            padding: 0 1rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .search-container {
            max-width: 600px;
            margin: 0 auto 1.5rem;
            position: relative;
        }
        
        .search-container i {
            position: absolute;
            left: 15px;
            top: 12px;
            color: #999;
        }
        
        .search-container input {
            padding-left: 40px;
            border-radius: 25px;
            border: 1px solid var(--border-color);
            height: 45px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .search-container input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.15);
            outline: none;
        }
        
        .category-filter {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 2rem;
        }
        
        .category-btn {
            padding: 8px 20px;
            border-radius: 25px;
            background: white;
            border: 1px solid var(--border-color);
            font-weight: 500;
            color: var(--text-color);
            transition: all 0.3s ease;
            cursor: pointer;
            font-size: 0.9rem;
        }
        
        .category-btn:hover {
            background: #f5f5f5;
        }
        
        .category-btn.active {
            background: var(--primary-color);
            color: white;
            border-color: var(--primary-color);
        }
        
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
            padding: 0 10px;
        }
        
        .menu-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
            border: 1px solid var(--border-color);
        }
        
        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }
        
        .menu-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .menu-card:hover .menu-img {
            transform: scale(1.03);
        }
        
        .menu-content {
            padding: 1.25rem;
        }
        
        .menu-title {
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
            font-size: 1.2rem;
        }
        
        .menu-price {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1.25rem;
            margin-bottom: 1rem;
        }
        
        .menu-buttons {
            display: flex;
            gap: 10px;
        }
        
        .btn-cart {
            background-color: white;
            color: var(--primary-color);
            border: 1px solid var(--primary-color);
            border-radius: 8px;
            padding: 8px 15px;
            font-weight: 500;
            flex: 1;
            transition: all 0.3s ease;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        
        .btn-cart:hover {
            background-color: var(--primary-color);
            color: white;
        }
        
        .btn-buy {
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 8px 15px;
            font-weight: 500;
            flex: 1;
            transition: all 0.3s ease;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
        }
        
        .btn-buy:hover {
            background-color: #5d3aa2;
        }
        
        .cart-badge {
            position: relative;
        }
        
        .cart-badge::after {
            content: attr(data-count);
            position: absolute;
            top: -8px;
            right: -8px;
            background: var(--accent-color);
            color: white;
            border-radius: 50%;
            width: 18px;
            height: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
        }
        
        @media (max-width: 768px) {
            .menu-header {
                padding: 2rem 0 1.5rem;
            }
            
            .menu-header h1 {
                font-size: 2rem;
            }
            
            .menu-grid {
                grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
                gap: 20px;
            }
            
            .menu-buttons {
                flex-direction: column;
            }
        }
        
        @media (max-width: 576px) {
            .menu-header h1 {
                font-size: 1.8rem;
            }
            
            .category-filter {
                gap: 6px;
            }
            
            .category-btn {
                padding: 6px 15px;
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>
    <!-- Menu Header -->
    <section class="menu-header">
        <div class="container">
            <h1><i class="fas fa-utensils"></i> Our Delicious Menu</h1>
            <p class="lead">Discover our wide variety of fresh and tasty dishes</p>
        </div>
    </section>

    <!-- Menu Container -->
    <div class="container menu-container">
        <!-- Search and Filter -->
        <div class="search-container">
            <i class="fas fa-search"></i>
            <input type="text" id="searchInput" class="form-control" placeholder="Search for your favorite dish...">
        </div>
        
        <div class="category-filter">
            <button class="category-btn active" data-category="all">All Items</button>
            <button class="category-btn" data-category="burger">Burgers</button>
            <button class="category-btn" data-category="pizza">Pizzas</button>
            <button class="category-btn" data-category="indian">Indian</button>
            <button class="category-btn" data-category="noodles">Noodles</button>
            <button class="category-btn" data-category="snacks">Snacks</button>
            <button class="category-btn" data-category="beverages">Beverages</button>
        </div>
        
        <!-- Menu Grid -->
        <div class="menu-grid" id="menuGrid">
            <!-- Burgers -->
            <div class="menu-card" data-category="burger">
                <img src="image/burger.jpeg" alt="Classic Burger" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Classic Burger</h3>
                    <p class="menu-price">₹50</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Classic Burger">
                            <input type="hidden" name="price" value="50">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Classic Burger', 50)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="menu-card" data-category="burger">
                <img src="image/Cheese Burger.jpeg" alt="Cheese Burger" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Cheese Burger</h3>
                    <p class="menu-price">₹65</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Cheese Burger">
                            <input type="hidden" name="price" value="65">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Cheese Burger', 65)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Pizzas -->
            <div class="menu-card" data-category="pizza">
                <img src="image/Margherita Pizza.jpeg" alt="Margherita Pizza" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Margherita Pizza</h3>
                    <p class="menu-price">₹80</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Margherita Pizza">
                            <input type="hidden" name="price" value="80">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Margherita Pizza', 80)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="menu-card" data-category="pizza">
                <img src="image/Pepperoni Pizza.jpeg" alt="Pepperoni Pizza" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Pepperoni Pizza</h3>
                    <p class="menu-price">₹95</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Pepperoni Pizza">
                            <input type="hidden" name="price" value="95">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Pepperoni Pizza', 95)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Indian -->
            <div class="menu-card" data-category="indian">
                <img src="image/Vegetable Biryani.jpeg" alt="Vegetable Biryani" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Vegetable Biryani</h3>
                    <p class="menu-price">₹70</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Vegetable Biryani">
                            <input type="hidden" name="price" value="70">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Vegetable Biryani', 70)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="menu-card" data-category="indian">
                <img src="image/Butter Chicken.jpeg" alt="Butter Chicken" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Butter Chicken</h3>
                    <p class="menu-price">₹90</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Butter Chicken">
                            <input type="hidden" name="price" value="90">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Butter Chicken', 90)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Noodles -->
            <div class="menu-card" data-category="noodles">
                <img src="image/Veg Noodles.jpeg" alt="Veg Noodles" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Veg Noodles</h3>
                    <p class="menu-price">₹60</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Veg Noodles">
                            <input type="hidden" name="price" value="60">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Veg Noodles', 60)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Snacks -->
            <div class="menu-card" data-category="snacks">
                <img src="image/French Fries.jpeg" alt="French Fries" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">French Fries</h3>
                    <p class="menu-price">₹40</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="French Fries">
                            <input type="hidden" name="price" value="40">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('French Fries', 40)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="menu-card" data-category="snacks">
                <img src="image/Grilled Sandwich.jpeg" alt="Grilled Sandwich" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Grilled Sandwich</h3>
                    <p class="menu-price">₹45</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Grilled Sandwich">
                            <input type="hidden" name="price" value="45">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Grilled Sandwich', 45)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <!-- Beverages -->
            <div class="menu-card" data-category="beverages">
                <img src="image/Hot Coffee.jpeg" alt="Hot Coffee" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Hot Coffee</h3>
                    <p class="menu-price">₹25</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Hot Coffee">
                            <input type="hidden" name="price" value="25">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Hot Coffee', 25)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="menu-card" data-category="beverages">
                <img src="image/Fresh Lemonade.jpeg" alt="Fresh Lemonade" class="menu-img">
                <div class="menu-content">
                    <h3 class="menu-title">Fresh Lemonade</h3>
                    <p class="menu-price">₹30</p>
                    <div class="menu-buttons">
                        <form action="cart" method="post" style="display: inline; flex: 1;">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="item" value="Fresh Lemonade">
                            <input type="hidden" name="price" value="30">
                            <button type="submit" class="btn-cart">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                        </form>
                        <button class="btn-buy" onclick="buyNow('Fresh Lemonade', 30)">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Search functionality
        document.getElementById('searchInput').addEventListener('keyup', function() {
            const filter = this.value.toLowerCase();
            const menuItems = document.querySelectorAll('.menu-card');
            
            menuItems.forEach(item => {
                const title = item.querySelector('.menu-title').textContent.toLowerCase();
                if (title.includes(filter)) {
                    item.style.display = "block";
                } else {
                    item.style.display = "none";
                }
            });
        });

        // Category filter functionality
        const categoryBtns = document.querySelectorAll('.category-btn');
        categoryBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                categoryBtns.forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                
                const category = this.dataset.category;
                const menuItems = document.querySelectorAll('.menu-card');
                
                menuItems.forEach(item => {
                    if (category === 'all' || item.dataset.category === category) {
                        item.style.display = "block";
                    } else {
                        item.style.display = "none";
                    }
                });
            });
        });

        // Buy Now functionality
        function buyNow(itemName, price) {
            // Add item to cart via AJAX
            fetch('cart?action=add&item=' + encodeURIComponent(itemName) + '&price=' + price, {
                method: 'POST'
            }).then(() => {
                // Then redirect to checkout
                window.location.href = 'checkout.jsp';
            });
        }

        // Update cart badge count
        function updateCartBadge() {
            fetch('cart?action=count')
                .then(response => response.json())
                .then(data => {
                    const cartBadge = document.querySelector('.cart-badge');
                    if (cartBadge) {
                        cartBadge.setAttribute('data-count', data.count || '0');
                    }
                });
        }

        // Initialize
        document.addEventListener('DOMContentLoaded', function() {
            updateCartBadge();
        });
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>