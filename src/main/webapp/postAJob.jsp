<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post a New Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(90deg, #9aa0fc 0%, #d9e7ff 100%);
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
        
        .page-title {
            color: #2c3e50;
            font-weight: 700;
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
        
        .form-control, .form-select, .form-textarea {
            border: 1px solid #dfe6e9;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus, .form-textarea:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
        }
        
        .container-main {
            padding-top: 3rem;
            padding-bottom: 3rem;
        }
        
        .badge-custom {
            background-color: #ecf0f1;
            color: #2c3e50;
            font-weight: 500;
            padding: 0.5em 0.8em;
        }
        .success-toast {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background-color: #4CAF50;
        color: white;
        padding: 16px;
        border-radius: 4px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        opacity: 1;
        transition: opacity 1s ease-out;
    }
    .fade-out {
        opacity: 0;
    }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container container-main">
    <div class="row justify-content-center">
        <div class="col-lg-9">
            <!-- Page Header -->
            <div class="job-header text-center">
                <h1 class="page-title">Post a New Job Opportunity</h1>
                <p class="text-muted">Fill out the form below to list your job opening on our platform</p>
            </div>
            
            <!-- Job Posting Form Card -->
            <div class="job-card">
                
                <form action="PostJob" method="post">
                    <h3 class="h4 fw-bold section-title">Job Information</h3>
                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <label for="jobTitle" class="form-label required-field">Job Title</label>
                            <input type="text" class="form-control" id="jobTitle" name="jobTitle" placeholder="e.g. Senior Software Engineer" required>
                        </div>
                        <div class="col-md-6">
                            <label for="companyName" class="form-label required-field">Company Name</label>
                            <input type="text" class="form-control" id="companyName" name="companyName" required>
                        </div>
                        <div class="col-md-6">
                            <label for="location" class="form-label required-field">Location</label>
                            <input type="text" class="form-control" id="location" name="location" placeholder="e.g. Pune, MH or Remote" required>
                        </div>
                        <div class="col-md-6">
                            <label for="employmentType" class="form-label required-field">Employment Type</label>
                            <select class="form-select" id="employmentType" name="employmentType" required>
                                <option value="" selected disabled>Select employment type</option>
                                <option value="Full-time">Full-time</option>
                                <option value="Part-time">Part-time</option>
                                <option value="Contract">Contract</option>
                                <option value="Internship">Internship</option>
                                <option value="Temporary">Temporary</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="salaryRange" class="form-label">Salary Range</label>
                            <input type="text" class="form-control" id="salaryRange" name="salaryRange" placeholder="e.g.  ₹6,00,000 - ₹10,00,000 INR per year">
                        </div>
                        <div class="col-md-6">
                            <label for="applicationDeadline" class="form-label">Application Deadline</label>
                            <input type="date" class="form-control" id="applicationDeadline" name="applicationDeadline">
                        </div>
                    </div>
                    
                    <h3 class="h4 fw-bold section-title">Job Description</h3>
                    <div class="mb-4">
                        <label for="jobDescription" class="form-label required-field">Detailed Job Description</label>
                        <textarea class="form-control form-textarea" id="jobDescription" name="jobDescription" rows="8" placeholder="Describe the responsibilities, expectations, and day-to-day activities of this position..." required></textarea>
                    </div>
                    
                    <h3 class="h4 fw-bold section-title">Requirements & Qualifications</h3>
                    <div class="mb-4">
                        <label for="requirements" class="form-label required-field">Required Skills & Qualifications</label>
                        <textarea class="form-control form-textarea" id="requirements" name="requirements" rows="6" placeholder="List the required skills, education, experience, and certifications..." required></textarea>
                        <div class="form-text">You can use bullet points (start each line with • or -)</div>
                    </div>
                    
                    <div class="mb-4">
                        <label for="preferredQualifications" class="form-label">Preferred Qualifications (Optional)</label>
                        <textarea class="form-control form-textarea" id="preferredQualifications" name="preferredQualifications" rows="4" placeholder="List any preferred or nice-to-have qualifications..."></textarea>
                    </div>
                    
                    <h3 class="h4 fw-bold section-title">Additional Information</h3>
                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <label for="contactEmail" class="form-label required-field">Contact Email</label>
                            <input type="email" class="form-control" id="contactEmail" name="contactEmail" placeholder="For applicants to contact you" required>
                        </div>
                        <div class="col-md-6">
                            <label for="jobCategory" class="form-label required-field">Job Category</label>
                            <select class="form-select" id="jobCategory" name="jobCategory" required>
                                <option value="" selected disabled>Select a category</option>
                                <option value="Information Technology">Information Technology</option>
                                <option value="Healthcare">Healthcare</option>
                                <option value="Finance">Finance</option>
                                <option value="Education">Education</option>
                                <option value="Engineering">Engineering</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Sales">Sales</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="d-flex flex-column flex-sm-row justify-content-between align-items-center mt-5 pt-3 border-top">
                        <button type="button" class="btn btn-outline-secondary mb-3 mb-sm-0">Save Draft</button>
                        <button type="submit" class="btn btn-primary mb-3 mb-sm-0">Publish Job</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="success-toast" id="successPopup" style="display: none;">
    ✓ Job Posted Successfully!
</div>
<jsp:include page="footer.jsp" />
<script>
document.querySelector('form').addEventListener('submit', function(e) {
    e.preventDefault(); // Prevent default form submission
    
    // Submit form via AJAX
    fetch('PostJob', {
        method: 'POST',
        body: new FormData(this)
    })
    .then(response => {
        if(response.ok) {
            showSuccessToast();
            // Optional: Reset form after success
            this.reset(); 
        } else {
            alert('Error posting job');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

function showSuccessToast() {
    const toast = document.getElementById('successPopup');
    toast.style.display = 'block';
    
    setTimeout(() => {
        toast.classList.add('fade-out');
        
        setTimeout(() => {
            // Redirect after fade out
            window.location.href = 'employerDashboard.jsp';
        }, 1000);
    }, 3000);
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>