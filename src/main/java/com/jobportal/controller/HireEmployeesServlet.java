package com.jobportal.controller;

import com.jobportal.dao.SeekerDAO;
import com.jobportal.model.Seeker;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/employerDashboard")
public class HireEmployeesServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private SeekerDAO seekerDAO;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/hirearchydb", 
                "root", 
                "password");
            seekerDAO = new SeekerDAO(conn);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Handle hire action
        String hireId = request.getParameter("id");
        if (hireId != null) {
            try {
                int seekerId = Integer.parseInt(hireId);
                seekerDAO.updateSeekerStatus(seekerId, "Hired");
                request.setAttribute("message", "Successfully hired seeker with ID " + seekerId);
            } catch (SQLException e) {
                request.setAttribute("error", "Error hiring seeker: " + e.getMessage());
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid seeker ID");
            }
        }

        // Get filter parameters
        String skillsFilter = request.getParameter("skills");
        String experienceFilter = request.getParameter("experience");
        String statusFilter = request.getParameter("status");

        try {
            List<Seeker> seekers;
            
            // If filters are present, use filtered search
            if (skillsFilter != null || experienceFilter != null || statusFilter != null) {
                seekers = seekerDAO.filterSeekers(
                    skillsFilter, 
                    experienceFilter, 
                    statusFilter
                );
            } else {
                // Otherwise get all seekers
                seekers = seekerDAO.getAllSeekers();
            }
            
            request.setAttribute("seekerList", seekers);
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        request.getRequestDispatcher("employerDashboard.jsp").forward(request, response);
    }
}