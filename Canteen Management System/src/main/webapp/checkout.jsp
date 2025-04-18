<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>
<%
    List<Map<String, Object>> cart = (List<Map<String, Object>>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
        response.sendRedirect("menu.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Campus Canteen</title>
    <%@ include file="Navbar.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Root Variables */
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #ff8e8e;
            --accent-color: #6f42c1;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --text-color: #333333;
            --border-color: #e0e0e0;
        }

        /* Base Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-color);
            color: var(--text-color);
            margin: 0;
            padding: 0;
        }

        /* Checkout Header */
        .checkout-header {
            background-color: var(--primary-color);
            color: white;
            padding: 1.5rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .checkout-header h2 {
            margin: 0;
            font-weight: 600;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        /* Main Container */
        .checkout-container {
            padding-bottom: 3rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Checkout Card */
        .checkout-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid var(--border-color);
        }

        /* Table Styles */
        .checkout-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }

        .checkout-table th {
            text-align: left;
            padding: 0.75rem;
            border-bottom: 2px solid var(--border-color);
            font-weight: 600;
            color: var(--dark-color);
        }

        .checkout-table td {
            padding: 0.75rem;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
        }

        .item-name {
            font-weight: 500;
        }

        .item-price {
            font-weight: 500;
            color: var(--primary-color);
        }

        /* Summary Card */
        .summary-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: 1px solid var(--border-color);
        }

        .summary-card h4 {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .summary-card h4 i {
            color: var(--primary-color);
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            padding: 0.75rem 0;
            border-bottom: 1px solid var(--border-color);
        }

        .summary-row:last-child {
            border-bottom: none;
        }

        .total-row {
            font-weight: 600;
            font-size: 1.1rem;
        }

        .total-price {
            color: var(--primary-color);
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 1.25rem;
        }

        .form-label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark-color);
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.15);
        }

        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }

        /* Payment Methods */
        .payment-methods {
            display: flex;
            gap: 1rem;
            margin-top: 0.5rem;
        }

        .payment-method {
            flex: 1;
            padding: 1rem;
            border: 1px solid var(--border-color);
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 5px;
        }

        .payment-method i {
            font-size: 1.5rem;
            color: #777;
        }

        .payment-method div {
            font-size: 0.9rem;
        }

        .payment-method.active {
            border-color: var(--primary-color);
            background-color: rgba(255, 107, 107, 0.05);
        }

        .payment-method.active i {
            color: var(--primary-color);
        }

        /* Submit Button */
        .btn-submit {
            width: 100%;
            padding: 0.75rem;
            background-color: var(--accent-color);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-submit:hover {
            background-color: #5d3aa2;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .checkout-container {
                padding: 0 15px;
            }
            
            .payment-methods {
                flex-direction: column;
            }
            
            .checkout-table {
                font-size: 0.9rem;
            }
        }

        @media (max-width: 576px) {
            .checkout-header h2 {
                font-size: 1.5rem;
            }
            
            .checkout-table th, 
            .checkout-table td {
                padding: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Checkout Header -->
    <section class="checkout-header">
        <div class="container">
            <h2><i class="fas fa-credit-card"></i> Checkout</h2>
        </div>
    </section>

    <!-- Checkout Container -->
    <div class="container checkout-container">
        <div class="row">
            <div class="col-lg-8">
                <div class="checkout-card">
                    <table class="checkout-table">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                double total = 0;
                                for (Map<String, Object> item : cart) {
                                    String name = (String) item.get("name");
                                    double price = (Double) item.get("price");
                                    int quantity = item.get("quantity") != null ? (Integer) item.get("quantity") : 1;
                                    double subtotal = price * quantity;
                                    total += subtotal;
                            %>
                                    <tr>
                                        <td class="item-name"><%= name %></td>
                                        <td class="item-price">₹<%= String.format("%.2f", price) %></td>
                                        <td><%= quantity %></td>
                                        <td class="item-price">₹<%= String.format("%.2f", subtotal) %></td>
                                    </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
                
                <div class="summary-card">
                    <div class="summary-row">
                        <span>Subtotal:</span>
                        <span>₹<%= String.format("%.2f", total) %></span>
                    </div>
                    <div class="summary-row">
                        <span>Delivery Charge:</span>
                        <span>₹0.00</span>
                    </div>
                    <div class="summary-row total-row">
                        <span>Total:</span>
                        <span class="total-price">₹<%= String.format("%.2f", total) %></span>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-4">
                <div class="summary-card">
                    <h4><i class="fas fa-truck"></i> Delivery Details</h4>
                    
                    <form action="checkout" method="post" class="payment-form">
                        <div class="form-group">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Mobile Number</label>
                            <input type="tel" name="mobile" class="form-control" pattern="[0-9]{10}" title="Please enter a 10-digit mobile number" required>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Delivery Address</label>
                            <textarea name="address" class="form-control" rows="3" required></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Payment Method</label>
                            <div class="payment-methods">
                                <div class="payment-method active" onclick="selectPayment(this, 'cod')">
                                    <i class="fas fa-money-bill-wave"></i>
                                    <div>Cash on Delivery</div>
                                    <input type="radio" name="payment" value="cod" checked hidden>
                                </div>
                                <div class="payment-method" onclick="selectPayment(this, 'card')">
                                    <i class="fas fa-credit-card"></i>
                                    <div>Card</div>
                                    <input type="radio" name="payment" value="card" hidden>
                                </div>
                            </div>
                        </div>
                        
                        <button type="submit" class="btn-submit">
                            <i class="fas fa-check-circle"></i> Place Order
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function selectPayment(element, value) {
            document.querySelectorAll('.payment-method').forEach(el => {
                el.classList.remove('active');
                el.querySelector('input[type="radio"]').checked = false;
            });
            
            element.classList.add('active');
            element.querySelector('input[type="radio"]').checked = true;
        }
    </script>

    <%@ include file="footer.jsp" %>
</body>
</html>