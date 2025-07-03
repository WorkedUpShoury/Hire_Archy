<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Job Posted Successfully</title>
    <style>
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
    <!-- Your existing page content (if any) -->
    
    <!-- Success Toast -->
    <div class="success-toast" id="successPopup">
        ✓ Job Posted Successfully!
    </div>

    <script>
        // Show the toast and then fade it out after 3 seconds
        document.addEventListener('DOMContentLoaded', function() {
            const toast = document.getElementById('successPopup');
            
            // Fade out after 3 seconds
            setTimeout(function() {
                toast.classList.add('fade-out');
                
                // Redirect after fade out completes (1 second later)
                setTimeout(function() {
                    window.location.href = 'employerDashboard.jsp';
                }, 1000);
                
            }, 3000);
        });
    </script>
</body>
</html>