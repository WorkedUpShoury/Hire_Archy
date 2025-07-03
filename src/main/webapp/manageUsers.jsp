<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Manage Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #121212;
            color: white;
        }
        .navbar, .sidebar {
            background-color: #0d6efd;
        }
        .nav-link {
            color: white;
        }
        .nav-link.active {
            background-color: #0b5ed7;
            border-radius: 8px;
            padding: 6px 12px;
            color: white !important;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            padding-top: 20px;
            border-right: 1px solid #333;
        }
        .sidebar .nav-link {
            color: #9ecbff;
        }
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        .card {
            background-color: #1f1f1f;
            border: 1px solid #333;
        }
        .card-title, .card-text {
            color: #fff;
        }
        .table {
            color: white;
        }
        .btn-edit, .btn-delete {
            color: white;
        }
        .btn-edit {
            background-color: #198754;
        }
        .btn-delete {
            background-color: #dc3545;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h3 class="text-center text-white mb-4">Admin Panel</h3>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link" href="adminDashboard.jsp">Dashboard</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="manageJobs.jsp">Manage Job Postings</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="manageUsers.jsp">Manage Users</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="reports.jsp">Reports</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="settings.jsp">Settings</a>
        </li>
    </ul>
</div>

<div class="main-content">
    <header class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
        <div class="container">
            <a class="navbar-brand" href="#">HireArchy Admin</a>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </header>

    <div class="container mt-4">
        <h3 class="mb-4">Manage Users</h3>
        <table class="table table-dark table-hover">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Sample Rows -->
                <tr>
                    <td>101</td>
                    <td>Neha Sharma</td>
                    <td>neha@example.com</td>
                    <td>Job Seeker</td>
                    <td>
                        <button class="btn btn-edit btn-sm">Edit</button>
                        <button class="btn btn-delete btn-sm">Delete</button>
                    </td>
                </tr>
                <tr>
                    <td>102</td>
                    <td>Ravi Mehta</td>
                    <td>ravi@example.com</td>
                    <td>Recruiter</td>
                    <td>
                        <button class="btn btn-edit btn-sm">Edit</button>
                        <button class="btn btn-delete btn-sm">Delete</button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
