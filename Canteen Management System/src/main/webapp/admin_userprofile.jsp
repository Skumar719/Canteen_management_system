<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .profile-card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            padding: 30px;
        }
        
        .profile-header {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .profile-header h1 {
            margin: 0;
            font-size: 24px;
            font-weight: 600;
        }
        
        .profile-details {
            margin-top: 20px;
        }
        
        .detail-row {
            margin-bottom: 20px;
        }
        
        .detail-label {
            font-weight: 600;
            color: #7f8c8d;
            font-size: 14px;
            margin-bottom: 5px;
        }
        
        .detail-value {
            color: #2c3e50;
            font-size: 16px;
            padding: 8px 0;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .logout-btn {
            display: block;
            width: 100%;
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            margin-top: 30px;
            font-weight: 500;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }
        
        .logout-btn:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <div class="profile-card">
        <div class="profile-header">
            <h1>Profile Information</h1>
        </div>
        
        <div class="profile-details">
            <div class="detail-row">
                <div class="detail-label">Name</div>
                <div class="detail-value">${sessionScope.admin_name}</div>
            </div>
            
            <div class="detail-row">
                <div class="detail-label">Email</div>
                <div class="detail-value">${sessionScope.admin_email}</div>
            </div>
            
            <div class="detail-row">
                <div class="detail-label">User ID</div>
                <div class="detail-value">${sessionScope.admin_id}</div>
            </div>
        </div>
        
        <a href="AdminLogoutServlet" class="logout-btn">Logout</a>
    </div>
</body>
</html>