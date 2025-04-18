<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Settings</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Black Chancery', cursive;
            margin: 0;
            padding: 0;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: #333;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            background-color: #343a40;
            color: #fff;
            padding-top: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            overflow-y: auto;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
        }

        .sidebar a {
            display: block;
            color: #fff;
            padding: 15px 20px;
            text-decoration: none;
            margin: 5px 0;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        /* Content */
        .content {
            flex: 1;
            margin-left: 250px;
            padding: 30px;
            background-color: #f8f9fa;
            overflow-y: auto;
        }

        .header {
            background-color: #ff6f61;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            margin-bottom: 30px;
        }

        /* Settings Section */
        .settings-section {
            margin-top: 30px;
            padding: 30px;
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .settings-section h3 {
            font-size: 24px;
            margin-bottom: 20px;
            color: #555;
        }

        .settings-section label {
            display: block;
            font-size: 16px;
            margin-bottom: 8px;
            color: #777;
        }

        .settings-section input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 8px;
            font-size: 16px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .settings-section input[type="password"]:focus {
            border-color: #80bdff;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
        }

        .save-button {
            padding: 12px 25px;
            background-color: green;
            color: white;
            text-align: center;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            border: none;
            transition: background-color 0.3s ease;
            display: block;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .save-button:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        /* Profile Section */
        .profile-section {
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
        }

        .profile-section img {
            width: 120px; /* Adjusted image width */
            height: 120px; /* Adjusted image height */
            border-radius: 50%;
            border: 3px solid #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 10px;
            object-fit: cover;
        }

        .profile-section p {
            font-size: 16px;
            color: #ddd;
            margin: 5px 0;
        }

        .edit-profile-btn {
            padding: 8px 16px;
            font-size: 14px;
            background-color: green;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .edit-profile-btn:hover {
            background-color: #0056b3;
        }

        /* Logout Link/Section */
        .logout-link {
            color: #f00;
            font-weight: bold;
            transition: color 0.3s ease;
            display: block;
            padding: 10px 0;
            margin: 10px 0;
            text-align: center;
        }

        .logout-link:hover {
            color: #a00;
        }

    </style>
</head>
<body>

    <div class="sidebar">
        <h2>Admin Panel</h2>

        <div class="profile-section">
            <img src="image/adminp.jpg" alt="Profile Image">
            <p>Admin Name</p>
            <button class="edit-profile-btn">Edit Profile</button>
        </div>

        <a href="dashboard.jsp">Dashboard</a>
        <a href="manage_menu.jsp">Manage Menu</a>
        <a href="view_orders.jsp">View Orders</a>
        <a href="user_management.jsp">User Management</a>
        <a href="settings.jsp">Settings</a>

        <a href="login.jsp" class="logout-link">Logout</a>

    </div>

    <div class="content">
        <div class="header">
            Settings
        </div>

        <div class="settings-section">
            <h3>Security Settings</h3>
            <label for="password">Change Password</label>
            <input type="password" id="password" placeholder="Enter New Password">

            <label for="confirm-password">Confirm Password</label>
            <input type="password" id="confirm-password" placeholder="Confirm New Password">

            <button class="save-button">Update Password</button>
        </div>
    </div>

</body>
</html>