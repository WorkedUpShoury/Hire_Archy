<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.jobportal.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>
        <% 
            User user = (User) request.getAttribute("user");
            if (user != null && user.getFullName() != null) {
                out.print(user.getFullName() + "'s Profile");
            } else {
                out.print("User Profile");
            }
        %>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        :root {
            --primary-blue: #1a67a3;
            --secondary-blue: #46b5e5;
            --dark-accent: #2c3e50;
            --glass-bg: rgba(255, 255, 255, 0.15);
            --glass-border: rgba(255, 255, 255, 0.2);
        }
        
        body {
            background: linear-gradient(135deg, #e0f7fa 0%, #b2ebf2 50%, #80deea 100%);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
        }
        
        /* Glass Morphism Effects */
        .glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border: 1px solid var(--glass-border);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border-radius: 16px;
        }
        
        .glass-nav {
            background: rgba(255, 255, 255, 0.7) !important;
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
        }
        
        /* Animated Gradient Border */
        .profile-img-container {
            position: relative;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            padding: 5px;
            background: linear-gradient(45deg, 
                var(--primary-blue), 
                var(--secondary-blue),
                #4dd0e1,
                var(--primary-blue));
            background-size: 300% 300%;
            animation: gradientBorder 4s ease infinite;
            margin: 0 auto;
            margin-top: -90px;
            z-index: 2;
        }
        
        @keyframes gradientBorder {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        
        .profile-img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid white;
        }
        
        /* Banner with Gradient Overlay */
        .banner-container {
            position: relative;
            height: 300px;
            overflow: hidden;
            border-radius: 0 0 120px 120px;
        }
        
        .banner-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .banner-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to bottom, 
                rgba(26, 103, 163, 0.6) 0%, 
                rgba(70, 181, 229, 0.8) 100%);
        }
        
        /* Tabs with Glass Effect */
        .profile-tabs {
            display: flex;
            justify-content: center;
            background: var(--glass-bg);
            backdrop-filter: blur(12px);
            border-radius: 12px;
            padding: 8px;
            margin: 30px auto;
            max-width: 600px;
            border: 1px solid var(--glass-border);
        }
        
        .profile-tabs .nav-link {
            color: var(--dark-accent);
            font-weight: 600;
            padding: 10px 20px;
            border-radius: 8px;
            margin: 0 5px;
            transition: all 0.3s ease;
        }
        
        .profile-tabs .nav-link.active {
            background: rgba(255, 255, 255, 0.7);
            color: var(--primary-blue);
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        /* Status Badge with Pulse Animation */
        .status-badge {
            display: inline-flex;
            align-items: center;
            background: rgba(46, 125, 50, 0.9);
            color: white;
            padding: 8px 20px;
            border-radius: 20px;
            font-weight: 600;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
        
        /* Form Styles */
        .form-section {
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(12px);
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            border: 1px solid var(--glass-border);
            transition: transform 0.3s ease;
        }
        
        .form-section:hover {
            transform: translateY(-5px);
        }
        
        .form-control, .form-select {
            border-radius: 10px;
            padding: 12px 18px;
            border: 1px solid var(--glass-border);
            background: rgba(255, 255, 255, 0.7);
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            background: white;
            border-color: var(--primary-blue);
            box-shadow: 0 0 0 0.25rem rgba(26, 103, 163, 0.25);
        }
        
        /* Button with Gradient */
        .btn-primary {
            background: linear-gradient(45deg, 
                var(--primary-blue), 
                var(--secondary-blue));
            border: none;
            padding: 12px 30px;
            border-radius: 10px;
            font-weight: 600;
            box-shadow: 0 4px 15px rgba(26, 103, 163, 0.4);
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(26, 103, 163, 0.6);
            background: linear-gradient(45deg, 
                var(--secondary-blue),
                var(--primary-blue));
        }
        
        /* Floating Animation */
        .floating {
            animation: floating 3s ease-in-out infinite;
        }
        
        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        
        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .banner-container {
                height: 250px;
                border-radius: 0 0 80px 80px;
            }
            .profile-img-container {
                width: 140px;
                height: 140px;
                margin-top: -70px;
            }
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<%-- <%
	if (user == null) {
	    response.sendRedirect("login.jsp");
	    return;
	}
%> --%>

<!-- Banner Section with Gradient Overlay -->
<div class="banner-container">
    <img src="images/banner6.jpg?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80" class="banner-img" alt="Chemistry lab banner">
    <div class="banner-overlay"></div>
</div>

<!-- Profile Image with Animated Border -->
<div class="profile-img-container">
    <img src="images/profilepicture.png" 
         class="profile-img" 
         alt="${not empty user.fullName ? user.fullName : 'User Profile'}">
</div>
<!-- Profile Info Section -->
<div class="container text-center animate__animated animate__fadeIn">
    <h1 class="fw-bold mb-3" style="color: var(--dark-accent);">${not empty user.fullName ? user.fullName : ''}</h1>
    <div class="status-badge mb-4">● ${not empty user.workStatus ? user.workStatus : 'Available for Consulting'}</div>
</div>

<!-- Profile Edit Form -->
<div class="container my-5">
    <div class="form-section animate__animated animate__fadeInUp">
        <h3 class="text-center mb-4" style="color: var(--primary-blue);">User Profile</h3>
        <form action="SeekerProfileServlet" method="post" enctype="multipart/form-data">
           <div class="row mb-4">
    <div class="col-md-6 mb-3">
        <label class="form-label">Full Name</label>
        <input type="text" name="fullName" class="form-control" 
               value="${not empty user.fullName ? user.fullName : ''}" required>
    </div>
    <div class="col-md-6 mb-3">
        <label class="form-label">Profession</label>
        <input type="text" name="profession" class="form-control" 
               value="${not empty user.professionalTitles ? user.professionalTitles : ''}" required>
    </div>
</div>
            
            <div class="row mb-4">
                <div class="col-md-6 mb-3">
    <label class="form-label">Experience Level</label>
    <select name="experienceLevel" class="form-select">
        <option value="Fresher" ${user.experienceRange eq 'Fresher' ? 'selected' : ''}>Fresher</option>
        <option value="1-3 years" ${user.experienceRange eq '1-3 years' ? 'selected' : ''}>1-3 years</option>
        <option value="3-5 years" ${user.experienceRange eq '3-5 years' ? 'selected' : ''}>3-5 years</option>
        <option value="5+ years" ${user.experienceRange eq '5+ years' ? 'selected' : ''}>5+ years</option>
    </select>
</div>
                <div class="col-md-6 mb-3">
    <label class="form-label">Location</label>
    <input type="text" name="location" class="form-control" 
           value="${not empty user.location ? user.location : ''}">
</div>

<div class="mb-4">
    <label class="form-label">Specialization</label>
    <input type="text" name="specialization" class="form-control" 
           value="${not empty user.specialization ? user.specialization : ''}">
</div>

<div class="mb-4">
    <label class="form-label">Contact</label>
    <input type="text" name="contact" class="form-control" 
           value="${not empty user.contactInstruction ? user.contactInstruction : ''}">
</div>

<div class="row mb-4">
    <div class="col-md-6 mb-3">
        <label class="form-label">Profile Photo</label>
        <input type="file" name="profilePhoto" class="form-control" accept="image/*">
        <c:if test="${not empty user.profilePhotoPath}">
            <small class="text-muted">Current: ${user.profilePhotoPath}</small>
        </c:if>
    </div>
    <div class="col-md-6 mb-3">
        <label class="form-label">Photos</label>
        <input type="file" name="labPhotos" class="form-control" accept="image/*" multiple>
        <c:if test="${not empty user.labPhotosPaths}">
            <small class="text-muted">Current: ${user.labPhotosPaths}</small>
        </c:if>
    </div>
</div>

<div class="mb-4">
    <label class="form-label">Professional Statement</label>
    <textarea name="about" rows="5" class="form-control">${not empty user.professionalStatement ? user.professionalStatement : ''}</textarea>
</div>
            
            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary px-5 py-2">Update Profile</button>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>