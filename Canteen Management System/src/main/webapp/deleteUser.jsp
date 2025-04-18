<%@ page import="java.sql.*" %>
<%
// Get the user ID to delete
String userId = request.getParameter("userId");

if (userId != null && !userId.isEmpty()) {
    // Database connection parameters
    String dbUrl = "jdbc:mysql://localhost:3306/cms";
    String dbUser = "root"; // Change to your username
    String dbPass = ""; // Change to your password
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    
    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish connection
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        
        // Prepare delete statement
        String sql = "DELETE FROM users WHERE Id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(userId));
        
        // Execute delete
        int rowsAffected = pstmt.executeUpdate();
        
        if (rowsAffected > 0) {
            // Redirect back to user management page with success message
            response.sendRedirect("user_management.jsp?success=User deleted successfully");
        } else {
            // Redirect back with error message
            response.sendRedirect("user_management.jsp?error=User not found");
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Redirect back with error message
        response.sendRedirect("user_management.jsp?error=Error deleting user: " + e.getMessage());
    } finally {
        // Close resources
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
} else {
    // Redirect back with error message
    response.sendRedirect("user_management.jsp?error=Invalid user ID");
}
%>