package dal;

import domain.User;
import java.sql.*;

public class UserDAO {

    private Connection conn;

    public UserDAO() throws Exception {
        conn = new DBContext().getConnection(); // Assuming DBContext provides the connection
    }

    public User login(String email, String password) {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("role"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getDate("birthday"),
                        rs.getTimestamp("created_at")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserByEmail(String email) {
        String sql = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("email"),
                            rs.getString("role"),
                            rs.getString("phone"),
                            rs.getString("address"),
                            rs.getDate("birthday"),
                            rs.getTimestamp("created_at")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean register(String email, String password, String role, String phone, String address, Date birthday) {
        String sql = "INSERT INTO users (email, password, role, phone, address, birthday) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, role);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setDate(6, birthday);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateUserProfile(User user) {
        String sql = "UPDATE users SET phone = ?, address = ?, birthday = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getPhone());
            ps.setString(2, user.getAddress());
            ps.setDate(3, user.getBirthday());
            ps.setInt(4, user.getId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
