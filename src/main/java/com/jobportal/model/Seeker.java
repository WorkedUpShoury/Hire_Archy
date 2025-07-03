package com.jobportal.model;

public class Seeker {
    private int id;
    private String fullName;
    private String email;
    private String skills;
    private int experience;
    private String profilePicture;
    private String about;
    private String resumeLink;
    private String status;

    public Seeker(int id, String fullName, String email, String skills, int experience,
                  String profilePicture, String about, String resumeLink, String status) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.skills = skills;
        this.experience = experience;
        this.profilePicture = profilePicture;
        this.about = about;
        this.resumeLink = resumeLink;
        this.status = status;
    }

    // Getters and setters for all fields

    public int getId() { return id; }
    public String getFullName() { return fullName; }
    public String getEmail() { return email; }
    public String getSkills() { return skills; }
    public int getExperience() { return experience; }
    public String getProfilePicture() { return profilePicture; }
    public String getAbout() { return about; }
    public String getResumeLink() { return resumeLink; }
    public String getStatus() { return status; }

    public void setId(int id) { this.id = id; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public void setEmail(String email) { this.email = email; }
    public void setSkills(String skills) { this.skills = skills; }
    public void setExperience(int experience) { this.experience = experience; }
    public void setProfilePicture(String profilePicture) { this.profilePicture = profilePicture; }
    public void setAbout(String about) { this.about = about; }
    public void setResumeLink(String resumeLink) { this.resumeLink = resumeLink; }
    public void setStatus(String status) { this.status = status; }
}
