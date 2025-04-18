<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map, java.text.SimpleDateFormat" %>

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
        
        .order-table {
            background: white;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
            overflow: hidden;
        }
        
        .order-table thead th {
            background-color: var(--accent-color);
            color: white;
            font-weight: 600;
            padding: 1rem;
            border: none;
        }
        
        .order-table tbody tr {
            transition: all 0.2s ease;
        }
        
        .order-table tbody tr:hover {
            background-color: rgba(111, 66, 193, 0.05);
        }
        
        .order-table td {
            padding: 1rem;
            vertical-align: middle;
            border-top: 1px solid #e9ecef;
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
        
        .btn-action {
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            font-size: 0.85rem;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-right: 5px;
        }
        
        .btn-view {
            background-color: var(--accent-color);
            color: white;
        }
        
        .btn-view:hover {
            background-color: #5d3aa2;
        }
        
        .btn-delete {
            background-color: var(--danger-color);
            color: white;
        }
        
        .btn-delete:hover {
            background-color: #c82333;
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
        
        .items-popover {
            max-width: 400px;
        }
        
        .items-list {
            padding: 0;
            margin: 0;
            list-style: none;
        }
        
        .items-list li {
            padding: 5px 0;
            border-bottom: 1px solid #eee;
        }
        
        .items-list li:last-child {
            border-bottom: none;
        }
        
        @media (max-width: 768px) {
            .order-table {
                font-size: 0.9rem;
            }
            
            .order-table thead {
                display: none;
            }
            
            .order-table tr {
                display: block;
                margin-bottom: 1rem;
                border: 1px solid #dee2e6;
                border-radius: 5px;
            }
            
            .order-table td {
                display: block;
                text-align: right;
                padding: 0.75rem;
                border-top: none;
            }
            
            .order-table td::before {
                content: attr(data-label);
                float: left;
                font-weight: bold;
                color: var(--accent-color);
            }
            
            .btn-action {
                display: block;
                width: 100%;
                margin-bottom: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="order-container">
        <div class="order-header">
            <h2><i class="fas fa-clipboard-list"></i> ORDER DETAILS</h2>
            <p class="text-muted">View all your past and current orders</p>
        </div>
        
        <%
            List<Map<String, Object>> orderHistory = (List<Map<String, Object>>) session.getAttribute("orderHistory");
            SimpleDateFormat dateFormat = new SimpleDateFormat("MMM dd, yyyy hh:mm a");
            if (orderHistory != null && !orderHistory.isEmpty()) {
        %>
        <div class="table-responsive order-table">
            <table class="table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date</th>
                        <th>Items</th>
                        <th>Customer</th>
                        <th>Total</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    for (Map<String, Object> order : orderHistory) {
                        List<Map<String, Object>> items = (List<Map<String, Object>>) order.get("items");
                        double total = 0;
                        for (Map<String, Object> item : items) {
                            double price = (Double) item.get("price");
                            int quantity = item.get("quantity") != null ? (Integer) item.get("quantity") : 1;
                            total += price * quantity;
                        }
                %>
                    <tr data-order-id="<%= order.get("orderId") %>">
                        <td data-label="Order ID">
                            <span class="order-id">#<%= order.get("orderId") %></span>
                        </td>
                        <td data-label="Date">
                            <span class="order-date"><%= dateFormat.format(order.get("orderDate")) %></span>
                        </td>
                        <td data-label="Items">
                            <button class="btn btn-sm btn-outline-primary view-items" 
                                    data-bs-toggle="popover" 
                                    title="Order Items"
                                    data-bs-content="
                                        <ul class='items-list'>
                                        <% for (Map<String, Object> item : items) { 
                                            String name = (String) item.get("name");
                                            double price = (Double) item.get("price");
                                            int quantity = item.get("quantity") != null ? (Integer) item.get("quantity") : 1;
                                            double subtotal = price * quantity;
                                        %>
                                            <li><%= name %> × <%= quantity %> = ₹<%= String.format("%.2f", subtotal) %></li>
                                        <% } %>
                                        </ul>">
                                <i class="fas fa-list"></i> <%= items.size() %> items
                            </button>
                        </td>
                        <td data-label="Customer">
                            <%= order.get("customerName") %><br>
                            <small class="text-muted"><%= order.get("customerMobile") %></small>
                        </td>
                        <td data-label="Total">
                            ₹<%= String.format("%.2f", total) %>
                        </td>
                        <td data-label="Status">
                            <span class="order-status status-processing">
                                <i class="fas fa-hourglass-half"></i> Processing
                            </span>
                        </td>
                        <td data-label="Actions">
                            <button class="btn-action btn-view" data-bs-toggle="modal" data-bs-target="#orderModal" 
                                data-order-id="<%= order.get("orderId") %>"
                                data-customer="<%= order.get("customerName") %>"
                                data-phone="<%= order.get("customerMobile") %>"
                                data-address="<%= order.get("deliveryAddress") %>"
                                data-payment="<%= "cod".equals(order.get("paymentMethod")) ? "Cash on Delivery" : "Card Payment" %>"
                                data-status="Processing"
                                data-total="₹<%= String.format("%.2f", total) %>"
                                data-date="<%= dateFormat.format(order.get("orderDate")) %>">
                                <i class="fas fa-eye"></i> View
                            </button>
                            <button class="btn-action btn-delete">
                                <i class="fas fa-trash-alt"></i> Delete
                            </button>
                        </td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
        <%
            } else {
        %>
        <div class="empty-orders">
            <i class="fas fa-clipboard"></i>
            <h4>No orders found</h4>
            <p>You haven't received any orders yet.</p>
        </div>
        <%
            }
        %>
    </div>

    <!-- Order Details Modal -->
    <div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="orderModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="orderModalLabel">Order Details</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <p><strong>Order ID:</strong> <span id="modalOrderId"></span></p>
                            <p><strong>Order Date:</strong> <span id="modalOrderDate"></span></p>
                            <p><strong>Status:</strong> <span id="modalOrderStatus"></span></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>Customer:</strong> <span id="modalCustomer"></span></p>
                            <p><strong>Phone:</strong> <span id="modalPhone"></span></p>
                            <p><strong>Payment:</strong> <span id="modalPayment"></span></p>
                        </div>
                    </div>
                    <div class="mb-3">
                        <p><strong>Delivery Address:</strong></p>
                        <p id="modalAddress" class="p-2 bg-light rounded"></p>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Item</th>
                                    <th>Price</th>
                                    <th>Qty</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tbody id="modalItems">
                                <!-- Items will be populated by JavaScript -->
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th colspan="3" class="text-end">Total:</th>
                                    <th id="modalTotal"></th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Initialize popovers
        document.addEventListener('DOMContentLoaded', function() {
            const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
            popoverTriggerList.map(function (popoverTriggerEl) {
                return new bootstrap.Popover(popoverTriggerEl, {
                    html: true,
                    trigger: 'focus',
                    container: 'body'
                });
            });
            
            // Order modal setup
            const orderModal = document.getElementById('orderModal');
            if (orderModal) {
                orderModal.addEventListener('show.bs.modal', function (event) {
                    const button = event.relatedTarget;
                    const orderId = button.getAttribute('data-order-id');
                    const orderRow = document.querySelector(`tr[data-order-id='${orderId}']`);
                    
                    // Set modal content
                    document.getElementById('modalOrderId').textContent = orderId;
                    document.getElementById('modalCustomer').textContent = button.getAttribute('data-customer');
                    document.getElementById('modalPhone').textContent = button.getAttribute('data-phone');
                    document.getElementById('modalAddress').textContent = button.getAttribute('data-address');
                    document.getElementById('modalPayment').textContent = button.getAttribute('data-payment');
                    document.getElementById('modalOrderStatus').textContent = button.getAttribute('data-status');
                    document.getElementById('modalTotal').textContent = button.getAttribute('data-total');
                    document.getElementById('modalOrderDate').textContent = button.getAttribute('data-date');
                    
                    // Get items from the popover content
                    const popoverContent = button.getAttribute('data-bs-content');
                    document.getElementById('modalItems').innerHTML = popoverContent
                        .replace('<ul class=\'items-list\'>', '')
                        .replace('</ul>', '')
                        .replace(/<li>/g, '<tr><td>')
                        .replace(/<\/li>/g, '</td></tr>')
                        .replace(/ × /g, '</td><td>')
                        .replace(/ = /g, '</td><td>');
                });
            }
            
            // Delete Order logic
            let currentOrderToDelete = null;
            
            document.querySelectorAll('.btn-delete').forEach(button => {
                button.addEventListener('click', function() {
                    currentOrderToDelete = this.closest('tr');
                    document.getElementById('confirmationDialog').style.display = 'flex';
                });
            });
            
            document.getElementById('cancelDelete').addEventListener('click', () => {
                document.getElementById('confirmationDialog').style.display = 'none';
                currentOrderToDelete = null;
            });
            
            document.getElementById('confirmDelete').addEventListener('click', () => {
                if (currentOrderToDelete) {
                    const orderId = currentOrderToDelete.getAttribute('data-order-id');
                    fetch('DeleteOrderHistoryServlet', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                        body: 'orderId=' + encodeURIComponent(orderId)
                    })
                    .then(res => res.ok ? res.text() : Promise.reject('Failed'))
                    .then(() => {
                        currentOrderToDelete.remove();
                        document.getElementById('confirmationDialog').style.display = 'none';
                        alert('Order deleted successfully!');
                        
                        // Check if table is empty now
                        if (document.querySelectorAll('.order-table tbody tr').length === 0) {
                            document.querySelector('.order-container').innerHTML = `
                                <div class="order-header">
                                    <h2><i class="fas fa-clipboard-list"></i> ORDER DETAILS</h2>
                                    <p class="text-muted">View all your past and current orders</p>
                                </div>
                                <div class="empty-orders">
                                    <i class="fas fa-clipboard"></i>
                                    <h4>No orders found</h4>
                                    <p>You haven't received any orders yet.</p>
                                </div>
                            `;
                        }
                    })
                    .catch(err => {
                        console.error(err);
                        alert('Error deleting order. Please try again.');
                        document.getElementById('confirmationDialog').style.display = 'none';
                    });
                }
            });
        });
    </script>
</body>
</html>