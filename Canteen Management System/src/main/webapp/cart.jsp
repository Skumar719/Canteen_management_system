<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart - Campus Canteen</title>
    <%@ include file="Navbar.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            padding-bottom: 50px;
        }
        
        .cart-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem 0;
            text-align: center;
            margin-bottom: 2rem;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
        }
        
        .cart-container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            padding: 2rem;
            margin-bottom: 3rem;
        }
        
        .empty-cart {
            text-align: center;
            padding: 3rem 0;
        }
        
        .empty-cart i {
            font-size: 4rem;
            color: #ccc;
            margin-bottom: 1rem;
        }
        
        .empty-cart h3 {
            color: var(--dark-color);
            margin-bottom: 0.5rem;
        }
        
        .empty-cart p {
            color: #777;
            margin-bottom: 1.5rem;
        }
        
        .continue-shopping {
            display: inline-block;
            background-color: var(--accent-color);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .continue-shopping:hover {
            background-color: #5d3aa2;
            transform: translateY(-2px);
        }
        
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 2rem;
        }
        
        .cart-table th {
            background-color: var(--light-color);
            padding: 1rem;
            text-align: left;
            border-bottom: 2px solid #eee;
        }
        
        .cart-table td {
            padding: 1rem;
            border-bottom: 1px solid #eee;
            vertical-align: middle;
        }
        
        .item-name {
            font-weight: 600;
            color: var(--dark-color);
        }
        
        .item-price {
            font-weight: 600;
            color: var(--primary-color);
        }
        
        .remove-btn {
            background-color: transparent;
            color: #dc3545;
            border: 1px solid #dc3545;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .remove-btn:hover {
            background-color: #dc3545;
            color: white;
        }
        
        .cart-summary {
            border-top: 2px dashed #eee;
            padding-top: 1.5rem;
        }
        
        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }
        
        .total {
            font-weight: 600;
            font-size: 1.2rem;
        }
        
        .total-price {
            font-weight: 700;
            font-size: 1.3rem;
            color: var(--primary-color);
        }
        
        .checkout-btn {
            width: 100%;
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 8px;
            padding: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .checkout-btn:hover {
            background-color: #5d3aa2;
            transform: translateY(-2px);
        }
        
        .checkout-btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        
        @media (max-width: 768px) {
            .cart-header {
                padding: 1.5rem 0;
                clip-path: polygon(0 0, 100% 0, 100% 95%, 0 100%);
            }
            
            .cart-container {
                padding: 1rem;
            }
            
            .cart-table th, .cart-table td {
                padding: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <!-- Cart Header -->
    <section class="cart-header">
        <div class="container">
            <h2><i class="fas fa-shopping-cart"></i> Your Cart</h2>
        </div>
    </section>

    <!-- Cart Container -->
    <div class="container">
        <div class="cart-container">
            <% 
                List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
                double total = 0;
                
                if (cart == null || cart.isEmpty()) { 
            %>
                <div class="empty-cart">
                    <i class="fas fa-shopping-basket"></i>
                    <h3>Your cart is empty</h3>
                    <p>Looks like you haven't added any items yet</p>
                    <a href="menu.jsp" class="continue-shopping">
                        <i class="fas fa-arrow-left"></i> Continue Shopping
                    </a>
                </div>
            <% 
                } else { 
                    for (Map<String, Object> item : cart) {
                        total += (Double) item.get("price");
                    }
            %>
                <table class="cart-table">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Price</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < cart.size(); i++) { 
                            Map<String, Object> item = cart.get(i);
                        %>
                            <tr>
                                <td class="item-name"><%= item.get("name") %></td>
                                <td class="item-price">₹<%= String.format("%.2f", item.get("price")) %></td>
                                <td>
                                    <form method="post" action="cart">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="index" value="<%= i %>">
                                        <button type="submit" class="remove-btn">
                                            <i class="fas fa-trash-alt"></i> Remove
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <div class="cart-summary">
                    <div class="summary-row">
                        <span class="total">Total:</span>
                        <span class="total-price">₹<%= String.format("%.2f", total) %></span>
                    </div>
                    
                    <form action="checkout.jsp" method="post">
                        <button type="submit" class="checkout-btn">
                            <i class="fas fa-credit-card"></i> Proceed to Checkout
                        </button>
                    </form>
                </div>
            <% } %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>