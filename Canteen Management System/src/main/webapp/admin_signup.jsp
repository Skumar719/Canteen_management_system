<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Sign Up</title>
    <style>
        /* Base Styles */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ff8e8e;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: #333;
        }

        /* Container Styles */
        .signup-container {
            background-color: white;
            padding: 2.5rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        /* Header Styles */
        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #d32f2f;
        }

        /* Form Styles */
        .signup-form {
            display: flex;
            flex-direction: column;
        }

        /* Input Field Styles */
        .form-group {
            margin-bottom: 1.2rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-group input:focus {
            border-color: #d32f2f;
            outline: none;
            box-shadow: 0 0 0 3px rgba(211, 47, 47, 0.2);
        }

        /* Button Styles */
        .signup-button {
            background-color: #d32f2f;
            color: white;
            padding: 0.8rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 0.5rem;
        }

        .signup-button:hover {
            background-color: #b71c1c;
        }

        /* Link Styles */
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            color: #666;
        }

        .login-link a {
            color: #d32f2f;
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* Error Message Styles */
        .error-message {
            color: #d32f2f;
            background-color: #ffebee;
            padding: 0.8rem;
            border-radius: 5px;
            margin-bottom: 1.5rem;
            text-align: center;
            border: 1px solid #ef9a9a;
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Admin Registration</h2>
        
        <%-- Error Message --%>
        <% if(request.getParameter("error") != null) { %>
            <div class="error-message">
                <%= request.getParameter("error") %>
            </div>
        <% } %>
        
        <form class="signup-form" action="AdminRegisterServlet" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="full_name">Full Name</label>
                <input type="text" id="full_name" name="full_name" required>
            </div>
            
            <button type="submit" class="signup-button">Register</button>
        </form>
        
        <div class="login-link">
            Already have an account? <a href="admin_signin.jsp">Login here</a>
        </div>
    </div>
</body>
</html>