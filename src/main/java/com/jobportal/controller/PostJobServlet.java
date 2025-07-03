package com.jobportal.controller;

import com.jobportal.dao.JobDAO;
import com.jobportal.model.Job;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import org.json.JSONObject;

@WebServlet("/PostJob")
public class PostJobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JobDAO jobDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        jobDAO = new JobDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();
        HttpSession session = request.getSession();
        
        try {
            // Extract form parameters
            String jobTitle = request.getParameter("jobTitle");
            String companyName = request.getParameter("companyName");
            String location = request.getParameter("location");
            String employmentType = request.getParameter("employmentType");
            String salaryRange = request.getParameter("salaryRange");
            String jobDescription = request.getParameter("jobDescription");
            String requirements = request.getParameter("requirements");
            String preferredQualifications = request.getParameter("preferredQualifications");
            String contactEmail = request.getParameter("contactEmail");
            String jobCategory = request.getParameter("jobCategory");
            
            // Handle optional fields
            Date applicationDeadline = null;
            if (request.getParameter("applicationDeadline") != null && 
                !request.getParameter("applicationDeadline").isEmpty()) {
                applicationDeadline = Date.valueOf(request.getParameter("applicationDeadline"));
            }
            
            // Create Job object
            Job job = new Job();
            job.setJobTitle(jobTitle);
            job.setCompanyName(companyName);
            job.setLocation(location);
            job.setEmploymentType(employmentType);
            job.setSalaryRange(salaryRange);
            job.setJobDescription(jobDescription);
            job.setRequirements(requirements);
            job.setPreferredQualifications(preferredQualifications);
            job.setContactEmail(contactEmail);
            job.setIndustry(jobCategory);
            job.setApplicationDeadline(applicationDeadline);
            job.setPostingDate(Date.valueOf(LocalDate.now()));
            
            // Set default values for fields not in the form
            job.setDepartment("");
            job.setExperienceLevel("");
            job.setSkillsRequired("");
            job.setEducationRequired("");
            job.setBenefits("");
            job.setApplicationLink("");
            job.setCompanyWebsite("");
            job.setAdditionalInfo("");
            
            // Save job to database
            boolean success = jobDAO.addJob(job);
            
            if (success) {
                jsonResponse.put("status", "success");
                jsonResponse.put("message", "Job posted successfully!");
                session.setAttribute("successMessage", "Job posted successfully!");
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Failed to post job. Please try again.");
                session.setAttribute("errorMessage", "Failed to post job. Please try again.");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "An error occurred: " + e.getMessage());
            session.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        } finally {
            out.print(jsonResponse.toString());
            out.flush();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect GET requests to the post job form
        response.sendRedirect("postJob.jsp");
    }
}