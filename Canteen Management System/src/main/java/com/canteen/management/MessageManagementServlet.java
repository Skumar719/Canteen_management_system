package com.canteen.management;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/MessageManagementServlet")
public class MessageManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database configuration - update these values for your environment
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/cms";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";
    
    // Message model class as inner class
    public class Message {
        private int id;
        private String name;
        private String email;
        private String subject;
        private String message;
        private Timestamp createdAt;
        private String status;
        
        // Getters and Setters
        public int getId() { return id; }
        public void setId(int id) { this.id = id; }
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public String getSubject() { return subject; }
        public void setSubject(String subject) { this.subject = subject; }
        public String getMessage() { return message; }
        public void setMessage(String message) { this.message = message; }
        public Timestamp getCreatedAt() { return createdAt; }
        public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        try {
            if (action == null) {
                listMessages(request, response);
            } else {
                switch (action) {
                    case "view":
                        viewMessage(request, response);
                        break;
                    case "markAsRead":
                        markAsRead(request, response);
                        break;
                    case "delete":
                        deleteMessage(request, response);
                        break;
                    default:
                        listMessages(request, response);
                        break;
                }
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Handle form submission from contact page
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String subject = request.getParameter("subject");
        String messageContent = request.getParameter("message");
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish connection
            conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            
            // Prepare SQL statement
            String sql = "INSERT INTO messages (name, email, subject, message) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, subject);
            stmt.setString(4, messageContent);
            
            // Execute query
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                response.sendRedirect("contact.jsp?status=success");
            } else {
                response.sendRedirect("contact.jsp?status=error");
            }
            
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("contact.jsp?status=error");
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    // DAO methods
    private List<Message> getAllMessages() throws SQLException {
        List<Message> messages = new ArrayList<>();
        String sql = "SELECT * FROM messages ORDER BY created_at DESC";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Message message = new Message();
                message.setId(rs.getInt("id"));
                message.setName(rs.getString("name"));
                message.setEmail(rs.getString("email"));
                message.setSubject(rs.getString("subject"));
                message.setMessage(rs.getString("message"));
                message.setCreatedAt(rs.getTimestamp("created_at"));
                message.setStatus(rs.getString("status"));
                messages.add(message);
            }
        }
        return messages;
    }
    
    private Message getMessageById(int id) throws SQLException {
        String sql = "SELECT * FROM messages WHERE id = ?";
        Message message = null;
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    message = new Message();
                    message.setId(rs.getInt("id"));
                    message.setName(rs.getString("name"));
                    message.setEmail(rs.getString("email"));
                    message.setSubject(rs.getString("subject"));
                    message.setMessage(rs.getString("message"));
                    message.setCreatedAt(rs.getTimestamp("created_at"));
                    message.setStatus(rs.getString("status"));
                }
            }
        }
        return message;
    }
    
    private boolean updateMessageStatus(int id, String status) throws SQLException {
        String sql = "UPDATE messages SET status = ? WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            stmt.setInt(2, id);
            return stmt.executeUpdate() > 0;
        }
    }
    
    private boolean deleteMessage(int id) throws SQLException {
        String sql = "DELETE FROM messages WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }
    
    // Handler methods
    private void listMessages(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<Message> messages = getAllMessages();
        request.setAttribute("messages", messages);
        request.getRequestDispatcher("messages.jsp").forward(request, response);
    }
    
    private void viewMessage(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Message message = getMessageById(id);
        
        // Mark as read when viewing
        if (message != null && "unread".equals(message.getStatus())) {
            updateMessageStatus(id, "read");
            message.setStatus("read");
        }
        
        request.setAttribute("message", message);
        request.getRequestDispatcher("view_message.jsp").forward(request, response);
    }
    
    private void markAsRead(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        updateMessageStatus(id, "read");
        response.sendRedirect("MessageManagementServlet");
    }
    
    private void deleteMessage(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        deleteMessage(id);
        response.sendRedirect("MessageManagementServlet");
    }
}