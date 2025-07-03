package com.jobportal.dao;

import com.jobportal.model.Job;
import java.sql.*;
import java.util.*;

public class JobDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/hirearchydb";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "password";
    

    public boolean addJob(Job job) throws ClassNotFoundException {
        String sql = "INSERT INTO job_postings (job_title, company_name, location, employment_type, salary_range, job_description, requirements, preferred_qualifications, industry, department, experience_level, skills_required, education_required, benefits, application_deadline, posting_date, contact_email, application_link, company_website, additional_info) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (	
        		Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, job.getJobTitle());
            stmt.setString(2, job.getCompanyName());
            stmt.setString(3, job.getLocation());
            stmt.setString(4, job.getEmploymentType());
            stmt.setString(5, job.getSalaryRange());
            stmt.setString(6, job.getJobDescription());
            stmt.setString(7, job.getRequirements());
            stmt.setString(8, job.getPreferredQualifications());
            stmt.setString(9, job.getIndustry());
            stmt.setString(10, job.getDepartment());
            stmt.setString(11, job.getExperienceLevel());
            stmt.setString(12, job.getSkillsRequired());
            stmt.setString(13, job.getEducationRequired());
            stmt.setString(14, job.getBenefits());
            stmt.setDate(15, job.getApplicationDeadline());
            stmt.setDate(16, job.getPostingDate());
            stmt.setString(17, job.getContactEmail());
            stmt.setString(18, job.getApplicationLink());
            stmt.setString(19, job.getCompanyWebsite());
            stmt.setString(20, job.getAdditionalInfo());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateJob(Job job) {
        String sql = "UPDATE  job_postings SET job_title=?, company_name=?, location=?, employment_type=?, salary_range=?, job_description=?, requirements=?, preferred_qualifications=?, industry=?, department=?, experience_level=?, skills_required=?, education_required=?, benefits=?, application_deadline=?, posting_date=?, contact_email=?, application_link=?, company_website=?, additional_info=? WHERE job_id=?";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, job.getJobTitle());
            stmt.setString(2, job.getCompanyName());
            stmt.setString(3, job.getLocation());
            stmt.setString(4, job.getEmploymentType());
            stmt.setString(5, job.getSalaryRange());
            stmt.setString(6, job.getJobDescription());
            stmt.setString(7, job.getRequirements());
            stmt.setString(8, job.getPreferredQualifications());
            stmt.setString(9, job.getIndustry());
            stmt.setString(10, job.getDepartment());
            stmt.setString(11, job.getExperienceLevel());
            stmt.setString(12, job.getSkillsRequired());
            stmt.setString(13, job.getEducationRequired());
            stmt.setString(14, job.getBenefits());
            stmt.setDate(15, job.getApplicationDeadline());
            stmt.setDate(16, job.getPostingDate());
            stmt.setString(17, job.getContactEmail());
            stmt.setString(18, job.getApplicationLink());
            stmt.setString(19, job.getCompanyWebsite());
            stmt.setString(20, job.getAdditionalInfo());
            stmt.setInt(21, job.getJobId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Job> getAllJobs() throws ClassNotFoundException {
        List<Job> jobs = new ArrayList<>();
        String sql = "SELECT * FROM job_postings";  // Simple query to get all job postings

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Job job = extractJobFromResultSet(rs);
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobs;
    }


    private Job extractJobFromResultSet(ResultSet rs) throws SQLException {
        Job job = new Job();
        job.setJobId(rs.getInt("job_id"));
        job.setJobTitle(rs.getString("job_title"));
        job.setCompanyName(rs.getString("company_name"));
        job.setLocation(rs.getString("location"));
        job.setEmploymentType(rs.getString("employment_type"));
        job.setSalaryRange(rs.getString("salary_range"));
        job.setJobDescription(rs.getString("job_description"));
        job.setRequirements(rs.getString("requirements"));
        job.setPreferredQualifications(rs.getString("preferred_qualifications"));
        job.setIndustry(rs.getString("industry"));
        job.setDepartment(rs.getString("department"));
        job.setExperienceLevel(rs.getString("experience_level"));
        job.setSkillsRequired(rs.getString("skills_required"));
        job.setEducationRequired(rs.getString("education_required"));
        job.setBenefits(rs.getString("benefits"));
        job.setApplicationDeadline(rs.getDate("application_deadline"));
        job.setPostingDate(rs.getDate("posting_date"));
        job.setContactEmail(rs.getString("contact_email"));
        job.setApplicationLink(rs.getString("application_link"));
        job.setCompanyWebsite(rs.getString("company_website"));
        job.setAdditionalInfo(rs.getString("additional_info"));
        return job;
    }
    
    public List<Job> searchJobs(String keyword, String location) throws ClassNotFoundException {
        List<Job> jobs = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM job_postings WHERE 1=1");

        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND (job_title LIKE ? OR company_name LIKE ? OR industry LIKE ?)");
        }
        if (location != null && !location.trim().isEmpty()) {
            sql.append(" AND location LIKE ?");
        }

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            int paramIndex = 1;

            if (keyword != null && !keyword.trim().isEmpty()) {
                String likeKeyword = "%" + keyword + "%";
                stmt.setString(paramIndex++, likeKeyword);
                stmt.setString(paramIndex++, likeKeyword);
                stmt.setString(paramIndex++, likeKeyword);
            }

            if (location != null && !location.trim().isEmpty()) {
                String likeLocation = "%" + location + "%";
                stmt.setString(paramIndex++, likeLocation);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Job job = extractJobFromResultSet(rs);
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return jobs;
    }
    
    public List<Job> getRandomJobs(int count) throws ClassNotFoundException {
        List<Job> jobs = new ArrayList<>();
        String sql = "SELECT * FROM job_postings ORDER BY RAND() LIMIT ?";

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, count);  // Set the limit for the random job count

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Job job = extractJobFromResultSet(rs);
                jobs.add(job);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return jobs;
    }
    public Job getJobById(int jobId) throws ClassNotFoundException {
        String sql = "SELECT * FROM job_postings WHERE job_id = ?";
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, jobId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return extractJobFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
