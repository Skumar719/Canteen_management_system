import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection parameters
    private String dbURL = "jdbc:mysql://localhost:3306/cms";
    private String dbUser = "root";
    private String dbPass = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
        
        Connection conn = null;
        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to database
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            
            // SQL query to insert message
            String sql = "INSERT INTO messages (name, email, subject, message) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, subject);
            statement.setString(4, message);
            
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                // Success - redirect to thank you page or back with success message
                response.sendRedirect("contact.jsp?status=success");
            } else {
                response.sendRedirect("contact.jsp?status=error");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("contact.jsp?status=error");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    }
}