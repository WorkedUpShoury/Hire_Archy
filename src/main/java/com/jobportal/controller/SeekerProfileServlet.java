package com.jobportal.controller;

import com.jobportal.dao.UserDAO;
import com.jobportal.model.User;
import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/SeekerProfileServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
    maxFileSize = 1024 * 1024 * 10,      // 10 MB
    maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class SeekerProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";
    private static final String[] ALLOWED_EXTENSIONS = {".jpg", ".jpeg", ".png", ".gif"};
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        // Get user ID from session instead of full user object
        int userId = (Integer) session.getAttribute("userId");
        UserDAO userDao = new UserDAO();
        
        try {
            // Get fresh data from database using the user ID
            User user = userDao.getUserProfile(userId);
            
            if (user == null) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login.jsp?error=User not found");
                return;
            }
            
            // Set default values for null fields
            initializeNullFields(user);
            
            // Store user data in request scope for the JSP
            request.setAttribute("user", user);
            
            // Forward to profile page
            request.getRequestDispatcher("/seekerProfile.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp?message=Error loading profile");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }
        
        int userId = (Integer) session.getAttribute("userId");
        UserDAO userDao = new UserDAO();
        
        try {
            // Get existing user data from database
            User user = userDao.getUserProfile(userId);
            if (user == null) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login.jsp?error=User not found");
                return;
            }
            
            // Update profile information from request parameters
            updateUserFromRequest(user, request);
            
            // Handle file uploads
            handleProfilePhotoUpload(request, user);
            handleLabPhotosUpload(request, user);
            
            // Update in database
            boolean success = userDao.updateUserProfile(user);
            
            if (success) {
                // Refresh user data from database
                User updatedUser = userDao.getUserProfile(userId);
                
                // Update minimal user data in session
                session.setAttribute("userName", updatedUser.getFullName());
                session.setAttribute("userRole", updatedUser.getRole());
                if (updatedUser.getProfilePhotoPath() != null) {
                    session.setAttribute("userPhoto", updatedUser.getProfilePhotoPath());
                }
                
                // Redirect to avoid form resubmission
                response.sendRedirect(request.getContextPath() + "/SeekerProfileServlet?success=Profile updated successfully");
            } else {
                response.sendRedirect(request.getContextPath() + "/SeekerProfileServlet?error=Failed to update profile");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/SeekerProfileServlet?error=Error: " + e.getMessage());
        }
    }
    
    private void initializeNullFields(User user) {
        if (user.getFullName() == null) user.setFullName("");
        if (user.getWorkStatus() == null) user.setWorkStatus("Available for Consulting");
        if (user.getProfilePhotoPath() == null) {
            user.setProfilePhotoPath("images/profilepicture.png");
        }
    }
    
    private void updateUserFromRequest(User user, HttpServletRequest request) {
        user.setFullName(request.getParameter("fullName"));
        user.setProfessionalTitles(request.getParameter("profession"));
        user.setExperienceRange(request.getParameter("experienceLevel"));
        user.setLocation(request.getParameter("location"));
        user.setSpecialization(request.getParameter("specialization"));
        user.setContactInstruction(request.getParameter("contact"));
        user.setProfessionalStatement(request.getParameter("about"));
    }
    
    private void handleProfilePhotoUpload(HttpServletRequest request, User user) 
            throws IOException, ServletException {
        String profilePhotoPath = handleFileUpload(request, "profilePhoto", user.getId());
        if (profilePhotoPath != null) {
            deleteOldFile(user.getProfilePhotoPath(), request);
            user.setProfilePhotoPath(profilePhotoPath);
        }
    }
    
    private void handleLabPhotosUpload(HttpServletRequest request, User user) 
            throws IOException, ServletException {
        String labPhotosPath = handleFileUpload(request, "labPhotos", user.getId());
        if (labPhotosPath != null) {
            deleteOldFile(user.getLabPhotosPaths(), request);
            user.setLabPhotosPaths(labPhotosPath);
        }
    }
    
    private String handleFileUpload(HttpServletRequest request, String partName, int userId) 
            throws IOException, ServletException {
        
        Part filePart = request.getPart(partName);
        if (filePart == null || filePart.getSize() == 0) {
            return null;
        }
        
        String fileName = extractFileName(filePart);
        if (!isValidExtension(fileName)) {
            throw new ServletException("Invalid file type. Only images are allowed.");
        }
        
        String appPath = request.getServletContext().getRealPath("");
        String uploadPath = appPath + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        String uniqueFileName = "user_" + userId + "_" + UUID.randomUUID().toString() + fileExtension;
        
        filePart.write(uploadPath + File.separator + uniqueFileName);
        
        return UPLOAD_DIR + "/" + uniqueFileName;
    }
    
    private boolean isValidExtension(String fileName) {
        if (fileName == null) return false;
        String fileExtension = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
        for (String extension : ALLOWED_EXTENSIONS) {
            if (extension.equals(fileExtension)) {
                return true;
            }
        }
        return false;
    }
    
    private void deleteOldFile(String filePath, HttpServletRequest request) {
        if (filePath == null || filePath.isEmpty() || filePath.equals("images/profilepicture.png")) {
            return;
        }
        
        try {
            String appPath = request.getServletContext().getRealPath("");
            String fullPath = appPath + File.separator + filePath;
            File oldFile = new File(fullPath);
            if (oldFile.exists()) {
                oldFile.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}