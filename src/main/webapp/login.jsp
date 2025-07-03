<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login to HireArchy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #8e2de2;       /* Neon Purple */
            --secondary-color: #4a00e0;     /* Deep Blue */
            --accent-color: #00f0ff;        /* Neon Cyan */
            --dark-color: #1a1a2e;          /* Dark Navy */
            --light-color: #f4f4f4;         /* Soft Light */
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0.8)),
                        url('images/bgbanner.png');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: var(--light-color);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 2.5rem;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            width: 900px;
            animation: fadeIn 0.8s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-card:hover {
            box-shadow: 0 20px 40px rgba(0, 255, 255, 0.2);
            transform: translateY(-5px);
        }

        .login-title {
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: white;
        }

        .btn-primary {
            background: linear-gradient(90deg, #00f0ff 0%, #8e2de2 100%);
            border: none;
            padding: 0.8rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 255, 255, 0.3);
            color: #fff;
            width: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 255, 255, 0.5);
            background: linear-gradient(45deg, var(--secondary-color), var(--primary-color));
        }

        .btn-outline-primary {
            border-color: white;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-outline-primary:hover {
            background: rgba(142, 45, 226, 0.1);
            border-color: var(--accent-color);
            color: var(--accent-color);
            transform: translateY(-3px);
        }

        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: var(--light-color);
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(0, 240, 255, 0.25);
            color: white;
        }

        .show-password-btn {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--accent-color);
            background: none;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .show-password-btn:hover {
            color: var(--primary-color);
            transform: translateY(-50%) scale(1.1);
        }

        .divider {
            display: flex;
            align-items: center;
            text-align: center;
            color: var(--accent-color);
            margin: 20px 0;
        }

        .divider::before, .divider::after {
            content: "";
            flex: 1;
            border-bottom: 1px solid rgba(0, 240, 255, 0.3);
        }

        .divider::before {
            margin-right: 1em;
        }

        .divider::after {
            margin-left: 1em;
        }

        .feature-list li {
            margin-bottom: 1rem;
            position: relative;
            padding-left: 1.5rem;
            transition: all 0.3s ease;
        }

        .feature-list li:hover {
            color: var(--accent-color);
            transform: translateX(5px);
        }

        .feature-list li::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0.5rem;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: linear-gradient(to right, var(--accent-color), var(--primary-color));
            animation: pulse 2s infinite;
        }

        .alert-danger {
            background: rgba(255, 0, 0, 0.2);
            border: 1px solid rgba(255, 0, 0, 0.3);
            backdrop-filter: blur(5px);
            color: #ff6b6b;
        }

        .google-btn {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            transition: all 0.3s ease;
        }

        .google-btn:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-3px);
            border-color: var(--accent-color);
        }

        .floating {
            animation: floating 3s ease-in-out infinite;
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.7; }
            50% { transform: scale(1.05); opacity: 1; }
            100% { transform: scale(1); opacity: 0.7; }
        }
    </style>
</head>
<body>
<div class="login-card row">
    <div class="col-md-6 border-end border-secondary pe-4">
        <h3 class="login-title">New to HireArchy?</h3>
        <ul class="feature-list list-unstyled mt-4">
            <li>One click apply using HireArchy profile</li>
            <li>Get relevant job recommendations</li>
            <li>Showcase profile to top companies and consultants</li>
            <li>Know application status on applied jobs</li>
        </ul>
        <div class="text-center mt-4 floating">
            <a href="register.jsp" class="btn btn-outline-primary px-4 py-2">Register for Free</a>
        </div>
    </div>
    <div class="col-md-6 ps-4">
        <h3 class="login-title">Login</h3>

        <!-- Display error message -->
        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger mb-3"><%= request.getAttribute("error") %></div>
        <% } %>

        <form action="loginServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email ID / Username</label>
                <input type="text" name="email" id="email" class="form-control" required>
            </div>
            <div class="mb-3 position-relative">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" id="password" class="form-control pe-4" required>
                <button type="button" class="show-password-btn" onclick="togglePassword()">
                    <i class="bi bi-eye"></i>
                </button>
            </div>
            <div class="mb-3 text-end">
                <a href="forgotPassword.jsp" class="text-decoration-none" style="color: var(--accent-color);">Forgot Password?</a>
            </div>
            <button type="submit" class="btn btn-primary mb-3">Login</button>
        </form>

        <div class="text-center my-3">
            <a href="otpLogin.jsp" class="text-decoration-none" style="color: var(--accent-color);">Use OTP to Login</a>
        </div>

        <div class="divider">or</div>

        <button class="btn google-btn d-flex align-items-center justify-content-center">
            <img src="https://developers.google.com/identity/images/g-logo.png" style="width:18px; margin-right:10px;">
            Sign in with Google
        </button>
    </div>
</div>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

<script>
    function togglePassword() {
        const password = document.getElementById("password");
        const icon = document.querySelector('.show-password-btn i');
        if (password.type === "password") {
            password.type = "text";
            icon.classList.remove('bi-eye');
            icon.classList.add('bi-eye-slash');
        } else {
            password.type = "password";
            icon.classList.remove('bi-eye-slash');
            icon.classList.add('bi-eye');
        }
    }
</script>
</body>
</html>