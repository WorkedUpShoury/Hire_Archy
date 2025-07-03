package com.jobportal.controller;

import com.jobportal.dao.UserDAO;
import com.jobportal.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get user input from the registration form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String mobile = request.getParameter("mobile");
        String workStatus = request.getParameter("workstatus");

        // Create a new user object
        User newUser = new User();
        newUser.setName(name);
        newUser.setEmail(email);
        newUser.setPassword(password); // In a real-world app, this should be hashed
        newUser.setRole(role);
        newUser.setStatus("pending"); // Default status is "pending" until admin approval
        newUser.setMobile(mobile);
        newUser.setWorkStatus(workStatus);

        // Create an instance of the UserDAO
        UserDAO userDAO = new UserDAO();

        // Check if the email already exists in the database
        if (userDAO.isEmailExists(email)) {
            // If the email already exists, show an error message
            request.setAttribute("error", "Email already registered.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            // If the email is not registered, try adding the user to the database
            boolean success = false;
			try {
				success = userDAO.addUser(newUser);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            if (success) {
                // Redirect to login page after successful registration
                response.sendRedirect("login.jsp");
            } else {
                // Show an error message if user creation failed
                request.setAttribute("error", "Registration failed. Please try again.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }
}
