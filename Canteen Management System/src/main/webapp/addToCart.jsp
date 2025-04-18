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
        /* Same styles as in previous addTocart.jsp */
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
        }
        
        .cart-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem 0;
            text-align: center;
            margin-bottom: 2rem;
            clip-path: polygon(0 0, 100% 0, 100% 90%, 0 100%);
        }
        
        .cart-header h2 {
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        
        .cart-container {
            max-width: 1000px;
            margin: 0 auto 3rem;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        
        /* Rest of the styles remain the same as before */
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