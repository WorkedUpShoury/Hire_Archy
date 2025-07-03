package com.jobportal.controller;

import com.jobportal.dao.JobApplicationDAO;
import com.jobportal.dao.UserDAO;
import com.jobportal.model.JobApplication;
import com.jobportal.model.User;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;
    private JobApplicationDAO jobApplicationDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAO();
        jobApplicationDAO = new JobApplicationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            List<User> pendingUsers = userDAO.getPendingUsers();
            List<JobApplication> applications = jobApplicationDAO.getAllApplications();
            
            request.setAttribute("pendingUsers", pendingUsers);
            request.setAttribute("applications", applications);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminDashboard.jsp");
            dispatcher.forward(request, response);
            
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error occurred. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        } catch (ClassNotFoundException e) {
            request.setAttribute("errorMessage", "System configuration error. Please contact support.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("approveUser".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                userDAO.updateUserStatus(userId, "approved");
            } else if ("rejectUser".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("userId"));
                userDAO.updateUserStatus(userId, "rejected");
            } else if ("updateApplicationStatus".equals(action)) {
                int applicationId = Integer.parseInt(request.getParameter("applicationId"));
                String status = request.getParameter("status");
                jobApplicationDAO.updateApplicationStatus(applicationId, status);
            }
            
            response.sendRedirect("adminDashboard");
            
        } catch (SQLException e) {
            request.setAttribute("errorMessage", "Database error while processing your request.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid input parameters.");
            request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
        }
    }
}