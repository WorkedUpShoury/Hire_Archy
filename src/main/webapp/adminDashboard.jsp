<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
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
            --warning: #F59E0B;
            --danger: #EF4444;
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
                radial-gradient(circle at 20% 30%, rgba(79, 70, 229, 0.05) 0%, transparent 20%),
                radial-gradient(circle at 80% 70%, rgba(16, 185, 129, 0.05) 0%, transparent 20%);
            z-index: -1;
            animation: pulseBackground 15s infinite alternate;
        }

        @keyframes pulseBackground {
            0% { opacity: 0.3; }
            100% { opacity: 0.7; }
        }

        .container-fluid {
            padding: 0;
        }

        .main-content {
            padding: 20px;
            transition: all 0.3s ease;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            overflow: hidden;
            margin-bottom: 24px;
            background-color: white;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            backdrop-filter: blur(5px);
            transition: all 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            border-bottom: none;
            padding: 16px 20px;
            position: relative;
            overflow: hidden;
        }

        .card-header::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(to right, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: translateX(-100%);
            transition: all 0.6s ease;
        }

        .card:hover .card-header::after {
            transform: translateX(100%);
        }

        .card-header h5 {
            font-weight: 600;
            margin: 0;
            position: relative;
        }

        .card-header h5 i {
            margin-right: 10px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
        }

        th {
            background-color: var(--light);
            color: var(--dark);
            font-weight: 500;
            padding: 12px 15px;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        td {
            padding: 12px 15px;
            vertical-align: middle;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        }

        tr {
            transition: all 0.2s ease;
        }

        tr:hover {
            background-color: rgba(79, 70, 229, 0.03);
            transform: translateX(5px);
        }

        .badge {
            font-weight: 500;
            padding: 5px 10px;
            border-radius: 50px;
            font-size: 0.75rem;
            text-transform: capitalize;
        }

        .bg-primary {
            background-color: var(--primary) !important;
        }

        .bg-success {
            background-color: var(--success) !important;
        }

        .bg-warning {
            background-color: var(--warning) !important;
        }

        .bg-danger {
            background-color: var(--danger) !important;
        }

        .bg-secondary {
            background-color: #6B7280 !important;
        }

        .bg-info {
            background-color: #0EA5E9 !important;
        }

        .btn {
            border-radius: 8px;
            font-weight: 500;
            padding: 8px 16px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn::after {
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

        .btn:hover::after {
            transform: translateX(100%);
        }

        .btn-sm {
            padding: 5px 10px;
            font-size: 0.8rem;
        }

        .form-select {
            border-radius: 8px;
            padding: 8px 12px;
            transition: all 0.3s ease;
            border: 1px solid rgba(0, 0, 0, 0.1);
        }

        .form-select:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(79, 70, 229, 0.25);
        }

        .form-select-sm {
            padding: 5px 10px;
            font-size: 0.8rem;
        }

        .d-flex.justify-content-between {
            padding: 20px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            margin-bottom: 24px;
        }

        .h2 {
            font-weight: 600;
            color: var(--dark);
            position: relative;
            display: inline-block;
        }

        .h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 3px;
            background: var(--primary);
            animation: expandLine 1s forwards;
        }

        @keyframes expandLine {
            from { width: 0; }
            to { width: 50px; }
        }

        .btn-toolbar .badge {
            font-size: 0.9rem;
            padding: 8px 12px;
            border-radius: 8px;
        }

        .text-muted {
            color: #6B7280 !important;
        }

        /* Animation for table rows */
        tr {
            opacity: 0;
            animation: fadeIn 0.5s forwards;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        /* Staggered animation */
        tr:nth-child(1) { animation-delay: 0.1s; }
        tr:nth-child(2) { animation-delay: 0.2s; }
        tr:nth-child(3) { animation-delay: 0.3s; }
        tr:nth-child(4) { animation-delay: 0.4s; }
        tr:nth-child(5) { animation-delay: 0.5s; }
        tr:nth-child(6) { animation-delay: 0.6s; }
        tr:nth-child(7) { animation-delay: 0.7s; }
        tr:nth-child(8) { animation-delay: 0.8s; }
        tr:nth-child(9) { animation-delay: 0.9s; }
        tr:nth-child(10) { animation-delay: 1.0s; }

        /* Empty state animation */
        .empty-state {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.02); }
            100% { transform: scale(1); }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .card-header h5 {
                font-size: 1rem;
            }
            
            th, td {
                padding: 8px 10px;
                font-size: 0.85rem;
            }
            
            .btn-sm {
                padding: 4px 8px;
                font-size: 0.75rem;
            }
            
            .form-select-sm {
                padding: 4px 8px;
                font-size: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container-fluid mt-4">
        <main class="px-md-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom animate__animated animate__fadeIn">
                <h1 class="h2" style = "font-size: 1.25rem;">Admin Dashboard</h1>
                <div class="btn-toolbar mb-2 mb-md-0">
                    <div class="btn-group me-2">
                        <span class="badge bg-primary animate__animated animate__pulse animate__infinite">
                            <i class="bi bi-people-fill me-1"></i> ${applications.size()} Applications
                        </span>
                        <span class="badge bg-warning text-dark ms-2 animate__animated animate__pulse animate__infinite">
                            <i class="bi bi-clock-history me-1"></i> ${pendingUsers.size()} Pending Users
                        </span>
                    </div>
                </div>
            </div>

            <!-- Pending Users Section -->
            <div class="card mb-4 animate__animated animate__fadeInUp">
                <div class="card-header">
                    <h5 style = "color: white;"><i class="bi bi-people-fill me-2" style = "color: white;"></i>Pending User Approvals</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Role</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty pendingUsers}">
                                        <c:forEach var="user" items="${pendingUsers}" varStatus="loop">
                                            <tr class="animate__animated animate__fadeIn" style="animation-delay: ${loop.index * 0.1}s">
                                                <td>${user.id}</td>
                                                <td>${user.name}</td>
                                                <td>${user.email}</td>
                                                <td>
                                                    <span class="badge 
                                                        ${user.role == 'admin' ? 'bg-danger' : ''}
                                                        ${user.role == 'employer' ? 'bg-primary' : ''}
                                                        ${user.role == 'candidate' ? 'bg-success' : ''}">
                                                        ${user.role}
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="badge bg-warning text-dark">Pending</span>
                                                </td>
                                                <td>
                                                    <form method="post" action="adminDashboard" class="d-inline">
                                                        <input type="hidden" name="action" value="approveUser">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <button type="submit" class="btn btn-sm btn-success">
                                                            <i class="bi bi-check-circle"></i> Approve
                                                        </button>
                                                    </form>
                                                    <form method="post" action="adminDashboard" class="d-inline ms-1">
                                                        <input type="hidden" name="action" value="rejectUser">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <button type="submit" class="btn btn-sm btn-danger">
                                                            <i class="bi bi-x-circle"></i> Reject
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr class="animate__animated animate__fadeIn">
                                            <td colspan="6" class="text-center text-muted empty-state">
                                                <i class="bi bi-emoji-frown" style="font-size: 2rem;"></i>
                                                <p class="mt-2">No pending users.</p>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Job Applications Section -->
            <div class="card animate__animated animate__fadeInUp animate__delay-1s">
                <div class="card-header">
                    <h5 style = "color: white;"><i class="bi bi-file-earmark-text-fill me-2" style = "color: white;"></i>Job Applications</h5>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th>Applicant</th>
                                    <th>Job Title</th>
                                    <th>Company</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty applications}">
                                        <c:forEach var="app" items="${applications}" varStatus="loop">
                                            <tr class="animate__animated animate__fadeIn" style="animation-delay: ${loop.index * 0.1 + 0.2}s">
                                                <td>${app.applicantName}</td>
                                                <td>${app.jobTitle}</td>
                                                <td>${app.companyName}</td>
                                                <td>
                                                    <span class="badge 
                                                        ${app.status == 'submitted' ? 'bg-secondary' : ''}
                                                        ${app.status == 'reviewed' ? 'bg-info' : ''}
                                                        ${app.status == 'shortlisted' ? 'bg-primary' : ''}
                                                        ${app.status == 'rejected' ? 'bg-danger' : ''}
                                                        ${app.status == 'hired' ? 'bg-success' : ''}">
                                                        ${app.status}
                                                    </span>
                                                </td>
                                                <td>
                                                    <form method="post" action="adminDashboard" class="d-inline">
                                                        <input type="hidden" name="action" value="updateApplicationStatus">
                                                        <input type="hidden" name="applicationId" value="${app.id}">
                                                        <select name="status" class="form-select form-select-sm" onchange="this.form.submit()">
                                                            <option value="submitted" ${app.status == 'submitted' ? 'selected' : ''}>Submitted</option>
                                                            <option value="reviewed" ${app.status == 'reviewed' ? 'selected' : ''}>Reviewed</option>
                                                            <option value="shortlisted" ${app.status == 'shortlisted' ? 'selected' : ''}>Shortlisted</option>
                                                            <option value="rejected" ${app.status == 'rejected' ? 'selected' : ''}>Rejected</option>
                                                            <option value="hired" ${app.status == 'hired' ? 'selected' : ''}>Hired</option>
                                                        </select>
                                                    </form>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr class="animate__animated animate__fadeIn">
                                            <td colspan="5" class="text-center text-muted empty-state">
                                                <i class="bi bi-emoji-frown" style="font-size: 2rem;"></i>
                                                <p class="mt-2">No job applications found.</p>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <jsp:include page="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add hover effect to table rows
        document.querySelectorAll('tr').forEach(row => {
            row.addEventListener('mouseenter', () => {
                row.classList.add('animate__animated', 'animate__pulse');
            });
            row.addEventListener('mouseleave', () => {
                row.classList.remove('animate__animated', 'animate__pulse');
            });
        });

        // Add loading state to buttons
        document.querySelectorAll('form').forEach(form => {
            form.addEventListener('submit', function(e) {
                const buttons = this.querySelectorAll('button[type="submit"]');
                buttons.forEach(btn => {
                    btn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Processing...';
                    btn.disabled = true;
                });
            });
        });

        // Add animation to status badges when they change
        document.querySelectorAll('select[name="status"]').forEach(select => {
            select.addEventListener('change', function() {
                const badge = this.closest('tr').querySelector('.badge');
                badge.classList.add('animate__animated', 'animate__rubberBand');
                
                // Remove animation class after animation completes
                setTimeout(() => {
                    badge.classList.remove('animate__animated', 'animate__rubberBand');
                }, 1000);
            });
        });
    </script>
</body>
</html>