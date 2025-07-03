package com.jobportal.controller;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class ManageJobsServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static class Job {
        public int id;
        public String title, company, location;

        public Job(int id, String title, String company, String location) {
            this.id = id;
            this.title = title;
            this.company = company;
            this.location = location;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Job> jobs = new ArrayList<>();
        jobs.add(new Job(501, "Full Stack Developer", "TechNova", "Bangalore"));
        jobs.add(new Job(502, "UI/UX Designer", "PixelCraft", "Delhi"));

        request.setAttribute("jobs", jobs);
        RequestDispatcher rd = request.getRequestDispatcher("manageJobs.jsp");
        rd.forward(request, response);
    }
}
