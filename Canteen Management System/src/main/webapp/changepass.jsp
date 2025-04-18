<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background: linear-gradient(to right, #ff7e5f, #feb47b);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .change-password-container {
            background: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="change-password-container">
        <h2>Change Password</h2>

        <form id="changePasswordForm" method="POST">
            <div class="mb-3">
                <label for="current_password" class="form-label">Current Password</label>
                <input type="password" class="form-control" id="current_password" name="current_password" required>
            </div>
            <div class="mb-3">
                <label for="new_password" class="form-label">New Password</label>
                <input type="password" class="form-control" id="new_password" name="new_password" required>
            </div>
            <div class="mb-3">
                <label for="confirm_password" class="form-label">Confirm New Password</label>
                <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
            </div>
            <button type="button" class="btn btn-primary" onclick="changePassword()">Change Password</button>
        </form>
    </div>

    <!-- Modal for messages -->
    <div class="modal fade" id="messageModal" tabindex="-1" aria-labelledby="messageModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="messageModalLabel">Message</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="messageContent">
                    <!-- Message will be inserted here dynamically -->
                </div>
            </div>
        </div>
    </div>

    <script>
        function changePassword() {
            var currentPassword = document.getElementById("current_password").value;
            var newPassword = document.getElementById("new_password").value;
            var confirmPassword = document.getElementById("confirm_password").value;

            if (!currentPassword || !newPassword || !confirmPassword) {
                showMessage("Please fill in all fields.");
                return;
            }

            if (newPassword !== confirmPassword) {
                showMessage("New password and confirm password do not match.");
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open("POST", "ChangePasswordServlet", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        showMessage(xhr.responseText);
                    } else {
                        showMessage("Error: Could not change password.");
                    }
                }
            };

            xhr.send(
                "current_password=" + encodeURIComponent(currentPassword) +
                "&new_password=" + encodeURIComponent(newPassword) +
                "&confirm_password=" + encodeURIComponent(confirmPassword)
            );
        }

        function showMessage(message) {
            document.getElementById("messageContent").innerHTML = message;
            var modal = new bootstrap.Modal(document.getElementById("messageModal"));
            modal.show();
        }
    </script>
</body>
</html>
