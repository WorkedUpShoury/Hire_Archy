package com.jobportal.controller;

import com.jobportal.service.JobService;
import com.jobportal.model.Job;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/apply")
public class JobApplicationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JobService jobService = new JobService();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String jobIdParam = request.getParameter("jobId");
        if (jobIdParam == null || jobIdParam.isEmpty()) {
            response.sendRedirect("employerDashboard.jsp");
            return;
        }
        
        try {
            int jobId = Integer.parseInt(jobIdParam);
            Job job = jobService.getJobById(jobId);
            
            if (job == null) {
                response.sendRedirect("employerDashboard.jsp");
                return;
            }
            
            request.setAttribute("job", job);
            request.getRequestDispatcher("/applyJob.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            response.sendRedirect("employerDashboard.jsp");
        }
    }
}
