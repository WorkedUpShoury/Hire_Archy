<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
    flex-direction: column;
}

.container {
    flex: 1;
    padding-top: 3rem;
    padding-bottom: 3rem;
}

.hero-title {
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
}

.btn-primary:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0, 255, 255, 0.5);
    background: linear-gradient(45deg, var(--secondary-color), var(--primary-color));
}

.btn-secondary {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(0, 255, 255, 0.2);
    padding: 0.8rem 2rem;
    font-weight: 600;
    transition: all 0.3s ease;
    color: var(--light-color);
}

.btn-secondary:hover {
    background: rgba(0, 255, 255, 0.1);
    transform: translateY(-3px);
}

.feature-card {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    border-radius: 15px;
    padding: 2rem;
    margin: 1rem;
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 255, 255, 0.1);
}

.feature-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 15px 30px rgba(0, 255, 255, 0.2);
    background: rgba(255, 255, 255, 0.1);
}

.feature-icon {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    background: linear-gradient(to right, var(--accent-color), #a1c4fd);
    -webkit-background-clip: text;
    background-clip: text;
    color: transparent;
}

footer {
    background: rgba(0, 0, 0, 0.4);
    backdrop-filter: blur(10px);
    padding: 1.5rem;
    margin-top: auto;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.floating {
    animation: floating 3s ease-in-out infinite;
}

@keyframes floating {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-10px); }
    100% { transform: translateY(0px); }
}

.pulse {
    color: #00f0ff;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

    </style>
</head>
<body>
    <div class="container">
        <header class="my-5 text-center">
            <h1 class="hero-title animate__animated animate__fadeInDown">Welcome to <span class="pulse">HireArchy</span></h1>
            <p class="lead animate__animated animate__fadeIn animate__delay-1s">Your gateway to dream jobs and top talent</p>
        </header>

        <!-- Main CTA -->
        <div class="text-center my-5 animate__animated animate__fadeIn animate__delay-1s">
            <a href="register.jsp" class="btn btn-primary btn-lg mx-2 animate__animated animate__pulse animate__infinite">
                <i class="fas fa-user-plus me-2"></i>Register Now
            </a>
            <a href="login.jsp" class="btn btn-secondary btn-lg mx-2">
                <i class="fas fa-sign-in-alt me-2"></i>Login
            </a>
        </div>

        <!-- Features Section -->
        <div class="row my-5 justify-content-center animate__animated animate__fadeInUp animate__delay-1s">
            <div class="col-md-4">
                <div class="feature-card floating">
                    <div class="feature-icon">
                        <i class="fas fa-search"></i>
                    </div>
                    <h3>Find Jobs</h3>
                    <p>Discover thousands of job opportunities from top companies worldwide.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card floating" style="animation-delay: 0.2s">
                    <div class="feature-icon">
                        <i class="fas fa-briefcase"></i>
                    </div>
                    <h3>Post Jobs</h3>
                    <p>Employers can easily post jobs and find qualified candidates.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card floating" style="animation-delay: 0.4s">
                    <div class="feature-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3>Grow Career</h3>
                    <p>Access resources to develop your skills and advance your career.</p>
                </div>
            </div>
        </div>

        <!-- Stats Section -->
        <div class="text-center my-5 py-4 animate__animated animate__fadeIn animate__delay-2s">
            <div class="row">
                <div class="col-md-4">
                    <h2 class="display-4">15+</h2>
                    <p>Job Listings</p>
                </div>
                <div class="col-md-4">
                    <h2 class="display-4">5+</h2>
                    <p>Companies</p>
                </div>
                <div class="col-md-4">
                    <h2 class="display-4">0</h2>
                    <p>Successful Hires</p>
                </div>
            </div>
        </div>
    </div>

    <footer class="text-center">
        <div class="container">
            <p>&copy; 2025 HireArchy. All rights reserved.</p>
            <div class="social-icons mt-3">
                <a href="#" class="text-white mx-2"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="text-white mx-2"><i class="fab fa-twitter"></i></a>
                <a href="#" class="text-white mx-2"><i class="fab fa-linkedin-in"></i></a>
                <a href="#" class="text-white mx-2"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    
    <script>
        // Add animation class when elements come into view
        document.addEventListener('DOMContentLoaded', function() {
            const animateElements = document.querySelectorAll('.feature-card, .hero-title, .lead');
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.1 });
            
            animateElements.forEach(el => observer.observe(el));
        });
    </script>
</body>
</html>