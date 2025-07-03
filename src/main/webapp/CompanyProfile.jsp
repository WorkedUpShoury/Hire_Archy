<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Company Profile Form</title>
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
                <li><a href="jobpost.jsp" class="nav-link text-white">Post</a></li>
                <li><a href="CompanyProfile.jsp" class="nav-link active bg-primary text-white rounded px-3 py-1">Profile</a></li>
                <li><a href="#" class="nav-link text-white">FAQs</a></li>
                <li><a href="#" class="nav-link text-white">About</a></li>
            </ul>
        </div>
    </div>
</header>

<div class="container mt-5">
    <h2 class="mb-4 text-center">Company Profile Form</h2>
    <form action="CompanyProfileServlet" method="post" class="p-4 border rounded bg-white shadow-sm">
        <div class="form-group">
            <label>Company Name:</label>
            <input type="text" name="companyName" class="form-control" value="TechVeda Solutions Pvt. Ltd." required>
        </div>

        <div class="form-group">
            <label>Industry:</label>
            <input type="text" name="industry" class="form-control" value="Information Technology & Services" required>
        </div>

        <div class="form-group">
            <label>Company Size:</label>
            <select name="companySize" class="form-control">
                <option>1-10</option>
                <option>11-50</option>
                <option selected>51-200</option>
                <option>201-500</option>
                <option>500+</option>
            </select>
        </div>

        <div class="form-group">
            <label>Website:</label>
            <input type="url" name="website" class="form-control" value="https://www.techveda.in">
        </div>

        <div class="form-group">
            <label>Headquarters Location:</label>
            <input type="text" name="hqLocation" class="form-control" value="Pune, Maharashtra, India">
        </div>

        <div class="form-group">
            <label>Contact Email:</label>
            <input type="email" name="contactEmail" class="form-control" value="contact@techveda.in" required>
        </div>

        <div class="form-group">
            <label>About the Company:</label>
            <textarea name="about" rows="5" class="form-control">TechVeda Solutions is a growing Indian tech firm specializing in cloud solutions, enterprise software, and AI-driven platforms. Established in 2018 and headquartered in Pune, we strive to deliver innovative digital transformation services to clients across India and Southeast Asia.</textarea>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Edit Company Profile</button>
        </div>
    </form>
</div>
</body>
</html>
