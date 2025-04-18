import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/AdminSignInServlet")
public class AdminSignInServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cms", "root", "");
            
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admins WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("admin_id", rs.getInt("id"));
                session.setAttribute("admin_name", rs.getString("full_name"));
                session.setAttribute("admin_email", rs.getString("email"));
                response.sendRedirect("view_order.jsp");
            } else {
                response.sendRedirect("admin_signin.jsp?error=Invalid+username+or+password");
            }
            
            rs.close();
            ps.close();
            con.close();
            
        } catch (Exception e) {
            response.sendRedirect("admin_signin.jsp?error=Database+error");
        }
    }
}