package com.jobportal.dao;

import com.jobportal.model.User;
import com.jobportal.model.Offer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OfferDAO {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hirearchydb";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "password";

    // Method to get complete seeker profile by ID
    public User getSeekerById(int seekerId) throws SQLException {
        String sql = "SELECT * FROM users WHERE id = ? AND role = 'SEEKER'";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, seekerId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                User seeker = new User();
                // Basic info
                seeker.setId(rs.getInt("id"));
                seeker.setFullName(rs.getString("full_name"));
                seeker.setEmail(rs.getString("email"));
                seeker.setProfilePhotoPath(rs.getString("profile_photo_path"));
                
                // Professional info
                seeker.setTitle(rs.getString("title"));
                seeker.setLocation(rs.getString("location"));
                seeker.setExperienceRange(rs.getString("experience_range"));
                seeker.setSpecialization(rs.getString("specialization"));
                
                // Additional details
                seeker.setProfessionalStatement(rs.getString("professional_statement"));
                seeker.setContactInstruction(rs.getString("contact_instruction"));
                seeker.setAddress(rs.getString("address"));
                seeker.setWorkStatus(rs.getString("workstatus"));
                seeker.setMobile(rs.getString("mobile"));
                seeker.setProfessionalTitles(rs.getString("professional_titles"));
                
                return seeker;
            }
        }
        return null;
    }

    // Method to save a new offer (updated to match your schema)
    public boolean saveOffer(Offer offer) {
        String sql = "INSERT INTO offers (employer_id, seeker_id, subject, message, status) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, offer.getEmployerId());
            stmt.setInt(2, offer.getSeekerId());
            stmt.setString(3, offer.getSubject());
            stmt.setString(4, offer.getMessage());
            stmt.setString(5, offer.getStatus()); // Default 'pending'
            
            int affectedRows = stmt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        offer.setOfferId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to get seeker's email by ID
    public String getSeekerEmail(int seekerId) {
        String sql = "SELECT email FROM users WHERE id = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, seekerId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("email");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Method to get all offers for a seeker with employer details
    public List<Offer> getOffersBySeeker(int seekerId) {
        List<Offer> offers = new ArrayList<>();
        String sql = "SELECT o.*, u.full_name as employer_name, u.company_name, u.profile_photo_path as employer_photo " +
                     "FROM offers o JOIN users u ON o.employer_id = u.id " +
                     "WHERE o.seeker_id = ? ORDER BY o.sent_date DESC";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, seekerId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Offer offer = mapOfferFromResultSet(rs);
                    offer.setEmployerName(rs.getString("employer_name"));
                    offer.setCompanyName(rs.getString("company_name"));
                    offer.setEmployerPhoto(rs.getString("employer_photo"));
                    offers.add(offer);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return offers;
    }

    // Method to get offers sent by an employer with seeker details
    public List<Offer> getOffersByEmployer(int employerId) {
        List<Offer> offers = new ArrayList<>();
        String sql = "SELECT o.*, u.full_name as seeker_name, u.profile_photo_path as seeker_photo, " +
                     "u.title as seeker_title, u.experience_range as seeker_experience " +
                     "FROM offers o JOIN users u ON o.seeker_id = u.id " +
                     "WHERE o.employer_id = ? ORDER BY o.sent_date DESC";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, employerId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Offer offer = mapOfferFromResultSet(rs);
                    offer.setSeekerName(rs.getString("seeker_name"));
                    offer.setSeekerPhoto(rs.getString("seeker_photo"));
                    offer.setSeekerTitle(rs.getString("seeker_title"));
                    offer.setSeekerExperience(rs.getString("seeker_experience"));
                    offers.add(offer);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return offers;
    }

    // Helper method to map ResultSet to Offer object
    private Offer mapOfferFromResultSet(ResultSet rs) throws SQLException {
        Offer offer = new Offer();
        offer.setOfferId(rs.getInt("offer_id"));
        offer.setEmployerId(rs.getInt("employer_id"));
        offer.setSeekerId(rs.getInt("seeker_id"));
        offer.setSubject(rs.getString("subject"));
        offer.setMessage(rs.getString("message"));
        offer.setSentDate(rs.getTimestamp("sent_date"));
        offer.setStatus(rs.getString("status"));
        return offer;
    }

    // Method to update offer status
    public boolean updateOfferStatus(int offerId, String status) {
        String sql = "UPDATE offers SET status = ? WHERE offer_id = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, status);
            stmt.setInt(2, offerId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get a specific offer by ID with full details
    public Offer getOfferById(int offerId) {
        String sql = "SELECT o.*, " +
                     "e.full_name as employer_name, e.company_name, e.profile_photo_path as employer_photo, " +
                     "s.full_name as seeker_name, s.profile_photo_path as seeker_photo, " +
                     "s.title as seeker_title, s.experience_range as seeker_experience " +
                     "FROM offers o " +
                     "JOIN users e ON o.employer_id = e.id " +
                     "JOIN users s ON o.seeker_id = s.id " +
                     "WHERE o.offer_id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, offerId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Offer offer = mapOfferFromResultSet(rs);
                    // Employer details
                    offer.setEmployerName(rs.getString("employer_name"));
                    offer.setCompanyName(rs.getString("company_name"));
                    offer.setEmployerPhoto(rs.getString("employer_photo"));
                    // Seeker details
                    offer.setSeekerName(rs.getString("seeker_name"));
                    offer.setSeekerPhoto(rs.getString("seeker_photo"));
                    offer.setSeekerTitle(rs.getString("seeker_title"));
                    offer.setSeekerExperience(rs.getString("seeker_experience"));
                    return offer;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}