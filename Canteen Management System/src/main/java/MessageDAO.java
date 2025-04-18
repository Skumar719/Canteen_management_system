import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {
    private String dbURL = "jdbc:mysql://localhost:3306/cms";
    private String dbUser = "root";
    private String dbPass = "";

    public List<Message> getAllMessages() throws SQLException {
        List<Message> messages = new ArrayList<>();
        
        String sql = "SELECT * FROM messages ORDER BY created_at DESC";
        
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                Message message = new Message();
                message.setId(resultSet.getInt("id"));
                message.setName(resultSet.getString("name"));
                message.setEmail(resultSet.getString("email"));
                message.setSubject(resultSet.getString("subject"));
                message.setMessage(resultSet.getString("message"));
                message.setCreatedAt(resultSet.getTimestamp("created_at"));
                message.setRead(resultSet.getBoolean("is_read"));
                message.setAdminNotes(resultSet.getString("admin_notes"));
                
                messages.add(message);
            }
        }
        
        return messages;
    }
    
    public Message getMessageById(int id) throws SQLException {
        Message message = null;
        
        String sql = "SELECT * FROM messages WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setInt(1, id);
            
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    message = new Message();
                    message.setId(resultSet.getInt("id"));
                    message.setName(resultSet.getString("name"));
                    message.setEmail(resultSet.getString("email"));
                    message.setSubject(resultSet.getString("subject"));
                    message.setMessage(resultSet.getString("message"));
                    message.setCreatedAt(resultSet.getTimestamp("created_at"));
                    message.setRead(resultSet.getBoolean("is_read"));
                    message.setAdminNotes(resultSet.getString("admin_notes"));
                }
            }
        }
        
        return message;
    }
    
    public void markAsRead(int id) throws SQLException {
        String sql = "UPDATE messages SET is_read = TRUE WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
    
    public void deleteMessage(int id) throws SQLException {
        String sql = "DELETE FROM messages WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }
    
    public void addAdminNotes(int id, String notes) throws SQLException {
        String sql = "UPDATE messages SET admin_notes = ? WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
             PreparedStatement statement = conn.prepareStatement(sql)) {
            
            statement.setString(1, notes);
            statement.setInt(2, id);
            statement.executeUpdate();
        }
    }
}