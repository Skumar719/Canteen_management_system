import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminLogoutServlet")
public class AdminLogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get the current session (don't create if it doesn't exist)
        HttpSession session = request.getSession(false);
        
        try {
            // If session exists, invalidate it
            if (session != null) {
                String adminName = (String) session.getAttribute("adminName");
                session.invalidate();
                
                // Log the logout action (optional)
                System.out.println("Admin '" + adminName + "' has logged out.");
            }
            
            // Set cache control headers to prevent back button access after logout
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0
            response.setDateHeader("Expires", 0); // Proxies
            
            // Redirect to login page with success message
            response.sendRedirect("admin_signin.jsp?msg=You have been logged out successfully");
            
        } catch (Exception e) {
            // Log any errors
            System.err.println("Error during logout: " + e.getMessage());
            
            // Redirect to error page or login page with error message
            response.sendRedirect("admin_signin.jsp?error=Error during logout. Please try again.");
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // For POST requests, just call doGet
        doGet(request, response);
    }
}