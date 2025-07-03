package com.jobportal.controller;

import com.jobportal.dao.UserDAO;
import com.jobportal.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDAO = new UserDAO();
        try {
            // Step 1: Validate user credentials
            User user = userDAO.validateUser(email, password);
            
            if (user != null && "approved".equals(user.getStatus())) {
                // Step 2: Get complete user profile
                User completeProfile = userDAO.getUserProfile(user.getId());
                
                if (completeProfile == null) {
                    // If profile not found, use basic user info
                    completeProfile = user;
                }

                // Step 3: Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("user", completeProfile); // Complete user object
                session.setAttribute("userId", completeProfile.getId());
                session.setAttribute("userRole", completeProfile.getRole());
                
                // Step 4: Redirect based on role
                switch(completeProfile.getRole()) {
                    case "admin":
                        response.sendRedirect("adminDashboard");
                        break;
                    case "employer":
                        response.sendRedirect("employerDashboard");
                        break;
                    case "seeker":
                        response.sendRedirect("seekerDashboard");
                        break;
                    default:
                        response.sendRedirect("seekerDashboard");
                }
            } else {
                // Handle failed login
                String errorMsg = (user == null) ? "Invalid credentials" : "Account not approved";
                request.setAttribute("error", errorMsg);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "System error during login");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
