package com.jobportal.model;

import java.time.LocalDateTime;

public class Activity {
    private Long id;
    private String type;
    private String details;
    private String userName;
    private LocalDateTime timestamp;
    
    // Constructors, getters, setters
    public Activity() {}
    
    public Activity(String type, String details, String userName) {
        this.type = type;
        this.details = details;
        this.userName = userName;
        this.timestamp = LocalDateTime.now();
    }
    
    // Getters and setters for all fields
}