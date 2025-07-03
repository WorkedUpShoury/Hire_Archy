package com.jobportal.model;

import java.util.Objects;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String role; // SEEKER, EMPLOYER, ADMIN
    private String status; // ACTIVE, INACTIVE, SUSPENDED
    private String mobile;
    private String workStatus; // AVAILABLE, UNAVAILABLE
    private String fullName;
    private String title; // Professional title
    private String professionalTitles; // Additional titles/credentials
    private String experienceRange; // e.g., "0-2 years", "3-5 years"
    private String location;
    private String specialization; // Main professional specialization
    private String contactInstruction; // Preferred contact methods
    private String profilePhotoPath; // Path to profile photo
    private String labPhotosPaths; // Comma-separated paths to lab photos
    private String professionalStatement; // Professional summary
    private String address;
    private String companyName; // For employers

    // Constructors
    public User() {
        // Default constructor
    }

    public User(int id, String fullName, String email, String role) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.role = role;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getWorkStatus() {
        return workStatus;
    }

    public void setWorkStatus(String workStatus) {
        this.workStatus = workStatus;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getProfessionalTitles() {
        return professionalTitles;
    }

    public void setProfessionalTitles(String professionalTitles) {
        this.professionalTitles = professionalTitles;
    }

    public String getExperienceRange() {
        return experienceRange;
    }

    public void setExperienceRange(String experienceRange) {
        this.experienceRange = experienceRange;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public String getContactInstruction() {
        return contactInstruction;
    }

    public void setContactInstruction(String contactInstruction) {
        this.contactInstruction = contactInstruction;
    }

    public String getProfilePhotoPath() {
        return profilePhotoPath != null ? profilePhotoPath : 
            "https://ui-avatars.com/api/?name=" + (fullName != null ? fullName.replace(" ", "+") : "User") + 
            "&background=4F46E5&color=fff&size=200";
    }

    public void setProfilePhotoPath(String profilePhotoPath) {
        this.profilePhotoPath = profilePhotoPath;
    }

    public String getLabPhotosPaths() {
        return labPhotosPaths;
    }

    public void setLabPhotosPaths(String labPhotosPaths) {
        this.labPhotosPaths = labPhotosPaths;
    }

    public String getProfessionalStatement() {
        return professionalStatement != null ? professionalStatement : "No professional statement provided.";
    }

    public void setProfessionalStatement(String professionalStatement) {
        this.professionalStatement = professionalStatement;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    // Utility methods
    public boolean isEmployer() {
        return "EMPLOYER".equalsIgnoreCase(role);
    }

    public boolean isSeeker() {
        return "SEEKER".equalsIgnoreCase(role);
    }

    public boolean isAdmin() {
        return "ADMIN".equalsIgnoreCase(role);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id && 
               Objects.equals(email, user.email);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email);
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                ", status='" + status + '\'' +
                ", title='" + title + '\'' +
                '}';
    }

    // Builder pattern for easier object creation
    public static class Builder {
        private final User user = new User();

        public Builder id(int id) {
            user.setId(id);
            return this;
        }

        public Builder fullName(String fullName) {
            user.setFullName(fullName);
            return this;
        }

        public Builder email(String email) {
            user.setEmail(email);
            return this;
        }

        public Builder role(String role) {
            user.setRole(role);
            return this;
        }

        // Add other builder methods for remaining fields...

        public User build() {
            return user;
        }
    }
}