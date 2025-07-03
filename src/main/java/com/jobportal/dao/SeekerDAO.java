package com.jobportal.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.jobportal.model.Seeker;

public class SeekerDAO {
    private final Connection conn;

    public SeekerDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Seeker> getAllSeekers() throws SQLException {
        return filterSeekers(null, null, "Available");
    }

    public List<Seeker> filterSeekers(String skills, String experience, String status) throws SQLException {
        StringBuilder query = new StringBuilder("SELECT * FROM applicant WHERE 1=1");
        List<String> params = new ArrayList<>();
        
        // Skills filter
        if (skills != null && !skills.trim().isEmpty()) {
            query.append(" AND skills LIKE ?");
            params.add("%" + skills.trim() + "%");
        }
        
        // Experience filter
        if (experience != null && !experience.equals("Any")) {
            switch(experience) {
                case "0-2":
                    query.append(" AND experience BETWEEN 0 AND 2");
                    break;
                case "2-5":
                    query.append(" AND experience BETWEEN 2 AND 5");
                    break;
                case "5+":
                    query.append(" AND experience > 5");
                    break;
            }
        }
        
        // Status filter (default to Available if not specified)
        if (status == null || status.equals("Any")) {
            query.append(" AND status = 'Available'");
        } else {
            query.append(" AND status = ?");
            params.add(status);
        }
        
        List<Seeker> seekers = new ArrayList<>();
        
        try (PreparedStatement stmt = conn.prepareStatement(query.toString())) {
            // Set parameters
            for (int i = 0; i < params.size(); i++) {
                stmt.setString(i + 1, params.get(i));
            }
            
            // Execute query
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    seekers.add(mapSeekerFromResultSet(rs));
                }
            }
        }
        return seekers;
    }

    public boolean updateSeekerStatus(int seekerId, String status) throws SQLException {
        String sql = "UPDATE applicant SET status = ? WHERE id = ?";
        
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, seekerId);
            
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }

    private Seeker mapSeekerFromResultSet(ResultSet rs) throws SQLException {
        return new Seeker(
            rs.getInt("id"),
            rs.getString("full_name"),
            rs.getString("email"),
            rs.getString("skills"),
            rs.getInt("experience"),
            rs.getString("profile_picture"),
            rs.getString("about"),
            rs.getString("resume_link"),
            rs.getString("status")
        );
    }
}