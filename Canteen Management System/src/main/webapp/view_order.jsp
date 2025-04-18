<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fa;
        }

        .dashboard-container {
            display: flex;
            height: 100vh;
            flex-wrap: nowrap;
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(to bottom, #3867e7, #2f57c5);
            color: white;
            padding-top: 20px;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            transition: width 0.3s ease;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            display: block;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover, .sidebar .active {
            background-color: rgba(0, 0, 0, 0.1);
        }

        .sidebar-brand {
            text-align: center;
            font-size: 20px;
            color: white;
            padding: 10px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .sidebar-divider {
            border-top: 1px solid #6c757d;
            margin: 10px 0;
        }

        .nav-item {
            list-style-type: none;
        }

        .main-content {
            margin-left: 250px;
            width: 100%;
            padding: 20px;
            transition: margin-left 0.3s ease;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #fff;
            padding: 15px 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .topbar h5 {
            margin: 0;
        }

        .dropdown-menu-end {
            right: 0;
            left: auto;
        }

        .dropdown img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 8px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                position: fixed;
                height: 100%;
            }

            .main-content {
                margin-left: 0;
            }

            .sidebar-toggle {
                display: block;
                position: fixed;
                top: 20px;
                right: 20px;
                z-index: 999;
                background-color: #3867e7;
                color: white;
                border: none;
                padding: 10px;
                font-size: 20px;
                border-radius: 5px;
            }

            .sidebar-toggle i {
                color: white;
            }

            .sidebar.active {
                width: 250px;
            }
        }

        .dropdown-menu {
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <a class="sidebar-brand text-white" href="#">
                <i class="sidebar-brand-icon bi bi-shop"></i>
                <span>QuickBite</span>
            </a>
            <hr class="sidebar-divider">
            <div class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="#">
                        <i class="bi bi-speedometer2"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
           
                <li class="nav-item">
                    <a class="nav-link" href="view_order.jsp">
                        <i class="bi bi-cart"></i>
                        <span>Orders</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="user_management.jsp">
                        <i class="bi bi-people"></i>
                        <span>Customers</span>
                    </a>
                </li>
                
            </div>
        </div>

        <div class="main-content">
            <div class="topbar">
                <div>
                    <h5 class="mb-0">View Orders</h5>
                    <small class="text-muted">Last login: Today at <%= new java.text.SimpleDateFormat("h:mm a").format(new java.util.Date()) %></small>
                </div>
                <div class="dropdown">
                    <button class="btn dropdown-toggle d-flex align-items-center p-0" type="button" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://ui-avatars.com/api/?name=Admin&background=3867e7&color=fff" alt="Admin">
                        <span class="ms-2">Admin User</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="admin_userprofile.jsp"><i class="bi bi-person me-2"></i>Profile</a></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Settings</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                    </ul>
                </div>
            </div>

            <!-- Main content here -->
            <%@ include file="view_orders.jsp" %>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Toggle sidebar on mobile
            const sidebarToggle = document.querySelector('.sidebar-toggle');
            const sidebar = document.querySelector('.sidebar');
            
            sidebarToggle.addEventListener('click', function() {
                sidebar.style.width = sidebar.style.width === '250px' ? '0' : '250px';
            });
            
            // Auto-dismiss alerts after 5 seconds
            setTimeout(() => {
                const alerts = document.querySelectorAll('.alert');
                alerts.forEach(alert => {
                    const bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                });
            }, 5000);
            
            // Close sidebar when clicking outside on mobile
            document.addEventListener('click', function(event) {
                if (window.innerWidth <= 768) {
                    if (!sidebar.contains(event.target) && !sidebarToggle.contains(event.target) && sidebar.style.width === '250px') {
                        sidebar.style.width = '0';
                    }
                }
            });
        });
    </script>
</body>
</html>