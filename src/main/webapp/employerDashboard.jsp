<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Hire Talent | JobPortal</title>
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
    background: 
        linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
        url('images/bgbanner.png');
    background-size: cover;       /* Cover entire viewport */
    background-position: center;  /* Center the image */
    background-attachment: fixed; /* Fix the background (no scroll) */
    background-repeat: no-repeat; /* Prevent tiling */
    color: var(--dark);
    min-height: 100vh;
    margin: 0;
}
    /* Animated background */
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

    .candidate-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 6px 18px rgba(0, 0, 0, 0.12);
        overflow: hidden;
        transition: all 0.3s ease;
        margin-bottom: 2rem;
        position: relative;
        padding-top: 90px;
        border: 1px solid rgba(0, 0, 0, 0.05);
        transform: translateY(20px);
        opacity: 0;
        animation: fadeInUp 0.5s forwards;
    }

    @keyframes fadeInUp {
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    .candidate-card:hover {
        transform: translateY(-5px) scale(1.02);
        box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
    }

    .candidate-header {
        background: linear-gradient(135deg, var(--primary), #7C3AED);
        height: 120px;
        width: 100%;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 1;
        border-radius: 12px 12px 0 0;
        box-shadow: inset 0 -4px 8px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }
    
    .candidate-card:hover .candidate-header {
        height: 130px;
    }
    
    .hero-section {
        background: linear-gradient(135deg, var(--primary), #7C3AED);
        padding: 4rem 0;
        border-radius: 0 0 100px 100px;
        margin-bottom: 2rem;
        position: relative;
        overflow: hidden;
    }

    .hero-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100" preserveAspectRatio="none"><path fill="rgba(255,255,255,0.05)" d="M0,0 L100,0 L100,100 L0,100 Z" /></svg>');
        background-size: cover;
        animation: wave 15s linear infinite;
    }

    @keyframes wave {
        0% { background-position: 0 0; }
        100% { background-position: 100% 0; }
    }

    .hero-section h2 {
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        position: relative;
    }

    .hero-section .btn-light {
        background-color: rgba(255, 255, 255, 0.9);
        transition: all 0.3s;
        position: relative;
        overflow: hidden;
    }

    .hero-section .btn-light:hover {
        background-color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .hero-section .btn-light::after {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: linear-gradient(to right, transparent, rgba(0, 0, 0, 0.05), transparent);
        transform: translateX(-100%);
        transition: all 0.6s ease;
    }

    .hero-section .btn-light:hover::after {
        transform: translateX(100%);
    }

    .profile-img-container {
        width: 100px;
        height: 100px;
        border-radius: 50%;
        border: 4px solid white;
        overflow: hidden;
        margin: 0 auto;
        background: white;
        position: absolute;
        top: 60px;
        left: 50%;
        transform: translateX(-50%);
        z-index: 2;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        transition: all 0.3s ease;
    }

    .candidate-card:hover .profile-img-container {
        transform: translateX(-50%) scale(1.05);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    }

    .profile-img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: all 0.3s ease;
    }

    .candidate-card:hover .profile-img {
        transform: scale(1.05);
    }

    .candidate-body {
        padding: 2rem;
        padding-top: 70px;
        position: relative;
        z-index: 1;
    }

    .candidate-name {
        font-weight: 600;
        text-align: center;
        margin-bottom: 0.5rem;
        transition: all 0.3s ease;
    }

    .candidate-card:hover .candidate-name {
        color: var(--primary);
    }

    .candidate-title {
        text-align: center;
        color: #6B7280;
        margin-bottom: 1.5rem;
        font-size: 0.9rem;
    }

    .section-title {
        font-size: 0.8rem;
        text-transform: uppercase;
        color: var(--primary);
        font-weight: 600;
        margin-bottom: 0.75rem;
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
        transition: width 0.3s ease;
    }

    .candidate-card:hover .section-title::after {
        width: 50px;
    }

    .about-text {
        font-size: 0.9rem;
        line-height: 1.6;
        color: #4B5563;
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
        transition: all 0.2s ease;
    }

    .skill-badge:hover {
        background-color: var(--primary);
        color: white;
        transform: translateY(-2px);
    }

    .meta-item {
        display: flex;
        align-items: center;
        margin-bottom: 0.75rem;
        font-size: 0.9rem;
        transition: all 0.2s ease;
    }

    .meta-item:hover {
        color: var(--primary);
    }

    .meta-item i {
        margin-right: 0.75rem;
        color: var(--primary);
        width: 20px;
        text-align: center;
        transition: all 0.2s ease;
    }

    .meta-item:hover i {
        transform: scale(1.2);
    }

    .btn-view-resume {
        background-color: var(--primary);
        color: white;
        width: 100%;
        margin-top: 1rem;
        transition: all 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .btn-view-resume:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .btn-view-resume::after {
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

    .btn-view-resume:hover::after {
        transform: translateX(100%);
    }

    .status-badge {
        position: absolute;
        top: 1rem;
        right: 1rem;
        font-size: 0.7rem;
        padding: 0.25rem 0.75rem;
        border-radius: 50px;
        transition: all 0.3s ease;
    }

    .candidate-card:hover .status-badge {
        transform: scale(1.1);
    }

    .status-active {
        background-color: var(--success);
        color: white;
    }

    .status-inactive {
        background-color: #EF4444;
        color: white;
    }

    .experience-badge {
        background-color: rgba(79, 70, 229, 0.1);
        color: var(--primary);
        padding: 0.5rem 1rem;
        border-radius: 8px;
        font-weight: 500;
        display: inline-block;
        margin-bottom: 1rem;
        transition: all 0.3s ease;
    }

    .candidate-card:hover .experience-badge {
        background-color: rgba(79, 70, 229, 0.2);
        transform: translateY(-2px);
    }

    .filter-container {
        position: sticky;
        top: 20px;
        transition: all 0.3s ease;
    }

    .filter-container:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }

    .filter-card {
        background: rgba(255, 255, 255, 0.9);
        backdrop-filter: blur(5px);
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
    }

    .filter-card:hover {
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
    }

    .page-title {
        color: white;
        text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        position: relative;
        display: inline-block;
    }

    .page-title::after {
        content: '';
        position: absolute;
        bottom: -10px;
        left: 0;
        width: 50px;
        height: 3px;
        background: white;
        animation: expandLine 1s forwards;
    }

    @keyframes expandLine {
        from { width: 0; }
        to { width: 50px; }
    }

    .page-subtitle {
        color: rgba(255, 255, 255, 0.9);
    }

    @media (max-width: 768px) {
        .candidate-card {
            padding-top: 80px;
        }
        
        .profile-img-container {
            width: 90px;
            height: 90px;
            top: 50px;
        }
        
        .candidate-body {
            padding-top: 60px;
        }
        
        .filter-container {
            position: static;
            margin-bottom: 2rem;
        }
    }

    /* Pagination animation */
    .page-item {
        transition: all 0.3s ease;
    }

    .page-item:hover {
        transform: translateY(-2px);
    }

    .page-link {
        transition: all 0.3s ease;
    }

    .page-link:hover {
        background-color: rgba(255, 255, 255, 0.2);
    }

    /* Empty state animation */
    .empty-state {
        animation: pulse 2s infinite;
    }

    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.02); }
        100% { transform: scale(1); }
    }

    /* Button animations */
    .btn-primary {
        position: relative;
        overflow: hidden;
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

    /* Alert animation */
    .alert {
        transition: all 0.5s ease;
    }

    .alert-info {
        background-color: rgba(79, 70, 229, 0.2);
        border-color: rgba(79, 70, 229, 0.3);
        backdrop-filter: blur(5px);
    }
    </style>
</head>

<body>
    <jsp:include page="navbar.jsp" />
	
<div class="hero-section bg-primary text-white py-5 animate__animated animate__fadeIn">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="display-5 fw-bold mb-3 animate__animated animate__fadeInDown">Employers!</h2>
                <p class="lead mb-4 animate__animated animate__fadeIn animate__delay-1s">Let's hire your next great candidate. Fast.</p>
                <a href="postAJob.jsp" class="btn btn-light btn-lg px-4 animate__animated animate__fadeInUp animate__delay-2s" style="color: #515ada;">Post A Job</a>
            </div>
        </div>
    </div>
</div>

    <div class="container py-5">
        <div class="row mb-5">
            <div class="col-12">
                <h1 class="fw-bold page-title animate__animated animate__fadeIn">Candidate Dashboard</h1>
                <p class="lead mb-4 page-subtitle animate__animated animate__fadeIn animate__delay-1s">Browse and connect with talented professionals</p>
            </div>
        </div>

        <c:if test="${not empty param.skills or not empty param.experience or not empty param.status}">
            <div class="alert alert-info mb-4 animate__animated animate__fadeIn">
                Showing filtered results:
                <c:if test="${not empty param.skills}">Skills: ${param.skills}</c:if>
                <c:if test="${not empty param.experience}"> | Experience: ${param.experience}</c:if>
                <c:if test="${not empty param.status}"> | Status: ${param.status}</c:if>
            </div>
        </c:if>

        <div class="row">
            <!-- Filters Column -->
            <div class="col-lg-4 col-md-5 mb-4">
                <div class="filter-container animate__animated animate__fadeInLeft">
                    <div class="card shadow-sm filter-card">
                        <div class="card-body">
                            <h5 class="card-title">Filters</h5>
                            <form action="employerDashboard" method="get">
                                <input type="hidden" name="filter" value="true">
                                
                                <div class="mb-3">
                                    <label class="form-label">Skills</label>
                                    <input type="text" name="skills" class="form-control" 
                                        placeholder="e.g. Java, Python" 
                                        value="${param.skills}">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Experience</label>
                                    <select name="experience" class="form-select">
                                        <option value="Any" ${param.experience == 'Any' ? 'selected' : ''}>Any</option>
                                        <option value="0-2" ${param.experience == '0-2' ? 'selected' : ''}>0-2 years</option>
                                        <option value="2-5" ${param.experience == '2-5' ? 'selected' : ''}>2-5 years</option>
                                        <option value="5+" ${param.experience == '5+' ? 'selected' : ''}>5+ years</option>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Status</label>
                                    <select name="status" class="form-select">
                                        <option value="Any" ${param.status == 'Any' ? 'selected' : ''}>Any</option>
                                        <option value="Available" ${param.status == 'Available' ? 'selected' : ''}>Available</option>
                                        <option value="Hired" ${param.status == 'Hired' ? 'selected' : ''}>Hired</option>
                                    </select>
                                </div>
                                
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="bi bi-funnel"></i> Apply Filters
                                </button>
                                
                                <c:if test="${not empty param.skills or not empty param.experience or not empty param.status}">
                                    <a href="employerDashboard" class="btn btn-outline-secondary w-100 mt-2">
                                        <i class="bi bi-x-circle"></i> Clear Filters
                                    </a>
                                </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Candidates Column -->
            <div class="col-lg-8 col-md-7">
                <c:choose>
                    <c:when test="${empty seekerList}">
                        <div class="card shadow-sm empty-state animate__animated animate__pulse">
                            <div class="card-body text-center py-5">
                                <i class="bi bi-people-fill" style="font-size: 3rem; color: #D1D5DB;"></i>
                                <h4 class="mt-3">No candidates found</h4>
                                <p class="text-muted">Try adjusting your search filters</p>
                                <a href="employerDashboard" class="btn btn-outline-primary mt-2">Reset Filters</a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="row">
                            <c:forEach var="seeker" items="${seekerList}" varStatus="loop">
                                <div class="col-12 mb-4">
                                    <div class="candidate-card" style="animation-delay: ${loop.index * 0.1}s">
                                        <div class="candidate-header">
                                            <span class="status-badge ${seeker.status eq 'Available' ? 'status-active' : 'status-inactive'}">
                                                ${seeker.status}
                                            </span>
                                        </div>
                                        <div class="profile-img-container">
                                            <img src="${seeker.profilePicture != null ? seeker.profilePicture : 
                                                'https://ui-avatars.com/api/?name=' += seeker.fullName += '&background=4F46E5&color=fff&size=200'}" 
                                                class="profile-img" 
                                                alt="${seeker.fullName}">
                                        </div>
                                        <div class="candidate-body">
                                            <h4 class="candidate-name">${seeker.fullName}</h4>
                                            <div class="candidate-title">
                                                <span class="experience-badge">
                                                    <i class="bi bi-award"></i> ${seeker.experience} years experience
                                                </span>
                                            </div>
                                            
                                            <div class="mb-4">
                                                <h6 class="section-title">About</h6>
                                                <p class="about-text">
                                                    ${seeker.about != null ? seeker.about : 'No description provided.'}
                                                </p>
                                            </div>
                                            
                                            <div class="mb-4">
                                                <h6 class="section-title">Skills</h6>
                                                <div>
                                                    <c:forTokens items="${seeker.skills}" delims="," var="skill">
                                                        <span class="skill-badge">${skill}</span>
                                                    </c:forTokens>
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <h6 class="section-title">Contact</h6>
                                                    <div class="meta-item">
                                                        <i class="bi bi-envelope"></i> ${seeker.email}
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <h6 class="section-title">Actions</h6>
                                                    <a href="hireSeeker?id=${seeker.id}" class="btn btn-primary me-2">
                                                        <i class="bi bi-person-plus"></i> Hire
                                                    </a>
                                                    <c:if test="${not empty seeker.resumeLink}">
                                                        <a href="${seeker.resumeLink}" target="_blank" class="btn btn-outline-primary">
                                                            <i class="bi bi-file-earmark-text"></i> Resume
                                                        </a>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        
                        <nav aria-label="Page navigation" class="animate__animated animate__fadeIn">
                            <ul class="pagination justify-content-center">
                                <li class="page-item disabled">
                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item">
                                    <a class="page-link" href="#">Next</a>
                                </li>
                            </ul>
                        </nav>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add hover effect to candidate cards
        document.querySelectorAll('.candidate-card').forEach(card => {
            card.addEventListener('mouseenter', () => {
                card.classList.add('animate__animated', 'animate__pulse');
            });
            card.addEventListener('mouseleave', () => {
                card.classList.remove('animate__animated', 'animate__pulse');
            });
        });

        // Add animation to filter form submission
        document.querySelector('form').addEventListener('submit', function(e) {
            const btn = this.querySelector('button[type="submit"]');
            btn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Applying Filters...';
            btn.disabled = true;
            
            // Simulate loading for demo (remove in production)
            setTimeout(() => {
                btn.innerHTML = '<i class="bi bi-funnel"></i> Apply Filters';
                btn.disabled = false;
            }, 1500);
        });
    </script>
</body>
</html>