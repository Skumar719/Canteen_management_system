<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List, java.util.ArrayList, java.util.UUID" %>
<%
// Generate a unique order ID if not exists
Map<String, Object> order = (Map<String, Object>) session.getAttribute("currentOrder");
if (order != null && order.get("orderId") == null) {
    order.put("orderId", UUID.randomUUID().toString().substring(0, 8).toUpperCase());
    order.put("orderDate", new java.util.Date());
}

// Store the order in session history
if (order != null) {
    List<Map<String, Object>> orderHistory = (List<Map<String, Object>>) session.getAttribute("orderHistory");
    if (orderHistory == null) {
        orderHistory = new ArrayList<>();
        session.setAttribute("orderHistory", orderHistory);
    }
    orderHistory.add(0, order); // Add new order at beginning
    session.removeAttribute("currentOrder"); // Clear current order
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation - Campus Canteen</title>
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
            --success-color: #28a745;
            --warning-color: #ffc107;
            --text-color: #333333;
            --border-color: #e0e0e0;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            color: var(--text-color);
            line-height: 1.6;
            padding-top: 60px;
        }
        
        .confirmation-container {
            max-width: 800px;
            margin: 2rem auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            overflow: hidden;
        }
        
        .confirmation-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem;
            text-align: center;
        }
        
        .confirmation-icon {
            font-size: 4rem;
            color: var(--success-color);
            margin-bottom: 1rem;
        }
        
        .confirmation-header h2 {
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .confirmation-header p {
            font-size: 1.1rem;
            opacity: 0.9;
        }
        
        .order-details {
            padding: 2rem;
        }
        
        .status-badge {
            display: inline-block;
            background-color: #d4edda;
            color: #155724;
            padding: 5px 15px;
            border-radius: 50px;
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .section-title {
            color: var(--accent-color);
            border-bottom: 2px solid #eee;
            padding-bottom: 0.5rem;
            margin: 1.5rem 0 1rem;
            font-size: 1.25rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .detail-row {
            display: flex;
            margin-bottom: 0.8rem;
        }
        
        .detail-label {
            font-weight: 600;
            width: 150px;
            color: var(--dark-color);
        }
        
        .detail-value {
            flex: 1;
        }
        
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin: 1rem 0;
        }
        
        .items-table th {
            background-color: var(--light-color);
            padding: 0.75rem;
            text-align: left;
            font-weight: 600;
        }
        
        .items-table td {
            padding: 0.75rem;
            border-bottom: 1px solid #eee;
        }
        
        .item-name-col {
            width: 50%;
        }
        
        .total-row {
            font-weight: 700;
            font-size: 1.1rem;
            background-color: #f8f9fa;
        }
        
        .total-amount {
            color: var(--primary-color);
            font-weight: 700;
        }
        
        .btn-continue {
            display: inline-block;
            background-color: var(--accent-color);
            color: white;
            padding: 10px 25px;
            border-radius: 8px;
            text-decoration: none;
            margin-top: 2rem;
            transition: all 0.3s ease;
            font-weight: 500;
        }
        
        .btn-continue:hover {
            background-color: #5d3aa2;
            transform: translateY(-2px);
            color: white;
            text-decoration: none;
        }
        
        .info-box {
            margin-top: 2rem;
            padding: 1rem;
            background-color: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid var(--accent-color);
        }
        
        .info-box p {
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .error-box {
            padding: 1rem;
            background-color: #fff3cd;
            border-radius: 8px;
            margin-bottom: 1rem;
            border-left: 4px solid var(--warning-color);
        }
        
        .error-box h4 {
            color: #856404;
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        @media (max-width: 768px) {
            .confirmation-container {
                margin: 1rem;
            }
            
            .detail-row {
                flex-direction: column;
                gap: 5px;
            }
            
            .detail-label {
                width: 100%;
            }
            
            .items-table {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <div class="confirmation-header">
            <div class="confirmation-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h2>Order Confirmed!</h2>
            <p>Thank you for your order</p>
        </div>
        
        <div class="order-details">
            <div class="status-badge">
                <i class="fas fa-hourglass-half"></i> Status: Processing
            </div>
            
            <%
                if (order != null) {
                    List<Map<String, Object>> items = (List<Map<String, Object>>) order.get("items");
                    double total = 0;
            %>
                <!-- Order Information -->
                <div class="detail-row">
                    <div class="detail-label">Order ID:</div>
                    <div class="detail-value"><%= order.get("orderId") %></div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Order Date:</div>
                    <div class="detail-value">
                        <%= new java.text.SimpleDateFormat("MMM dd, yyyy hh:mm a").format(order.get("orderDate")) %>
                    </div>
                </div>
                
                <!-- Ordered Items -->
                <h4 class="section-title"><i class="fas fa-utensils"></i> Your Order</h4>
                <table class="items-table">
                    <thead>
                        <tr>
                            <th class="item-name-col">Item</th>
                            <th>Price</th>
                            <th>Qty</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Map<String, Object> item : items) {
                                String name = (String) item.get("name");
                                double price = (Double) item.get("price");
                                int quantity = item.get("quantity") != null ? (Integer) item.get("quantity") : 1;
                                double subtotal = price * quantity;
                                total += subtotal;
                        %>
                            <tr>
                                <td><%= name %></td>
                                <td>₹<%= String.format("%.2f", price) %></td>
                                <td><%= quantity %></td>
                                <td>₹<%= String.format("%.2f", subtotal) %></td>
                            </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td colspan="3">Delivery Charge</td>
                            <td>₹0.00</td>
                        </tr>
                        <tr class="total-row">
                            <td colspan="3">Total Amount</td>
                            <td class="total-amount">₹<%= String.format("%.2f", total) %></td>
                        </tr>
                    </tbody>
                </table>
                
                <!-- Delivery Information -->
                <h4 class="section-title"><i class="fas fa-truck"></i> Delivery Information</h4>
                <div class="detail-row">
                    <div class="detail-label">Name:</div>
                    <div class="detail-value"><%= order.get("customerName") %></div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Phone:</div>
                    <div class="detail-value"><%= order.get("customerMobile") %></div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Address:</div>
                    <div class="detail-value"><%= order.get("deliveryAddress") %></div>
                </div>
                
                <!-- Payment Information -->
                <h4 class="section-title"><i class="fas fa-credit-card"></i> Payment Information</h4>
                <div class="detail-row">
                    <div class="detail-label">Method:</div>
                    <div class="detail-value">
                        <%
                            String paymentMethod = (String) order.get("paymentMethod");
                            if ("cod".equals(paymentMethod)) {
                                out.print("Cash on Delivery");
                            } else {
                                out.print("Card Payment");
                            }
                        %>
                    </div>
                </div>
                <div class="detail-row">
                    <div class="detail-label">Status:</div>
                    <div class="detail-value">
                        <%
                            if ("cod".equals(paymentMethod)) {
                                out.print("Payment due on delivery");
                            } else {
                                out.print("Payment completed");
                            }
                        %>
                    </div>
                </div>
                
                <!-- Additional Message -->
                <div class="info-box">
                    <p><i class="fas fa-info-circle"></i> Your food is being prepared. Expected delivery time: 30-45 minutes.</p>
                    <p><i class="fas fa-phone"></i> For any queries, please call: +91 9876543210</p>
                </div>
                
                <!-- Continue Shopping Button -->
                <div style="text-align: center; margin-top: 2rem;">
                    <a href="menu.jsp" class="btn-continue">
                        <i class="fas fa-arrow-left"></i> Continue Shopping
                    </a>
                    <a href="order.jsp" class="btn-continue" style="background-color: var(--primary-color); margin-left: 10px;">
                        <i class="fas fa-clipboard-list"></i> View All Orders
                    </a>
                </div>
            <%
                } else {
            %>
                <div class="error-box">
                    <h4><i class="fas fa-exclamation-triangle"></i> Order Not Found</h4>
                    <p>We couldn't retrieve your order details. Please check your order history or contact support.</p>
                    <div style="text-align: center; margin-top: 1rem;">
                        <a href="menu.jsp" class="btn-continue">
                            <i class="fas fa-utensils"></i> Back to Menu
                        </a>
                    </div>
                </div>
            <%
                }
            %>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</body>
</html>