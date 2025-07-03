package com.jobportal.service;

import java.util.List;
import java.util.Map;

import com.jobportal.model.Activity;

public interface AdminDashboardService {
    long getTotalUsers();
    long getNewUsersThisWeek();
    Map<String, Long> getUserRoleDistribution();
    List<Object[]> getUserRegistrationTrend();
    long getActiveJobsCount();
    long getNewJobsThisWeek();
    long getTotalApplications();
    long getPendingApplications();
    long getHiredCandidates();
    long getHiredThisMonth();
    List<Object[]> getApplicationTrend();
    List<Activity> getRecentActivities();
}