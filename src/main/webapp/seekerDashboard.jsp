<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.jobportal.dao.JobDAO" %>
<%@ page import="com.jobportal.model.Job" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Seeker Dashboard - All Job Postings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <script>
        function hideDiv() {
            var div = document.getElementById("myDiv");
            div.style.display = "none";
        }
        
        // Initialize animations when page loads
        document.addEventListener('DOMContentLoaded', function() {
            // Animate cards sequentially
            const cards = document.querySelectorAll('.job-card');
            cards.forEach((card, index) => {
                setTimeout(() => {
                    card.classList.add('animate__animated', 'animate__fadeInUp');
                }, 100 * index);
            });
            
            // Animate recommended jobs section
            const recommendedSection = document.getElementById('recommendedJobs');
            if(recommendedSection) {
                setTimeout(() => {
                    recommendedSection.classList.add('animate__animated', 'animate__fadeIn');
                }, 500);
            }
        });
    </script>
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(to right, #4facfe 0%, #00f2fe 100%);
            --dark-bg: #1a1a2e;
            --light-text: #f8f9fa;
            --accent-color: #00f0ff;
        }

         body {
    font-family: 'Poppins', sans-serif;
    background: 
        linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
        url('images/b4.jpg');
    background-size: cover;       /* Cover entire viewport */
    background-position: center;  /* Center the image */
    background-attachment: fixed; /* Fix the background (no scroll) */
    background-repeat: no-repeat; /* Prevent tiling */
    color: var(--dark);
    min-height: 100vh;
    margin: 0;
}

        /* Animated background for the whole page */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 30%, rgba(0, 240, 255, 0.1) 0%, transparent 20%),
                radial-gradient(circle at 80% 70%, rgba(142, 45, 226, 0.1) 0%, transparent 20%);
            z-index: -1;
            animation: pulseBackground 15s infinite alternate;
        }

        @keyframes pulseBackground {
            0% { opacity: 0.3; }
            100% { opacity: 0.7; }
        }

        .input-group {
            background-color: rgba(31, 31, 31, 0.7);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 8px;
            overflow: hidden;
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }

        .input-group:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        .form-check-label {
        	color: white;
        }
        .form-label {
        	color: white;
        }
        
        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border: none;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 0 0.25rem rgba(0, 240, 255, 0.25);
        }

        .form-control::placeholder {
            color: #bbb;
        }

        .input-group-text {
            background-color: transparent;
            color: white;
            border: none;
        }

        .btn-primary {
            background: var(--secondary-gradient);
            border: none;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .btn-primary::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.2), transparent);
            transform: translateX(-100%);
            transition: all 0.6s ease;
        }

        .btn-primary:hover::after {
            transform: translateX(100%);
        }

        .card {
            background-color: rgba(31, 31, 31, 0.7);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
            overflow: hidden;
        }

        .job-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            border-color: var(--accent-color);
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, rgba(142, 45, 226, 0.1), rgba(0, 240, 255, 0.1));
            z-index: -1;
        }

        .btn-apply {
            background: var(--secondary-gradient);
            color: white;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-apply:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 240, 255, 0.3);
        }

        .filter-sidebar {
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }

        .filter-sidebar:hover {
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .filter-title {
            font-weight: 600;
            font-size: 18px;
            margin-bottom: 10px;
            color: var(--accent-color);
            position: relative;
            display: inline-block;
        }

        .filter-title::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--secondary-gradient);
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.3s ease;
        }

        .filter-sidebar:hover .filter-title::after {
            transform: scaleX(1);
        }

        .filter-section {
            margin-bottom: 20px;
        }

        .filter-section label {
            font-weight: 500;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        .filter-section label:hover {
            color: var(--accent-color);
        }

        /* Updated Carousel */
        .banner {
            height: 200px;
            background-size: cover;
            background-position: center;
            position: relative;
            transition: all 0.5s ease;
        }

        .banner:hover {
            transform: scale(1.01);
        }

        .banner h1 {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 10px;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.8);
        }

        .banner p {
            font-size: 16px;
            margin-bottom: 15px;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8);
        }

        .banner .btn {
            padding: 6px 16px;
            font-size: 14px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }

        .text-white {
            text-shadow: 1px 1px 5px black;
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.2);
            box-shadow: inset 0 0 300px rgba(0, 0, 0, 0.6);
            z-index: 1;
            transition: all 0.5s ease;
        }

        .banner:hover .overlay {
            background: rgba(0, 0, 0, 0.3);
        }

        .text-center {
            position: relative;
            z-index: 2;
        }

        /* Custom alignments */
        .custom-align-right .text-white {
            text-align: right;
            padding-left: 30px;
            padding-right: 30px;
            margin-right: 200px;
            z-index: 2;
        }

        .custom-align-left .text-white {
            text-align: left;
            padding-left: 30px;
            padding-right: 30px;
            margin-left: 200px;
            z-index: 2;
        }

        /* Section headers */
        h3.fw-bold {
            position: relative;
            display: inline-block;
            margin-bottom: 2rem;
            color: white;
        }

        h3.fw-bold::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--accent-color);
            animation: expandLine 1s forwards;
        }

        @keyframes expandLine {
            from { width: 0; }
            to { width: 50px; }
        }

        /* Alert animations */
        .alert {
            transition: all 0.5s ease;
        }

        .alert-warning {
            background-color: rgba(255, 193, 7, 0.2);
            border-color: rgba(255, 193, 7, 0.3);
            backdrop-filter: blur(5px);
        }

        /* Floating animation for featured cards */
        .floating-card {
            animation: floating 3s ease-in-out infinite;
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        /* Loading animation */
        .loading-spinner {
            display: inline-block;
            width: 2rem;
            height: 2rem;
            border: 3px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: var(--accent-color);
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .custom-align-right .text-white,
            .custom-align-left .text-white {
                margin: 0;
                text-align: center;
                padding: 0 15px;
            }
            
            .banner h1 {
                font-size: 22px;
            }
            
            .banner p {
                font-size: 14px;
            }
        }
    </style>
</head>

<body>

<!-- Include Navbar -->
<jsp:include page="navbar.jsp" />

<!-- Carousel Section -->
<div id="carouselExample" class="carousel slide my-5" data-bs-ride="carousel" data-bs-interval="3000">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="banner d-flex align-items-center justify-content-start custom-align-left" style="background-image: url('images/banner1.png');">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bold animate__animated animate__fadeInDown">Find Your Dream Job</h1>
                    <p class="lead animate__animated animate__fadeIn animate__delay-1s">Explore thousands of opportunities tailored for you.</p>
                    <a href="searchJobs.jsp" class="btn btn-primary mt-3 animate__animated animate__fadeInUp animate__delay-2s">Search Jobs</a>
                </div>
                <div class="overlay"></div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="banner d-flex align-items-center justify-content-end custom-align-right" style="background-image: url('images/banner2.png');">
                <div class="text-white px-4">
                    <h1 class="display-4 fw-bold text-end animate__animated animate__fadeInDown">Top Companies Are Hiring</h1>
                    <p class="lead text-end animate__animated animate__fadeIn animate__delay-1s">Your talent deserves the best platform.</p>
                    <a href="searchJobs.jsp" class="btn btn-primary mt-3 float-end animate__animated animate__fadeInUp animate__delay-2s">Apply Now</a>
                </div>
                <div class="overlay"></div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="banner d-flex align-items-center justify-content-start custom-align-left" style="background-image: url('images/banner3.jpg');">
                <div class="text-white px-4">
                    <h1 class="display-4 fw-bold text-start animate__animated animate__fadeInDown">Remote and Onsite Jobs</h1>
                    <p class="lead text-start animate__animated animate__fadeIn animate__delay-1s">Work from anywhere, anytime!</p>
                    <a href="searchJobs.jsp" class="btn btn-primary mt-3 float-start animate__animated animate__fadeInUp animate__delay-2s">Get Started</a>
                </div>
                <div class="overlay"></div>
            </div>
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
    </button>
</div>

<!-- Search Bar -->
<div class="container my-4 animate__animated animate__fadeIn">
    <form class="d-flex align-items-center custom-search-bar" action="seekerDashboard" method="get">
        <div class="input-group">
            <span class="input-group-text">
                <i class="bi bi-search"></i>
            </span>
            <input type="text" name="job" class="form-control" placeholder="Job title, keywords, or company" value="${keyword}">
            <span class="input-group-text">
                <i class="bi bi-geo-alt"></i>
            </span>
            <input type="text" name="location" class="form-control" placeholder='City, state, zip code, or "remote"' value="${location}">
            <button class="btn btn-primary" type="submit">
                <span class="search-text">Find jobs</span>
                <span class="loading-spinner d-none"></span>
            </button>
        </div>
    </form>
</div>

<div class="container my-4">
    <div class="row">
        <!-- Sidebar for Filters -->
        <div class="col-md-3 mb-4">
            <div class="filter-sidebar animate__animated animate__fadeInLeft">
                <h5 class="filter-title">All Filters</h5>
                <hr>
                <div class="filter-section">
                    <label class="form-label">Employment Type</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="employmentType" value="Full-Time" id="fulltime">
                        <label class="form-check-label" for="fulltime">Full-Time</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="employmentType" value="Part-Time" id="parttime">
                        <label class="form-check-label" for="parttime">Part-Time</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="employmentType" value="Internship" id="internship">
                        <label class="form-check-label" for="internship">Internship</label>
                    </div>
                </div>
                <hr>
                <div class="filter-section">
                    <label class="form-label">Work Mode</label>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="workMode" value="Onsite" id="onsite">
                        <label class="form-check-label" for="onsite">Onsite</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="workMode" value="Remote" id="remote">
                        <label class="form-check-label" for="remote">Remote</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="workMode" value="Hybrid" id="hybrid">
                        <label class="form-check-label" for="hybrid">Hybrid</label>
                    </div>
                </div>
                <hr>
                <div class="filter-section">
                    <label class="form-label">Location</label>
                    <input type="text" class="form-control mb-2" name="location" placeholder="Enter city or state">
                    <label class="form-label">Salary Range</label>
                    <div class="d-flex">
                        <input type="number" class="form-control me-2" name="minSalary" placeholder="Min">
                        <input type="number" class="form-control" name="maxSalary" placeholder="Max">
                    </div>
                </div>
                <button class="btn btn-primary w-100 mt-4" type="submit">Apply Filters</button>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-md-9">
            <div class="row">
                <%
                    JobDAO jobDAO = new JobDAO();
                    List<Job> recommendedJobList = jobDAO.getRandomJobs(5);
                    request.setAttribute("recommendedJobList", recommendedJobList);
                %>
                
                <!-- Job Listings Section -->
                <div class="col-md-12">
                    <h3 class="fw-bold animate__animated animate__fadeIn">Job Listings</h3>
                    <c:choose>
                        <c:when test="${empty jobList}">
                            <div class="alert alert-warning animate__animated animate__shakeX" role="alert">
                                No jobs found. Try searching something else!
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row g-4">
                                <c:forEach var="job" items="${jobList}" varStatus="loop">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="card p-3 border-2 shadow h-100 job-card ${loop.index < 3 ? 'floating-card' : ''}">
                                            <div class="card-body d-flex flex-column">
                                                <h5 class="card-title fw-bold">${job.jobTitle}</h5>
                                                <h6 class="card-subtitle mb-2 text-muted">${job.companyName} - ${job.location}</h6>
                                                <p class="card-text flex-grow-1">
                                                    ${fn:substring(job.jobDescription, 0, 150)}...
                                                </p>
                                                <p class="card-text">
                                                    <small class="text-muted">
                                                        ${job.employmentType} | Posted on 
                                                        <fmt:formatDate value="${job.postingDate}" pattern="dd-MM-yyyy"/>
                                                    </small>
                                                </p>
                                                <a href="applyJob.jsp?jobId=${job.jobId}" class="btn btn-primary w-100 mt-3 btn-apply">Apply</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <!-- Recommended Jobs Section -->
                <div class="col-md-12 mb-4 p-4" id="recommendedJobs">
                    <h3 class="fw-bold mb-3">Recommended Jobs</h3>
                    <c:choose>
                        <c:when test="${empty recommendedJobList}">
                            <div class="alert alert-warning animate__animated animate__shakeX" role="alert">
                                No recommended jobs found. Try searching something else!
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row g-4">
                                <c:forEach var="job" items="${recommendedJobList}">
                                    <div class="col-md-6 col-lg-4">
                                        <div class="card p-3 border-2 shadow h-100 job-card floating-card">
                                            <div class="card-body d-flex flex-column">
                                                <h5 class="card-title fw-bold">${job.jobTitle}</h5>
                                                <h6 class="card-subtitle mb-2 text-muted">${job.companyName} - ${job.location}</h6>
                                                <p class="card-text flex-grow-1">
                                                    ${fn:substring(job.jobDescription, 0, 150)}...
                                                </p>
                                                <p class="card-text">
                                                    <small class="text-muted">
                                                        ${job.employmentType} | Posted on 
                                                        <fmt:formatDate value="${job.postingDate}" pattern="dd-MM-yyyy"/>
                                                    </small>
                                                </p>
                                                <a href="applyJob.jsp?jobId=${job.jobId}" class="btn btn-primary w-100 mt-3 btn-apply">Apply</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include Footer -->
<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Add loading spinner when form is submitted
    document.querySelector('form.custom-search-bar').addEventListener('submit', function(e) {
        const btn = this.querySelector('button[type="submit"]');
        btn.disabled = true;
        btn.querySelector('.search-text').classList.add('d-none');
        btn.querySelector('.loading-spinner').classList.remove('d-none');
        
        // Simulate loading for demo (remove in production)
        setTimeout(() => {
            btn.disabled = false;
            btn.querySelector('.search-text').classList.remove('d-none');
            btn.querySelector('.loading-spinner').classList.add('d-none');
        }, 1500);
    });
    
    // Add hover effect to cards
    document.querySelectorAll('.job-card').forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.classList.add('animate__animated', 'animate__pulse');
        });
        card.addEventListener('mouseleave', () => {
            card.classList.remove('animate__animated', 'animate__pulse');
        });
    });
</script>
</body>
</html>