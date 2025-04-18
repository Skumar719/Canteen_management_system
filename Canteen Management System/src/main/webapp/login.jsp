<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Canteen Management System - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.cdnfonts.com/css/black-chancery" rel="stylesheet">
    <style>
        body {
            font-family: 'Black Chancery', cursive;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
        .login-container h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }
        .btn-primary {
            background-color: #ff6f61;
            border-color: #ff6f61;
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-weight: bold;
        }
        .btn-primary:hover {
            background-color: #e05f52;
        }
        .signup-link {
            text-align: center;
            margin-top: 20px;
        }
        .alert {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Canteen Login</h2>

        <!-- Error Message -->
        <% String error = request.getParameter("error");
           if ("true".equals(error)) { %>
            <div class="alert alert-danger" role="alert">
                Incorrect email or password. Please try again.
            </div>
        <% } %>

        <form action="LoginServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>

        <div class="signup-link">
            Don't have an account? <a href="register.jsp">Sign Up</a>
        </div>
        <div class="signup-link">
            <a href="forgetpass.jsp">Forgot Password</a>
        </div>

    </div>
</body>
</html>
