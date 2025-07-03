package com.jobportal.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/searchJobs")
public class JobSearchServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public static class Job {
        String title, company, location, salary, deadline;

        public Job(String title, String company, String location, String salary, String deadline) {
            this.title = title;
            this.company = company;
            this.location = location;
            this.salary = salary;
            this.deadline = deadline;
        }
    }

    private static final List<Job> jobList = new ArrayList<>();

    static {
        jobList.add(new Job("Full Stack Developer", "TechNova", "Bangalore", "₹9,00,000/year", "30 April 2025"));
        jobList.add(new Job("Backend Engineer", "CodeCraft", "Hyderabad", "₹8,50,000/year", "15 May 2025"));
        jobList.add(new Job("Android App Developer", "AppSparrow", "Remote", "₹7,20,000/year", "10 May 2025"));
        jobList.add(new Job("Cybersecurity Analyst", "SecureZone", "Pune", "₹10,00,000/year", "5 May 2025"));
        jobList.add(new Job("UI/UX Designer", "PixelBloom", "Mumbai", "₹6,50,000/year", "20 May 2025"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String query = req.getParameter("query");
        List<Job> filteredJobs;

        if (query != null && !query.trim().isEmpty()) {
            String lowerQuery = query.toLowerCase();
            filteredJobs = jobList.stream()
                .filter(job -> job.title.toLowerCase().contains(lowerQuery) ||
                               job.company.toLowerCase().contains(lowerQuery) ||
                               job.location.toLowerCase().contains(lowerQuery))
                .collect(Collectors.toList());
        } else {
            filteredJobs = jobList;
        }

        req.setAttribute("jobs", filteredJobs);
        req.getRequestDispatcher("allJobs.jsp").forward(req, resp);
    }
}
