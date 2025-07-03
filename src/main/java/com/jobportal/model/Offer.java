package com.jobportal.model;

import java.util.Date;

public class Offer {
    private int offerId;
    private int employerId;
    private int seekerId;
    private String subject;
    private String message;
    private Date sentDate;
    private String status; // pending, accepted, rejected
    
    // Employer details
    private String employerName;
    private String companyName;
    private String employerEmail;
    private String employerPhoto;
    
    // Seeker details
    private String seekerName;
    private String seekerEmail;
    private String seekerPhoto;
    private String seekerTitle;
    private String seekerLocation;
    private String seekerExperience;
    private String seekerSpecialization;
    private String seekerProfessionalStatement;
    
    // Getters and Setters
    public int getOfferId() {
        return offerId;
    }

    public void setOfferId(int offerId) {
        this.offerId = offerId;
    }

    public int getEmployerId() {
        return employerId;
    }

    public void setEmployerId(int employerId) {
        this.employerId = employerId;
    }

    public int getSeekerId() {
        return seekerId;
    }

    public void setSeekerId(int seekerId) {
        this.seekerId = seekerId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getSentDate() {
        return sentDate;
    }

    public void setSentDate(Date sentDate) {
        this.sentDate = sentDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmployerName() {
        return employerName;
    }

    public void setEmployerName(String employerName) {
        this.employerName = employerName;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getSeekerName() {
        return seekerName;
    }

    public void setSeekerName(String seekerName) {
        this.seekerName = seekerName;
    }

    public String getEmployerEmail() {
        return employerEmail;
    }

    public void setEmployerEmail(String employerEmail) {
        this.employerEmail = employerEmail;
    }

    public String getEmployerPhoto() {
        return employerPhoto;
    }

    public void setEmployerPhoto(String employerPhoto) {
        this.employerPhoto = employerPhoto;
    }

    public String getSeekerEmail() {
        return seekerEmail;
    }

    public void setSeekerEmail(String seekerEmail) {
        this.seekerEmail = seekerEmail;
    }

    public String getSeekerPhoto() {
        return seekerPhoto;
    }

    public void setSeekerPhoto(String seekerPhoto) {
        this.seekerPhoto = seekerPhoto;
    }

    public String getSeekerTitle() {
        return seekerTitle;
    }

    public void setSeekerTitle(String seekerTitle) {
        this.seekerTitle = seekerTitle;
    }

    public String getSeekerLocation() {
        return seekerLocation;
    }

    public void setSeekerLocation(String seekerLocation) {
        this.seekerLocation = seekerLocation;
    }

    public String getSeekerExperience() {
        return seekerExperience;
    }

    public void setSeekerExperience(String seekerExperience) {
        this.seekerExperience = seekerExperience;
    }

    public String getSeekerSpecialization() {
        return seekerSpecialization;
    }

    public void setSeekerSpecialization(String seekerSpecialization) {
        this.seekerSpecialization = seekerSpecialization;
    }

    public String getSeekerProfessionalStatement() {
        return seekerProfessionalStatement;
    }

    public void setSeekerProfessionalStatement(String seekerProfessionalStatement) {
        this.seekerProfessionalStatement = seekerProfessionalStatement;
    }

    @Override
    public String toString() {
        return "Offer{" +
                "offerId=" + offerId +
                ", employerId=" + employerId +
                ", seekerId=" + seekerId +
                ", subject='" + subject + '\'' +
                ", message='" + message + '\'' +
                ", sentDate=" + sentDate +
                ", status='" + status + '\'' +
                ", employerName='" + employerName + '\'' +
                ", companyName='" + companyName + '\'' +
                '}';
    }
}