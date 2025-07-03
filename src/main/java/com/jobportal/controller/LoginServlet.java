package com.jobportal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Optional: Set dummy session values if needed
        HttpSession session = request.getSession();
        session.setAttribute("userRole", "seeker");
        session.setAttribute("userId", 1); // Dummy user ID
        
        // Directly redirect to seekerDashboard
        response.sendRedirect("seekerDashboard");
    }
}
