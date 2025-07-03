package com.jobportal.service;

import com.jobportal.model.Activity;
import java.util.List;

public interface ActivityService {
    List<Activity> getRecentActivities();
    void recordActivity(String type, String details, String userName);
}