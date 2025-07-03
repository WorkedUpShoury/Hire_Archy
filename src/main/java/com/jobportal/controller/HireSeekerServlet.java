package com.jobportal.controller;

import com.jobportal.dao.OfferDAO;
import com.jobportal.model.Offer;
import com.jobportal.model.User;
import com.jobportal.util.EmailUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

@WebServlet("/hireSeeker")
public class HireSeekerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OfferDAO offerDAO;
    private EmailUtil emailUtil;

    @Override
    public void init() throws ServletException {
        super.init();
        offerDAO = new OfferDAO();
        emailUtil = new EmailUtil();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            // Get seekerId from request parameter
            String seekerIdStr = request.getParameter("seekerId");
            if (seekerIdStr == null || seekerIdStr.isEmpty()) {
                throw new ServletException("Seeker ID is required");
            }
            
            int seekerId = Integer.parseInt(seekerIdStr);
            
            // Fetch seeker data from your DAO (you'll need to implement this)
            User seeker = offerDAO.getSeekerById(seekerId); // You need to create this method
            
            if (seeker == null) {
                throw new ServletException("Candidate not found");
            }
            
            // Set seeker as request attribute
            request.setAttribute("seeker", seeker);
            
            // Show the hire seeker form
            request.getRequestDispatcher("hireSeeker.jsp").forward(request, response);
            
        } catch (Exception e) {
            request.setAttribute("error", "Error loading candidate: " + e.getMessage());
            request.getRequestDispatcher("employerDashboard").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User employer = (User) session.getAttribute("employer");

        String seekerIdStr = request.getParameter("seekerId");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Validate inputs
        if (seekerIdStr == null || seekerIdStr.isEmpty() || 
            subject == null || subject.isEmpty() || 
            message == null || message.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("hireSeeker.jsp").forward(request, response);
            return;
        }

        try {
            int seekerId = Integer.parseInt(seekerIdStr);

            Offer offer = new Offer();
            offer.setEmployerId(employer.getId());
            offer.setSeekerId(seekerId);
            offer.setSubject(subject);
            offer.setMessage(message);
            offer.setSentDate(new Date());
            offer.setStatus("pending");

            boolean saved = offerDAO.saveOffer(offer);

            if (saved) {
                boolean emailSent = emailUtil.sendOfferEmail(
                    employer.getEmail(),
                    offerDAO.getSeekerEmail(seekerId),
                    subject,
                    message,
                    employer.getFullName(),
                    employer.getCompanyName()
                );

                if (emailSent) {
                    session.setAttribute("success", "Offer sent successfully!");
                } else {
                    session.setAttribute("warning", "Offer saved but email could not be sent.");
                }
                // Redirect to dashboard after successful submission
                response.sendRedirect("employerDashboard");
                return;
            } else {
                request.setAttribute("error", "Failed to send offer. Please try again.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid candidate ID");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
        }
        
        // If we get here, there was an error - show form again with error message
        request.getRequestDispatcher("hireSeeker.jsp").forward(request, response);
    }
}