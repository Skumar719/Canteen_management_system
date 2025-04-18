<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #f8f9fc;
            --accent-color: #2e59d9;
            --text-dark: #5a5c69;
            --text-light: #858796;
            --success-color: #1cc88a;
            --warning-color: #f6c23e;
            --danger-color: #e74a3b;
        }
        
        body {
            background-color: var(--secondary-color);
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            color: var(--text-dark);
        }
        
        .dashboard-container {
            padding: 0;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            background: linear-gradient(180deg, var(--primary-color) 0%, var(--accent-color) 100%);
            color: white;
            height: 100vh;
            position: fixed;
            width: 250px;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            transition: all 0.3s;
            z-index: 1000;
        }
        
        .sidebar-brand {
            height: 4.375rem;
            text-decoration: none;
            font-size: 1.2rem;
            font-weight: 800;
            padding: 1.5rem 1rem;
            text-align: center;
            letter-spacing: 0.05rem;
            z-index: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .sidebar-brand-icon {
            font-size: 1.5rem;
            margin-right: 0.5rem;
        }
        
        .sidebar-divider {
            border-top: 1px solid rgba(255, 255, 255, 0.15);
            margin: 0 1rem 1rem;
        }
        
        .nav-item .nav-link {
            color: rgba(255, 255, 255, 0.8);
            padding: 0.75rem 1rem;
            margin: 0 0.5rem;
            border-radius: 0.35rem;
            display: flex;
            align-items: center;
            white-space: nowrap;
        }
        
        .nav-item .nav-link i {
            margin-right: 0.5rem;
            font-size: 0.85rem;
        }
        
        .nav-item .nav-link:hover {
            color: white;
            background-color: rgba(255, 255, 255, 0.1);
        }
        
        .nav-item .nav-link.active {
            color: white;
            background-color: rgba(255, 255, 255, 0.2);
            font-weight: 700;
        }
        
        /* Main Content Styles */
        .main-content {
            margin-left: 250px;
            width: calc(100% - 250px);
            min-height: 100vh;
            padding: 1.5rem;
            transition: margin-left 0.3s;
        }
        
        /* Topbar Styles */
        .topbar {
            height: 4.375rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            background-color: white;
            border-radius: 0.35rem;
            padding: 0 1.5rem;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .topbar .dropdown {
            position: relative;
        }
        
        .topbar .dropdown-toggle {
            display: flex;
            align-items: center;
            color: var(--text-dark);
            font-weight: 600;
            text-decoration: none;
        }
        
        .topbar .dropdown-toggle img {
            height: 2rem;
            width: 2rem;
            border-radius: 50%;
            margin-right: 0.5rem;
        }
        
        /* Card Styles */
        .card {
            border: none;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            margin-bottom: 1.5rem;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 1.5rem 0 rgba(58, 59, 69, 0.2);
        }
        
        .card-header {
            background-color: #f8f9fc;
            border-bottom: 1px solid #e3e6f0;
            padding: 1rem 1.35rem;
            font-weight: 700;
            color: var(--text-dark);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        /* Table Styles */
        .table-responsive {
            border-radius: 0.35rem;
            overflow: hidden;
        }
        
        .table {
            margin-bottom: 0;
        }
        
        .table thead th {
            background-color: #f8f9fc;
            color: var(--text-dark);
            font-weight: 700;
            border-bottom-width: 1px;
        }
        
        .table-hover tbody tr:hover {
            background-color: rgba(0, 0, 0, 0.02);
        }
        
        /* Button Styles */
        .btn-danger {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }
        
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
        
        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }
        
        /* Alert Styles */
        .alert {
            margin-bottom: 1rem;
            border-radius: 0.35rem;
        }
        
        /* Responsive Styles */
        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                overflow: hidden;
            }
            
            .main-content {
                margin-left: 0;
                width: 100%;
            }
            
            .sidebar-toggle {
                display: block !important;
            }
        }
        
        /* Sidebar Toggle Button */
        .sidebar-toggle {
            position: fixed;
            bottom: 20px;
            right: 20px;
            z-index: 999;
            display: none;
        }
    </style>
</head>
<body>
    <div class="dashboard-container d-flex">
        <div class="sidebar">
            <a class="sidebar-brand text-white" href="#">
                <i class="sidebar-brand-icon bi bi-shop"></i>
                <span>QuickBite</span>
            </a>
            <hr class="sidebar-divider">
            <div class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link" href="view_order.jsp">
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
                    <a class="nav-link active" href="user_management.jsp">
                        <i class="bi bi-people"></i>
                        <span>Customers</span>
                    </a>
                </li>
            
            </div>
        </div>

        <div class="main-content">
            <div class="topbar">
                <div>
                    <h5 class="mb-0">Customer Management</h5>
                    <small class="text-muted">Last login: Today at <%= new java.text.SimpleDateFormat("h:mm a").format(new java.util.Date()) %></small>
                </div>
                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" role="button" id="userDropdown" data-bs-toggle="dropdown">
                        <img src="https://ui-avatars.com/api/?name=Admin&background=4e73df&color=fff" alt="Admin">
                        <span>Admin User</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="admin_userprofile.jsp"><i class="bi bi-person me-2"></i>Profile</a></li>
                       
                        <li><hr class="dropdown-divider"></li>
                     
                    </ul>
                </div>
            </div>

            <%-- Display success/error messages --%>
            <%
            String success = request.getParameter("success");
            String error = request.getParameter("error");
            if (success != null) {
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <%= success %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
            }
            if (error != null) {
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <%= error %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <%
            }
            %>

            <div class="card">
                <div class="card-header">
                    <h6 class="m-0 font-weight-bold">Registered Customers</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead class="thead-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Username</th>
                                    <th>Email</th>
                                    <th>Full Name</th>
                                    <th>Registration Date</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                // Database connection parameters
                                String dbUrl = "jdbc:mysql://localhost:3306/cms";
                                String dbUser = "root"; // Change to your username
                                String dbPass = ""; // Change to your password
                                
                                Connection conn = null;
                                Statement stmt = null;
                                ResultSet rs = null;
                                
                                try {
                                    // Load JDBC driver
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    
                                    // Establish connection
                                    conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                                    
                                    // Create statement
                                    stmt = conn.createStatement();
                                    
                                    // SQL query to fetch users
                                    String sql = "SELECT * FROM users ORDER BY created_at DESC";
                                    rs = stmt.executeQuery(sql);
                                    
                                    // Process results
                                    while (rs.next()) {
                                        int id = rs.getInt("Id");
                                        String username = rs.getString("username");
                                        String email = rs.getString("email");
                                        String fullName = rs.getString("full_name");
                                        Timestamp createdAt = rs.getTimestamp("created_at");
                                %>
                                <tr>
                                    <td><%= id %></td>
                                    <td><%= username %></td>
                                    <td><%= email %></td>
                                    <td><%= fullName != null ? fullName : "N/A" %></td>
                                    <td><%= new java.text.SimpleDateFormat("MMM dd, yyyy hh:mm a").format(createdAt) %></td>
                                    <td>
                                        <form method="post" action="deleteUser.jsp" style="display: inline;">
                                            <input type="hidden" name="userId" value="<%= id %>">
                                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this user?');">
                                                <i class="bi bi-trash"></i> Remove
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    // Close resources
                                    try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    try { if (stmt != null) stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                    try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                                }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button class="btn btn-primary sidebar-toggle d-lg-none">
        <i class="bi bi-list"></i>
    </button>

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