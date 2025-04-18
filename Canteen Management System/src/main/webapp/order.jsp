<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.text.SimpleDateFormat" %>
  <%@ include file="Navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History - Campus Canteen</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #ff8e8e;
            --accent-color: #6f42c1;
            --light-color: #f8f9fa;
            --dark-color: #343a40;
            --text-color: #333333;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f5;
            color: var(--text-color);
            padding-top: 60px;
        }
        
        .order-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 15px;
        }
        
        .order-header {
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .order-header h2 {
            font-weight: 700;
            color: var(--dark-color);
        }
        
        .order-card {
            background: white;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            margin-bottom: 1.5rem;
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid #e9ecef;
        }
        
        .order-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .order-card-header {
            background-color: var(--light-color);
            padding: 1rem 1.5rem;
            border-bottom: 1px solid rgba(0,0,0,0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .order-id {
            font-weight: 600;
            color: var(--accent-color);
        }
        
        .order-date {
            color: #666;
            font-size: 0.9rem;
        }
        
        .order-status {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            margin-top: 0.5rem;
        }
        
        .status-processing {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .status-delivered {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .order-card-body {
            padding: 1.5rem;
        }
        
        .order-items {
            width: 100%;
            margin-bottom: 1rem;
            border-collapse: collapse;
        }
        
        .order-items th {
            text-align: left;
            padding: 0.75rem;
            border-bottom: 1px solid #dee2e6;
            font-weight: 600;
            background-color: #f8f9fa;
        }
        
        .order-items td {
            padding: 0.75rem;
            border-bottom: 1px solid #dee2e6;
            vertical-align: top;
        }
        
        .order-total {
            text-align: right;
            font-weight: 700;
            font-size: 1.1rem;
            margin-top: 1rem;
            padding-top: 1rem;
            border-top: 2px solid #dee2e6;
        }
        
        .total-amount {
            color: var(--primary-color);
        }
        
        .delivery-info {
            margin-top: 1.5rem;
            padding: 1rem;
            background-color: #f8f9fa;
            border-radius: 8px;
            border-left: 3px solid var(--accent-color);
        }
        
        .delivery-info p {
            margin-bottom: 0.5rem;
        }
        
        .empty-orders {
            text-align: center;
            padding: 3rem;
            background: white;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }
        
        .empty-orders i {
            font-size: 3rem;
            color: #ccc;
            margin-bottom: 1rem;
        }
        
        .empty-orders h4 {
            color: var(--dark-color);
            margin-bottom: 0.5rem;
        }
        
        .empty-orders p {
            color: #666;
            margin-bottom: 1.5rem;
        }
        
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 1.5rem;
            justify-content: flex-end;
        }
        
        .btn-view {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-view:hover {
            background-color: #5d3aa2;
            color: white;
        }
        
        .btn-delete {
            background-color: var(--danger-color);
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            font-size: 0.9rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-delete:hover {
            background-color: #c82333;
            color: white;
        }
        
        /* Confirmation dialog styles */
        .confirmation-dialog {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }
        
        .confirmation-box {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            text-align: center;
        }
        
        .confirmation-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1.5rem;
        }
        
        @media (max-width: 768px) {
            .order-card-header {
                flex-direction: column;
                align-items: flex-start;
                gap: 0.5rem;
            }
            
            .order-items {
                font-size: 0.9rem;
            }
            
            .order-items th, 
            .order-items td {
                padding: 0.5rem;
            }
            
            .action-buttons {
                justify-content: flex-start;
            }
        }
    </style>
</head>
<body>
    <div class="order-container">
        <div class="order-header">
            <h2><i class="fas fa-clipboard-list"></i> Your Order History</h2>
            <p class="text-muted">View all your past and current orders</p>
        </div>
        
        <%
            List<Map<String, Object>> orderHistory = (List<Map<String, Object>>) session.getAttribute("orderHistory");
            SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy hh:mm a");
            
            if (orderHistory != null && !orderHistory.isEmpty()) {
                for (Map<String, Object> order : orderHistory) {
                    List<Map<String, Object>> items = (List<Map<String, Object>>) order.get("items");
                    double total = 0;
        %>
            <div class="order-card" data-order-id="<%= order.get("orderId") %>">
                <div class="order-card-header">
                    <div>
                        <span class="order-id">Order #<%= order.get("orderId") %></span>
                        <span class="order-date">
                            • <%= dateFormat.format(order.get("orderDate")) %>
                        </span>
                        <div class="order-status status-processing">
                            <i class="fas fa-hourglass-half"></i> Processing
                        </div>
                    </div>
                </div>
                
                <div class="order-card-body">
                    <table class="order-items">
                        <thead>
                            <tr>
                                <th>Item</th>
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
                        </tbody>
                    </table>
                    
                    <div class="order-total">
                        Total: <span class="total-amount">₹<%= String.format("%.2f", total) %></span>
                    </div>
                    
                    <div class="delivery-info">
                        <p><strong><i class="fas fa-user"></i> Customer:</strong> <%= order.get("customerName") %></p>
                        <p><strong><i class="fas fa-phone"></i> Phone:</strong> <%= order.get("customerMobile") %></p>
                        <p><strong><i class="fas fa-map-marker-alt"></i> Address:</strong> <%= order.get("deliveryAddress") %></p>
                        <p><strong><i class="fas fa-credit-card"></i> Payment:</strong> 
                            <%= "cod".equals(order.get("paymentMethod")) ? "Cash on Delivery" : "Card Payment" %>
                            (<%= "cod".equals(order.get("paymentMethod")) ? "Payment due on delivery" : "Payment completed" %>)
                        </p>
                    </div>
                    
                    <div class="action-buttons">
                        <button class="btn-view">
                            <i class="fas fa-eye"></i> View Details
                        </button>
                        <button class="btn-delete">
                            <i class="fas fa-trash-alt"></i> Delete Order
                        </button>
                    </div>
                </div>
            </div>
        <%
                }
            } else {
        %>
            <div class="empty-orders">
                <i class="fas fa-clipboard"></i>
                <h4>No orders found</h4>
                <p>You haven't placed any orders yet.</p>
                <a href="menu.jsp" class="btn btn-primary mt-3">
                    <i class="fas fa-utensils"></i> Browse Menu
                </a>
            </div>
        <%
            }
        %>
    </div>

    <!-- Confirmation Dialog -->
    <div class="confirmation-dialog" id="confirmationDialog">
        <div class="confirmation-box">
            <h4>Confirm Deletion</h4>
            <p>Are you sure you want to delete this order from your history?</p>
            <p class="text-muted">This action cannot be undone.</p>
            <div class="confirmation-buttons">
                <button class="btn btn-secondary" id="cancelDelete">Cancel</button>
                <button class="btn btn-danger" id="confirmDelete">Delete</button>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script>
        // View details button
        document.querySelectorAll('.btn-view').forEach(button => {
            button.addEventListener('click', function() {
                const orderCard = this.closest('.order-card');
                const orderId = orderCard.querySelector('.order-id').textContent;
                alert('Showing details for ' + orderId);
            });
        });
        
        // Delete functionality
        let currentOrderToDelete = null;
        
        document.querySelectorAll('.btn-delete').forEach(button => {
            button.addEventListener('click', function() {
                const orderCard = this.closest('.order-card');
                currentOrderToDelete = orderCard;
                document.getElementById('confirmationDialog').style.display = 'flex';
            });
        });
        
        document.getElementById('cancelDelete').addEventListener('click', function() {
            document.getElementById('confirmationDialog').style.display = 'none';
            currentOrderToDelete = null;
        });
        
        document.getElementById('confirmDelete').addEventListener('click', function() {
            if (currentOrderToDelete) {
                const orderId = currentOrderToDelete.getAttribute('data-order-id');
                
                // Send AJAX request to delete the order
                fetch('DeleteOrderHistoryServlet', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'orderId=' + encodeURIComponent(orderId)
                })
                .then(response => {
                    if (response.ok) {
                        return response.text();
                    }
                    throw new Error('Network response was not ok.');
                })
                .then(data => {
                    // Remove the order card from the UI
                    currentOrderToDelete.remove();
                    document.getElementById('confirmationDialog').style.display = 'none';
                    
                    // Show success message
                    alert('Order deleted successfully!');
                    
                    // Check if no orders left, show empty state
                    if (document.querySelectorAll('.order-card').length === 0) {
                        document.querySelector('.order-container').innerHTML = `
                            <div class="order-header">
                                <h2><i class="fas fa-clipboard-list"></i> Your Order History</h2>
                                <p class="text-muted">View all your past and current orders</p>
                            </div>
                            <div class="empty-orders">
                                <i class="fas fa-clipboard"></i>
                                <h4>No orders found</h4>
                                <p>You haven't placed any orders yet.</p>
                                <a href="menu.jsp" class="btn btn-primary mt-3">
                                    <i class="fas fa-utensils"></i> Browse Menu
                                </a>
                            </div>
                        `;
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('There was an error deleting the order. Please try again.');
                    document.getElementById('confirmationDialog').style.display = 'none';
                });
            }
        });
    </script>
</body>
</html>