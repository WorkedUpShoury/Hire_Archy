package com.jobportal.controller;

import com.jobportal.dao.JobDAO;
import com.jobportal.model.Job;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/seekerDashboard")
public class SeekerDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JobDAO jobDAO;

    @Override
    public void init() throws ServletException {
        jobDAO = new JobDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("job");
        String location = request.getParameter("location");
        List<Job> jobList = null;
        List<Job> recommendedJobs = null;

        try {
            // Fetch the list of jobs based on search criteria
            if ((keyword != null && !keyword.trim().isEmpty()) || (location != null && !location.trim().isEmpty())) {
                jobList = jobDAO.searchJobs(keyword, location);
            } else {
                jobList = jobDAO.getAllJobs();
                System.out.print("Working");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        // Set the attributes for both search results and recommended jobs
        request.setAttribute("jobList", jobList);
        request.setAttribute("recommendedJobs", recommendedJobs);
        request.setAttribute("keyword", keyword);
        request.setAttribute("location", location);

        // Forward to the JSP page
        request.getRequestDispatcher("seekerDashboard.jsp").forward(request, response);
    }
}
