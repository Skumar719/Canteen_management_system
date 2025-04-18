import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/AdminRegisterServlet")
public class AdminRegisterServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullName = request.getParameter("full_name");

        try {
            // 1. Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // 2. Connect to database
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cms", "root", "");
            
            // 3. Check if username exists
            PreparedStatement check = con.prepareStatement(
                "SELECT * FROM admins WHERE username=?");
            check.setString(1, username);
            ResultSet rs = check.executeQuery();
            
            if (rs.next()) {
                response.getWriter().print("Username already exists");
                return;
            }
            
            // 4. Insert new admin
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO admins(username,password,email,full_name) VALUES(?,?,?,?)");
            ps.setString(1, username);
            ps.setString(2, password); // In real app, hash this password!
            ps.setString(3, email);
            ps.setString(4, fullName);
            
            ps.executeUpdate();
            
            // 5. Close connections
            ps.close();
            con.close();
            
            response.sendRedirect("admin_signin.jsp?msg=Registration+Successful");
            
        } catch (Exception e) {
            response.getWriter().print("Error: " + e.getMessage());
        }
    }
}