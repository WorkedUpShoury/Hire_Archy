package com.jobportal.test;

import com.jobportal.dao.JobApplicationDAO;
import com.jobportal.model.JobApplication;

import java.util.List;

public class JobApplicationDAOConsoleTest {
    public static void main(String[] args) {
        JobApplicationDAO dao = new JobApplicationDAO();

        try {
            // Test getAllApplications()
            System.out.println("=== Fetching All Job Applications ===");
            List<JobApplication> applications = dao.getAllApplications();

            if (applications.isEmpty()) {
                System.out.println("No job applications found.");
            } else {
                for (JobApplication app : applications) {
                    System.out.println("Application ID: " + app.getId());
                    System.out.println("Applicant ID: " + app.getApplicantId());
                    System.out.println("Applicant Name: " + app.getApplicantName());
                    System.out.println("Job ID: " + app.getJobId());
                    System.out.println("Job Title: " + app.getJobTitle());
                    System.out.println("Company: " + app.getCompanyName());
                    System.out.println("Status: " + app.getStatus());
                    System.out.println("----------------------------------");
                }
            }

            // Test updateApplicationStatus()
            int testId = 1; // Replace with a valid application ID from your DB
            String newStatus = "Interview Scheduled";

            boolean updated = dao.updateApplicationStatus(testId, newStatus);
            System.out.println("Update Status for ID " + testId + ": " + (updated ? "Success" : "Failed"));

        } catch (Exception e) {
            System.err.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
