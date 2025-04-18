<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.canteen.management.MessageManagementServlet.Message, java.util.List" %>
<%
    List<Message> messages = (List<Message>) request.getAttribute("messages");
    int unreadCount = 0;
    if (messages != null) {
        for (Message msg : messages) {
            if ("unread".equals(msg.getStatus())) {
                unreadCount++;
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Message Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
        }
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            background-color: #343a40;
            color: #fff;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }
        .content {
            margin-left: 250px;
            padding: 30px;
        }
        .message-card {
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        .unread-row {
            background-color: #f0f8ff;
            font-weight: bold;
        }
        .badge-unread {
            background-color: #dc3545;
        }
        .profile-img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #fff;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="text-center mb-4">
            <img src="images/admin_profile.jpg" alt="Admin" class="profile-img mb-2">
            <h5 class="text-white">Admin Name</h5>
        </div>
        <nav class="nav flex-column">
            <a class="nav-link text-white" href="dashboard.jsp">
                <i class="bi bi-speedometer2 me-2"></i> Dashboard
            </a>
            <a class="nav-link text-white" href="manage_menu.jsp">
                <i class="bi bi-menu-button-wide me-2"></i> Manage Menu
            </a>
            <a class="nav-link text-white" href="orders.jsp">
                <i class="bi bi-cart me-2"></i> Orders
            </a>
            <a class="nav-link active bg-danger" href="MessageManagementServlet">
                <i class="bi bi-envelope me-2"></i> Messages
                <% if (unreadCount > 0) { %>
                    <span class="badge badge-unread rounded-pill float-end"><%= unreadCount %></span>
                <% } %>
            </a>
            <a class="nav-link text-white" href="settings.jsp">
                <i class="bi bi-gear me-2"></i> Settings
            </a>
            <a class="nav-link text-white mt-3" href="logout.jsp">
                <i class="bi bi-box-arrow-right me-2"></i> Logout
            </a>
        </nav>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2><i class="bi bi-envelope me-2"></i> Customer Messages</h2>
            <a href="MessageManagementServlet?action=markAllAsRead" class="btn btn-outline-primary">
                <i class="bi bi-check-all me-1"></i> Mark All as Read
            </a>
        </div>

        <div class="card message-card">
            <div class="card-body">
                <% if (messages != null && !messages.isEmpty()) { %>
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>From</th>
                                    <th>Subject</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Message msg : messages) { %>
                                    <tr class="<%= "unread".equals(msg.getStatus()) ? "unread-row" : "" %>">
                                        <td><%= msg.getName() %></td>
                                        <td>
                                            <a href="MessageManagementServlet?action=view&id=<%= msg.getId() %>">
                                                <%= msg.getSubject() %>
                                            </a>
                                        </td>
                                        <td><%= msg.getCreatedAt() %></td>
                                        <td>
                                            <span class="badge <%= "unread".equals(msg.getStatus()) ? "bg-warning" : "bg-success" %>">
                                                <%= msg.getStatus() %>
                                            </span>
                                        </td>
                                        <td>
                                            <a href="MessageManagementServlet?action=view&id=<%= msg.getId() %>" 
                                               class="btn btn-sm btn-outline-primary me-1">
                                                <i class="bi bi-eye"></i> View
                                            </a>
                                            <a href="MessageManagementServlet?action=delete&id=<%= msg.getId() %>" 
                                               class="btn btn-sm btn-outline-danger"
                                               onclick="return confirm('Are you sure you want to delete this message?');">
                                                <i class="bi bi-trash"></i> Delete
                                            </a>
                                        </td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                <% } else { %>
                    <div class="alert alert-info">No messages found.</div>
                <% } %>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>