<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.cdnfonts.com/css/black-chancery" rel="stylesheet">
    <style>
        /* ... (Your existing CSS styles) ... */
        body { /* Existing styles */
            font-family: 'Black Chancery', cursive;
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .forgot-password-container { /* Existing styles */
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
           .forgot-password-container h2 { /* Existing styles */
            text-align: center;
            margin-bottom: 30px;
            color: #343a40;
        }
         .form-group { /* Existing styles */
            margin-bottom: 20px;
        }

        .form-label { /* Existing styles */
            font-weight: bold;
            color: #555;
        }

        .form-control { /* Existing styles */
            border: 1px solid #ced4da;
            padding: 12px;
            border-radius: 8px;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .form-control:focus { /* Existing styles */
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .btn-primary { /* Existing styles */
            background-color: #ff6f61;
            border-color: #ff6f61;
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            font-weight: bold;
            transition: background-color 0.15s ease-in-out;
        }

        .btn-primary:hover { /* Existing styles */
            background-color: #e05f52;
            border-color: #e05f52;
        }
        .back-to-login { /* Existing styles */
            text-align: center;
            margin-top: 10px;
        }

        .back-to-login a { /* Existing styles */
            color: #007bff;
            text-decoration: none;
        }

        .back-to-login a:hover { /* Existing styles */
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="forgot-password-container">
        <h2>Forgot Password</h2>
        <form action="forgot_password_process.jsp" method="post">
            <div class="form-group">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <button type="submit" class="btn btn-primary">Reset Password</button>
        </form>
        <div class="back-to-login">
            <a href="login.jsp">Back to Login</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>