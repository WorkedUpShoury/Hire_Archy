<!-- navbar.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Bootstrap CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #1f1f1f; padding: 10px 20px;">
    <div class="container-fluid">
        <!-- Logo Image -->
        <a class="navbar-brand d-flex align-items-center" href="#">
            <img src="images/onlylogo.png" alt="Logo" width="32" height="32" class="me-2">
        </a>

        <!-- Navigation Links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-3">
                <li class="nav-item">
                    <a class="nav-link" href="seekerDashboard">Find Jobs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="employerDashboard">Hire Employees</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="adminDashboard">Admin</a>
                </li>
            </ul>
        </div>

       

   <!-- Profile Dropdown -->
<div class="dropdown ms-3">
    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="profileDropdown" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="images/profilepicture.png" alt="Profile" width="35" height="35" class="rounded-circle">
        <span class="ms-2">Walter White</span> <!-- Add profile name here -->
    </a>
    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-dark" aria-labelledby="profileDropdown">
        <li><a class="dropdown-item" href="seekerProfile.jsp">Profile</a></li>
        <li><a class="dropdown-item" href="#">Settings</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="login.jsp">Logout</a></li>
    </ul>
</div>





    </div>
</nav>

<!-- Bootstrap Bundle JS CDN -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
