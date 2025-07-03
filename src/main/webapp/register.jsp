<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - HireArchy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
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
            padding: 20px;
        }

        .register-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
            width: 1000px;
            animation: fadeIn 0.8s ease-out;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .register-container:hover {
            box-shadow: 0 20px 40px rgba(0, 255, 255, 0.2);
            transform: translateY(-5px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .info-section {
            background: linear-gradient(135deg, rgba(74, 0, 224, 0.2), rgba(142, 45, 226, 0.2));
            padding: 3rem;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-section {
            padding: 3rem;
            background: rgba(26, 26, 46, 0.5);
        }

        .logo {
            width: 200px;
            margin-bottom: 2rem;
            filter: drop-shadow(0 0 10px rgba(0, 240, 255, 0.5));
            transition: all 0.5s ease;
        }

        .logo:hover {
            transform: scale(1.05);
            filter: drop-shadow(0 0 15px rgba(0, 240, 255, 0.8));
        }

        .register-title {
            font-weight: 700;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            color: White;
        }

        .feature-list {
            list-style: none;
            padding-left: 0;
            margin-top: 2rem;
        }

        .feature-list li {
            margin-bottom: 1.5rem;
            position: relative;
            padding-left: 2rem;
            transition: all 0.3s ease;
        }

        .feature-list li:hover {
            color: var(--accent-color);
            transform: translateX(5px);
        }

        .feature-list li::before {
            content: "✓";
            position: absolute;
            left: 0;
            color: var(--accent-color);
            font-weight: bold;
            animation: pulse 2s infinite;
        }

        .btn-primary {
            background: linear-gradient(90deg, #00f0ff 0%, #8e2de2 100%);
            border: none;
            padding: 0.8rem;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 255, 255, 0.3);
            color: #fff;
            width: 100%;
            margin-top: 1rem;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 255, 255, 0.5);
            background: linear-gradient(45deg, var(--secondary-color), var(--primary-color));
        }

        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: var(--light-color);
            transition: all 0.3s ease;
            margin-bottom: 1rem;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(0, 240, 255, 0.25);
            color: white;
        }

        .form-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: var(--light-color);
        }

        .form-select:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(0, 240, 255, 0.25);
        }

        .form-check-input {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .form-check-input:focus {
            box-shadow: 0 0 0 0.25rem rgba(142, 45, 226, 0.25);
        }

        .login-link {
            color: var(--accent-color);
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .login-link:hover {
            color: var(--primary-color);
            text-decoration: underline;
            transform: translateX(3px);
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.7; }
            50% { transform: scale(1.2); opacity: 1; }
            100% { transform: scale(1); opacity: 0.7; }
        }

        .floating {
            animation: floating 3s ease-in-out infinite;
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        .radio-group {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
        }

        .radio-option {
            flex: 1;
        }

        .radio-option input[type="radio"] {
            display: none;
        }

        .radio-option label {
            display: block;
            padding: 0.75rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 0.375rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .radio-option input[type="radio"]:checked + label {
            background: rgba(142, 45, 226, 0.2);
            border-color: var(--accent-color);
            color: var(--accent-color);
            box-shadow: 0 0 10px rgba(0, 240, 255, 0.3);
        }
    </style>
</head>
<body>
<div class="register-container row g-0">
    <!-- Left Info Section -->
    <div class="col-lg-5 info-section">
        <div class="text-center floating">
            <img src="images/onlylogo.png" alt="HireArchy Logo" class="logo">
        </div>
        <h3 class="register-title text-center">Join HireArchy Today</h3>
        <ul class="feature-list">
            <li>Build your profile and let recruiters find you</li>
            <li>Get job postings delivered to your email</li>
            <li>Find a job and grow your career</li>
            <li>Track your application status easily</li>
        </ul>
    </div>

    <!-- Right Form Section -->
    <div class="col-lg-7 form-section">
        <h3 class="register-title">Create Your Profile</h3>
        
        <form action="RegisterServlet" method="post">
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name*</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email ID*</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="password" class="form-label">Password*</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="mobile" class="form-label">Mobile Number*</label>
                        <input type="text" class="form-control" id="mobile" name="mobile" required>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <label for="role" class="form-label">Register as*</label>
                <select class="form-select" id="role" name="role" required>
                    <option value="">-- Select Role --</option>
                    <option value="seeker">Job Seeker</option>
                    <option value="employer">Employer</option>
                </select>
            </div>

            <div class="mb-4">
                <label class="form-label">Work Status*</label>
                <div class="radio-group">
                    <div class="radio-option">
                        <input type="radio" name="workstatus" id="experienced" value="experienced" required>
                        <label for="experienced">I'm Experienced</label>
                    </div>
                    <div class="radio-option">
                        <input type="radio" name="workstatus" id="fresher" value="fresher" required>
                        <label for="fresher">I'm a Fresher</label>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Register Now</button>
        </form>

        <div class="text-center mt-4">
            Already registered? <a href="login.jsp" class="login-link">Login here</a>
        </div>
    </div>
</div>

<script>
    // Add floating animation to feature list items on hover
    document.querySelectorAll('.feature-list li').forEach(item => {
        item.addEventListener('mouseenter', () => {
            item.classList.add('floating');
        });
        item.addEventListener('mouseleave', () => {
            item.classList.remove('floating');
        });
    });
</script>
</body>
</html>