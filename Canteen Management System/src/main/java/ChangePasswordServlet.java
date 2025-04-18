import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cms";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Handle non-ASCII passwords
        response.setContentType("text/html;charset=UTF-8");

        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.getWriter().println("User not logged in.");
            return;
        }

        String currentPassword = request.getParameter("current_password");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!newPassword.equals(confirmPassword)) {
            response.getWriter().println("New passwords do not match!");
            return;
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS)) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            checkStmt.setString(1, username);
            checkStmt.setString(2, currentPassword);
            ResultSet rs = checkStmt.executeQuery();

            if (!rs.next()) {
                response.getWriter().println("Current password is incorrect!");
                return;
            }

            PreparedStatement updateStmt = conn.prepareStatement("UPDATE users SET password=? WHERE username=?");
            updateStmt.setString(1, newPassword);
            updateStmt.setString(2, username);
            int rowsUpdated = updateStmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.getWriter().println("Password changed successfully!");
            } else {
                response.getWriter().println("Failed to change password!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error!");
        }
    }
}
