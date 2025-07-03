package com.jobportal.model;

public class CompanyProfile {
    private String companyName;
    private String industry;
    private String companySize;
    private String website;
    private String hqLocation;
    private String contactEmail;
    private String about;

    public String getCompanyName() {
        return companyName;
    }
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getIndustry() {
        return industry;
    }
    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getCompanySize() {
        return companySize;
    }
    public void setCompanySize(String companySize) {
        this.companySize = companySize;
    }

    public String getWebsite() {
        return website;
    }
    public void setWebsite(String website) {
        this.website = website;
    }

    public String getHqLocation() {
        return hqLocation;
    }
    public void setHqLocation(String hqLocation) {
        this.hqLocation = hqLocation;
    }

    public String getContactEmail() {
        return contactEmail;
    }
    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getAbout() {
        return about;
    }
    public void setAbout(String about) {
        this.about = about;
    }
}
