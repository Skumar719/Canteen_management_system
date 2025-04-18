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
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet") // Ensure this matches your form action
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/CMS"; // Your Database
    private static final String JDBC_USER = "root"; // Your DB Username
    private static final String JDBC_PASSWORD = ""; // Your DB Password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email"); // Get email instead of username
        String password = request.getParameter("password");

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection to database
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // SQL query to check if the user exists with the given email and password
            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password); // In a real app, hash passwords before comparing!

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Login successful, create session
                HttpSession session = request.getSession();
                session.setAttribute("email", email); // Store email in session
                session.setAttribute("username", rs.getString("username")); // Store username if needed
                response.sendRedirect("userdashboard.jsp"); // Redirect to user dashboard
            } else {
                // Invalid login, redirect to login.jsp with error message
                response.sendRedirect("login.jsp?error=true");
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any other errors and redirect to an error page or show a message
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
