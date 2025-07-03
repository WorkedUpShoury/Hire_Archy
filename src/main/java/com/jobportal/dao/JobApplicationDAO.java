package com.jobportal.dao;

import com.jobportal.model.JobApplication;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class JobApplicationDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hirearchydb";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "password";

    public List<JobApplication> getAllApplications() throws SQLException {
        List<JobApplication> applications = new ArrayList<>();
        String sql = "SELECT ja.*, u.name as applicant_name, j.job_title, j.company_name " +
                     "FROM job_applications ja " +
                     "JOIN users u ON ja.applicant_id = u.id " +
                     "JOIN job_postings j ON ja.job_id = j.job_id";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                JobApplication app = new JobApplication();
                app.setId(rs.getInt("id"));
                app.setApplicantId(rs.getInt("applicant_id"));
                app.setJobId(rs.getInt("job_id"));
                app.setApplicantName(rs.getString("applicant_name"));
                app.setJobTitle(rs.getString("job_title"));
                app.setCompanyName(rs.getString("company_name"));
                app.setStatus(rs.getString("status"));
                applications.add(app);
            }
        }
        return applications;
    }

    public boolean updateApplicationStatus(int applicationId, String status) throws SQLException {
        String sql = "UPDATE job_applications SET status = ? WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, applicationId);
            return pstmt.executeUpdate() > 0;
        }
    }
}