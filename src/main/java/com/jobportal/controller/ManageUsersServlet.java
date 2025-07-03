package com.jobportal.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class ManageUsersServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static class User {
        public int id;
        public String name, email, role;

        public User(int id, String name, String email, String role) {
            this.id = id;
            this.name = name;
            this.email = email;
            this.role = role;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = new ArrayList<>();
        users.add(new User(101, "Neha Sharma", "neha@example.com", "Job Seeker"));
        users.add(new User(102, "Ravi Mehta", "ravi@example.com", "Recruiter"));

        request.setAttribute("users", users);
        RequestDispatcher rd = request.getRequestDispatcher("manageUsers.jsp");
        rd.forward(request, response);
    }
}
