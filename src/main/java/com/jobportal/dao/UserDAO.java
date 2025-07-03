package com.jobportal.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.jobportal.model.User;

public class UserDAO {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hirearchydb";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "password";

    public User getUserProfile(int userId) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql = "SELECT * FROM users WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setRole(rs.getString("role"));
                    user.setStatus(rs.getString("status"));
                    user.setMobile(rs.getString("mobile"));
                    user.setWorkStatus(rs.getString("workstatus"));
                    user.setFullName(rs.getString("full_name"));
                    user.setTitle(rs.getString("title"));
                    user.setProfessionalTitles(rs.getString("professional_titles"));
                    user.setExperienceRange(rs.getString("experience_range"));
                    user.setLocation(rs.getString("location"));
                    user.setSpecialization(rs.getString("specialization"));
                    user.setContactInstruction(rs.getString("contact_instruction"));
                    user.setProfilePhotoPath(rs.getString("profile_photo_path"));
                    user.setLabPhotosPaths(rs.getString("lab_photos_paths"));
                    user.setProfessionalStatement(rs.getString("professional_statement"));
                    user.setAddress(rs.getString("address"));
                    user.setCompanyName(rs.getString("company_name"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateUserProfile(User user) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql = "UPDATE users SET " +
                     "full_name = ?, title = ?, professional_titles = ?, " +
                     "experience_range = ?, location = ?, specialization = ?, " +
                     "contact_instruction = ?, professional_statement = ?, address = ?, " +
                     "mobile = ?, work_status = ?, company_name = ? " +
                     "WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getTitle());
            stmt.setString(3, user.getProfessionalTitles());
            stmt.setString(4, user.getExperienceRange());
            stmt.setString(5, user.getLocation());
            stmt.setString(6, user.getSpecialization());
            stmt.setString(7, user.getContactInstruction());
            stmt.setString(8, user.getProfessionalStatement());
            stmt.setString(9, user.getAddress());
            stmt.setString(10, user.getMobile());
            stmt.setString(11, user.getWorkStatus());
            stmt.setString(12, user.getCompanyName());
            stmt.setInt(13, user.getId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProfilePicture(int userId, String imagePath) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql = "UPDATE users SET profile_photo_path = ? WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, imagePath);
            stmt.setInt(2, userId);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateLabPhotos(int userId, String imagesPath) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql = "UPDATE users SET lab_photos_paths = ? WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, imagesPath);
            stmt.setInt(2, userId);
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addUser(User user) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sql = "INSERT INTO users (name, email, password, role, status, company_name) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, user.getName());
                stmt.setString(2, user.getEmail());
                stmt.setString(3, user.getPassword());
                stmt.setString(4, user.getRole());
                stmt.setString(5, "pending");
                stmt.setString(6, user.getCompanyName());

                int rowsAffected = stmt.executeUpdate();
                return rowsAffected > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean isEmailExists(String email) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sql = "SELECT 1 FROM users WHERE email = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                try (ResultSet rs = stmt.executeQuery()) {
                    return rs.next();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User validateUser(String email, String password) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        User user = new User();
                        user.setId(rs.getInt("id"));
                        user.setName(rs.getString("name"));
                        user.setEmail(rs.getString("email"));
                        user.setPassword(rs.getString("password"));
                        user.setRole(rs.getString("role"));
                        user.setStatus(rs.getString("status"));
                        user.setCompanyName(rs.getString("company_name"));
                        return user;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getPendingUsers() throws SQLException, ClassNotFoundException {
        List<User> pendingUsers = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE status = 'pending'";
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
                user.setCompanyName(rs.getString("company_name"));
                pendingUsers.add(user);
            }
        }
        return pendingUsers;
    }

    public User getUserByEmail(String email) throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String sql = "SELECT * FROM users WHERE email = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                    user.setStatus(rs.getString("status"));
                    user.setCompanyName(rs.getString("company_name"));
                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateUserStatus(int userId, String status) throws SQLException {
        String sql = "UPDATE users SET status = ? WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, userId);
            return pstmt.executeUpdate() > 0;
        }
    }
}
