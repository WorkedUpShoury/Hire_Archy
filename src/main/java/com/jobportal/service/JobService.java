package com.jobportal.service;

import com.jobportal.dao.JobDAO;
import com.jobportal.model.Job;
import java.util.List;

public class JobService {
    private JobDAO jobDao = new JobDAO();
    
    public Job getJobById(int jobId) {
        try {
            return jobDao.getJobById(jobId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    
    public List<Job> getAllJobs() {
        try {
            return jobDao.getAllJobs();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
