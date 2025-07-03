<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Job Posting Form</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body class="bg-light">

	<header class="p-3 border-bottom bg-dark">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-between">
            <a href="employerDashboard.jsp" class="d-flex align-items-center text-white text-decoration-none">
                <img src="images/onlylogo.png" alt="Logo" width="32" height="32" class="me-2">
                <span class="navbar-brand">HireArchy</span>
            </a>
            <ul class="nav">
                <li><a href="employerDashboard.jsp" class="nav-link text-white">Home</a></li>
                <li><a href="jobpost.jsp" class="nav-link active bg-primary text-white rounded px-3 py-1">Post</a></li>
                <li><a href="CompanyProfile.jsp" class="nav-link text-white">Profile</a></li>
                <li><a href="#" class="nav-link text-white">FAQs</a></li>
                <li><a href="#" class="nav-link text-white">About</a></li>
            </ul>
        </div>
    </div>
</header>

	
    <div class="container mt-5">
        <h2 class="mb-4 text-center">Job Posting Form</h2>
        <form action="JobPostServlet" method="post" class="p-4 border rounded bg-white shadow-sm">
            <div class="form-group">
                <label>Job Title:</label>
                <input type="text" name="jobTitle" class="form-control" required>
            </div>

            <div class="form-group">
                <label>Description:</label>
                <textarea name="description" class="form-control" rows="3" required></textarea>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Location:</label>
                    <input type="text" name="location" class="form-control" required>
                </div>
                <div class="form-group col-md-6">
                    <label>Salary:</label>
                    <input type="number" name="salary" class="form-control">
                </div>
            </div>

            <div class="form-group">
                <label>Job Category:</label>
                <select name="jobCategory" class="form-control">
                    <option>Software Development</option>
                    <option>Marketing</option>
                    <option>Design</option>
                </select>
            </div>

            <div class="form-group">
                <label>Skills Required:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="skills" value="Python">
                    <label class="form-check-label">Python</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="skills" value="Java">
                    <label class="form-check-label">Java</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="skills" value="Project Management">
                    <label class="form-check-label">Project Management</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="skills" value="Other">
                    <label class="form-check-label">Other</label>
                </div>
            </div>

            <div class="form-group">
                <label>Benefits Offered:</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="benefits" value="Health Insurance">
                    <label class="form-check-label">Health Insurance</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="benefits" value="Paid Time Off">
                    <label class="form-check-label">Paid Time Off</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="benefits" value="Retirement Plans">
                    <label class="form-check-label">Retirement Plans</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="benefits" value="Other">
                    <label class="form-check-label">Other</label>
                </div>
            </div>

            <div class="form-group">
                <label>Application Deadline:</label>
                <input type="date" name="deadline" class="form-control">
            </div>

            <div class="form-group">
                <label>Contact Email:</label>
                <input type="email" name="contactEmail" class="form-control">
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Post Job</button>
            </div>
        </form>
    </div>
</body>
</html>
