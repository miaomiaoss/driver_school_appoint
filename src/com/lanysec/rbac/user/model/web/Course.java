package com.lanysec.rbac.user.model.web;

public class Course {
    private int courseId;
    private String courseName;
    public int getCourseId() {
        return this.courseId;
    }
    public void setCourseId(int courseId ) {
        this.courseId = courseId;
    }
    public String getCourseName() {
        return this.courseName;
    }
    public void setCourseName(String courseName ) {
        this.courseName = courseName;
    }
    @Override
    public String toString() {
        return "Course [courseId=" + this.courseId + ", courseName=" + this.courseName + "]";
    }
    
}
