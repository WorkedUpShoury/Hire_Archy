<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Apply for Job - ${job.jobTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(90deg, #4b6cb7 0%, #182848 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        
        .job-header {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        
        .job-title {
            color: #2c3e50;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        
        .company-name {
            color: #7f8c8d;
            font-weight: 500;
            margin-bottom: 1.5rem;
        }
        
        .job-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
            padding: 2.5rem;
            margin-bottom: 2rem;
        }
        
        .btn-primary-custom {
            background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
            border: none;
            padding: 10px 25px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(52, 152, 219, 0.3);
        }
        
        .section-title {
            color: #2980b9;
            font-weight: 600;
            border-bottom: 2px solid #ecf0f1;
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }
        
        .required-field::after {
            content: "*";
            color: #e74c3c;
            margin-left: 4px;
        }
        
        .resume-upload-area {
            border: 2px dashed #bdc3c7;
            border-radius: 8px;
            padding: 2rem;
            text-align: center;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }
        
        .resume-upload-area:hover {
            border-color: #3498db;
            background-color: #ecf7fd;
        }
        
        .upload-icon {
            font-size: 2.5rem;
            color: #3498db;
            margin-bottom: 1rem;
        }
        
        .application-steps {
            position: relative;
            padding-left: 2rem;
            margin-bottom: 2rem;
        }
        
        .application-steps::before {
            content: "";
            position: absolute;
            left: 11px;
            top: 5px;
            bottom: 5px;
            width: 2px;
            background: linear-gradient(to bottom, #3498db, #2ecc71);
        }
        
        .step {
            position: relative;
            margin-bottom: 1.5rem;
        }
        
        .step-number {
            position: absolute;
            left: -2rem;
            width: 24px;
            height: 24px;
            background: linear-gradient(135deg, #3498db 0%, #2ecc71 100%);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 0.8rem;
        }
        
        .badge-custom {
            background-color: #ecf0f1;
            color: #2c3e50;
            font-weight: 500;
            padding: 0.5em 0.8em;
        }
        
        .form-control, .form-select {
            border: 1px solid #dfe6e9;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }
        
        .container-main {
            padding-top: 3rem;
            padding-bottom: 3rem;
        }
    </style>
</head>
<body>
<%@ page import="com.jobportal.model.Job" %>
<%@ page import="com.jobportal.service.JobService" %>


<%
    String jobIdParam = request.getParameter("jobId");
    Job job = null;
    
    if (jobIdParam != null) {
        try {
            int jobId = Integer.parseInt(jobIdParam);
            JobService jobService = new JobService();
            job = jobService.getJobById(jobId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    request.setAttribute("job", job);
%>

<jsp:include page="navbar.jsp" />

<div class="container container-main">
    <c:choose>
        <c:when test="${not empty job}">
            <div class="row justify-content-center">
                <div class="col-lg-9">
                    <!-- Job Header Section -->
                   <div class="job-header text-center">
    <h1 class="job-title">${job.jobTitle}</h1>
    <h2 class="company-name">${job.companyName}</h2>
    <div class="d-flex flex-wrap justify-content-center gap-2">
        <!-- Employment Type Badge - Blue -->
        <span class="badge bg-primary text-white p-2">
            ${job.employmentType}
        </span>
        
        <!-- Location Badge - Green -->
        <span class="badge bg-success text-white p-2">
            <i class="fas fa-map-marker-alt me-1"></i> ${job.location}
        </span>
        
        <!-- Salary Range Badge - Purple -->
        <span class="badge" style="background-color: #6f42c1; color: white; padding: 0.375rem 0.75rem;">
            <i class="fas fa-money-bill-wave me-1"></i> ${job.salaryRange}
        </span>
    </div>
</div>
                    
                    <!-- Application Form Card -->
                    <div class="job-card">
                        <div class="application-steps mb-5">
                            <h3 class="h4 fw-bold mb-4" style="color: #2c3e50;">Application Process</h3>
                            
                            <div class="step">
                                <div class="step-number">1</div>
                                <h4 class="h5 fw-bold mb-1">Personal Information</h4>
                                <p class="text-muted mb-0">Provide your contact details</p>
                            </div>
                            
                            <div class="step">
                                <div class="step-number">2</div>
                                <h4 class="h5 fw-bold mb-1">Resume & Documents</h4>
                                <p class="text-muted mb-0">Upload your resume and cover letter</p>
                            </div>
                            
                            <div class="step">
                                <div class="step-number">3</div>
                                <h4 class="h5 fw-bold mb-1">Review & Submit</h4>
                                <p class="text-muted mb-0">Finalize your application</p>
                            </div>
                        </div>
                        
                        <form action="SubmitApplication" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="jobId" value="${job.jobId}">
                            
                            <h3 class="h4 fw-bold section-title">Personal Information</h3>
                            <div class="row g-3 mb-4">
                                <div class="col-md-6">
                                    <label for="fullName" class="form-label required-field">Full Name</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="email" class="form-label required-field">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="phone" class="form-label required-field">Phone Number</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="portfolio" class="form-label">Portfolio Website</label>
                                    <input type="url" class="form-control" id="portfolio" name="portfolio" placeholder="https://">
                                </div>
                            </div>
                            
                            <h3 class="h4 fw-bold section-title">Resume & Documents</h3>
                            <div class="mb-4">
                                <label class="form-label required-field">Upload Resume</label>
                                <label for="resumeUpload" class="resume-upload-area">
                                    <div class="upload-icon">
                                        <i class="fas fa-cloud-upload-alt"></i>
                                    </div>
                                    <p class="mb-2">Click to browse and select your resume</p>
                                    <small class="text-muted">PDF, DOC, DOCX (Max 5MB)</small>
                                    <input type="file" id="resumeUpload" name="resume" class="d-none" accept=".pdf,.doc,.docx" required>
                                </label>
                            </div>
                            
                            <div class="mb-4">
                                <label for="coverLetter" class="form-label">Cover Letter</label>
                                <textarea class="form-control" id="coverLetter" name="coverLetter" rows="5" placeholder="Tell the employer why you're a good fit for this position..."></textarea>
                            </div>
                            
                            <div class="mb-4">
                                <label for="additionalDocs" class="form-label">Additional Documents</label>
                                <input class="form-control" type="file" id="additionalDocs" name="additionalDocs" multiple>
                                <div class="form-text">You can upload multiple files (Portfolio, Certificates, etc.)</div>
                            </div>
                            
                            <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center mt-5 pt-3 border-top">
                                <button type="button" class="btn btn-outline-secondary mb-3 mb-sm-0">Save for later</button>
                                <button type="submit" class="btn btn-primary mb-3 mb-sm-0">Submit Application</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger mt-5" role="alert">
                Invalid job selected. Please try again.
            </div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
