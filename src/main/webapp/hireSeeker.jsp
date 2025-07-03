<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Send Job Offer | JobPortal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
    :root {
        --primary: #4F46E5;
        --primary-dark: #4338CA;
        --secondary: #F9FAFB;
        --dark: #1F2937;
        --light: #F3F4F6;
        --success: #10B981;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background-color: #f8f9fa;
        color: var(--dark);
    }

    .offer-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
        overflow: hidden;
        transition: all 0.3s ease;
        margin-bottom: 2rem;
    }

    .offer-header {
        background: linear-gradient(135deg, var(--primary), #7C3AED);
        padding: 1.5rem;
        color: white;
        position: relative;
    }

    .profile-img-container {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        border: 3px solid white;
        overflow: hidden;
        margin-right: 1.5rem;
        background: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .profile-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .candidate-info h4 {
        margin-bottom: 0.25rem;
    }

    .candidate-info p {
        margin-bottom: 0;
        opacity: 0.9;
    }

    .form-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
        padding: 2rem;
    }

    .form-label {
        font-weight: 500;
        color: var(--dark);
    }

    .form-control, .form-select {
        border-radius: 8px;
        padding: 0.75rem 1rem;
        border: 1px solid #e0e0e0;
        transition: all 0.3s;
    }

    .form-control:focus, .form-select:focus {
        border-color: var(--primary);
        box-shadow: 0 0 0 0.25rem rgba(79, 70, 229, 0.25);
    }

    .btn-send {
        background-color: var(--primary);
        color: white;
        padding: 0.75rem 1.5rem;
        border-radius: 8px;
        font-weight: 500;
        transition: all 0.3s;
        border: none;
    }

    .btn-send:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
    }

    .btn-outline-secondary {
        border-radius: 8px;
        padding: 0.75rem 1.5rem;
        font-weight: 500;
        transition: all 0.3s;
    }

    .btn-outline-secondary:hover {
        transform: translateY(-2px);
    }

    .email-field {
        background-color: #f8f9fa;
        border-radius: 8px;
        padding: 0.75rem 1rem;
        margin-bottom: 1rem;
        font-size: 0.9rem;
    }

    .section-title {
        font-size: 0.9rem;
        text-transform: uppercase;
        color: var(--primary);
        font-weight: 600;
        margin-bottom: 1rem;
        letter-spacing: 0.5px;
        position: relative;
    }

    .section-title::after {
        content: '';
        position: absolute;
        bottom: -5px;
        left: 0;
        width: 30px;
        height: 2px;
        background: var(--primary);
    }

    .skill-badge {
        background-color: var(--light);
        color: var(--dark);
        padding: 0.35rem 0.75rem;
        border-radius: 50px;
        font-size: 0.75rem;
        margin-right: 0.5rem;
        margin-bottom: 0.5rem;
        display: inline-block;
    }

    .animate-hover:hover {
        transform: translateY(-3px);
        transition: all 0.3s ease;
    }

    @media (max-width: 768px) {
        .profile-img-container {
            width: 60px;
            height: 60px;
            margin-right: 1rem;
        }
    }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container py-5">
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="fw-bold">Send Job Offer</h1>
                <p class="lead">Connect with potential candidates by sending them a personalized offer</p>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-8 mx-auto">
                <!-- Candidate Information Card -->
                <div class="offer-card mb-4 animate__animated animate__fadeIn">
                    <div class="offer-header">
                        <div class="d-flex align-items-center">
                            <div class="profile-img-container">
                                <img src="${seeker.profilePicture != null ? seeker.profilePicture : 
                                    'https://ui-avatars.com/api/?name=' += seeker.fullName += '&background=4F46E5&color=fff&size=200'}" 
                                    class="profile-img" 
                                    alt="${seeker.fullName}">
                            </div>
                            <div class="candidate-info">
                                <h4>${seeker.fullName}</h4>
                                <p><i class="bi bi-briefcase"></i> ${seeker.title != null ? seeker.title : 'Professional'}</p>
                                <p><i class="bi bi-geo-alt"></i> ${seeker.location != null ? seeker.location : 'Location not specified'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="p-4">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <h6 class="section-title">Skills</h6>
                                <div>
                                    <c:forTokens items="${seeker.skills}" delims="," var="skill">
                                        <span class="skill-badge">${skill}</span>
                                    </c:forTokens>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <h6 class="section-title">Experience</h6>
                                <p>${seeker.experience} years</p>
                            </div>
                        </div>
                        <div class="mb-3">
                            <h6 class="section-title">About</h6>
                            <p>${seeker.about != null ? seeker.about : 'No description provided.'}</p>
                        </div>
                    </div>
                </div>

                <!-- Email Form Card -->
                <div class="form-card animate__animated animate__fadeIn animate__delay-1s">
                    <h3 class="mb-4">Compose Your Offer</h3>
                    <form action="hireSeeker" method="post">
                        <input type="hidden" name="seekerId" value="${seeker.id}">
                        
                        <div class="mb-3">
                            <label class="form-label">From</label>
                            <div class="email-field">
                                <strong>${sessionScope.employer.email}</strong> (${sessionScope.employer.companyName})
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">To</label>
                            <div class="email-field">
                                <strong>${seeker.email}</strong> (${seeker.fullName})
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="subject" class="form-label">Subject</label>
                            <input type="text" class="form-control" id="subject" name="subject" 
                                value="Job Opportunity at ${sessionScope.employer.companyName}" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="message" class="form-label">Your Offer Message</label>
                            <textarea class="form-control" id="message" name="message" rows="8" required
                                placeholder="Dear ${seeker.fullName},

We were impressed by your profile and would like to discuss a potential opportunity at ${sessionScope.employer.companyName}.

[Your personalized message here]

Looking forward to your response.

Best regards,
${sessionScope.employer.fullName}
${sessionScope.employer.companyName}"></textarea>
                        </div>
                        
                        <div class="d-flex justify-content-between">
                            <a href="employerDashboard" class="btn btn-outline-secondary animate-hover">
                                <i class="bi bi-arrow-left"></i> Back to Dashboard
                            </a>
                            <button type="submit" class="btn btn-send animate-hover">
                                <i class="bi bi-send"></i> Send Offer
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add animation to form submission
        document.querySelector('form').addEventListener('submit', function(e) {
            const btn = this.querySelector('button[type="submit"]');
            btn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Sending...';
            btn.disabled = true;
        });

        // Auto-expand textarea as user types
        const textarea = document.getElementById('message');
        textarea.addEventListener('input', function() {
            this.style.height = 'auto';
            this.style.height = (this.scrollHeight) + 'px';
        });
    </script>
</body>
</html>