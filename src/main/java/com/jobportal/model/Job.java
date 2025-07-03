package com.jobportal.model;

import java.sql.Date;

public class Job {
    private int jobId;
    private String jobTitle;
    private String companyName;
    private String location;
    private String employmentType;
    private String salaryRange;
    private String jobDescription;
    private String requirements;
    private String preferredQualifications;
    private String industry;
    private String department;
    private String experienceLevel;
    private String skillsRequired;
    private String educationRequired;
    private String benefits;
    private Date applicationDeadline;
    private Date postingDate;
    private String contactEmail;
    private String applicationLink;
    private String companyWebsite;
    private String additionalInfo;

    public int getJobId() {
        return jobId;
    }
    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getJobTitle() {
        return jobTitle;
    }
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getCompanyName() {
        return companyName;
    }
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }

    public String getEmploymentType() {
        return employmentType;
    }
    public void setEmploymentType(String employmentType) {
        this.employmentType = employmentType;
    }

    public String getSalaryRange() {
        return salaryRange;
    }
    public void setSalaryRange(String salaryRange) {
        this.salaryRange = salaryRange;
    }

    public String getJobDescription() {
        return jobDescription;
    }
    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getRequirements() {
        return requirements;
    }
    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getPreferredQualifications() {
        return preferredQualifications;
    }
    public void setPreferredQualifications(String preferredQualifications) {
        this.preferredQualifications = preferredQualifications;
    }

    public String getIndustry() {
        return industry;
    }
    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }

    public String getExperienceLevel() {
        return experienceLevel;
    }
    public void setExperienceLevel(String experienceLevel) {
        this.experienceLevel = experienceLevel;
    }

    public String getSkillsRequired() {
        return skillsRequired;
    }
    public void setSkillsRequired(String skillsRequired) {
        this.skillsRequired = skillsRequired;
    }

    public String getEducationRequired() {
        return educationRequired;
    }
    public void setEducationRequired(String educationRequired) {
        this.educationRequired = educationRequired;
    }

    public String getBenefits() {
        return benefits;
    }
    public void setBenefits(String benefits) {
        this.benefits = benefits;
    }

    public Date getApplicationDeadline() {
        return applicationDeadline;
    }
    public void setApplicationDeadline(Date applicationDeadline) {
        this.applicationDeadline = applicationDeadline;
    }

    public Date getPostingDate() {
        return postingDate;
    }
    public void setPostingDate(Date postingDate) {
        this.postingDate = postingDate;
    }

    public String getContactEmail() {
        return contactEmail;
    }
    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getApplicationLink() {
        return applicationLink;
    }
    public void setApplicationLink(String applicationLink) {
        this.applicationLink = applicationLink;
    }

    public String getCompanyWebsite() {
        return companyWebsite;
    }
    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }
    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }
}
