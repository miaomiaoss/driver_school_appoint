package com.lanysec.rbac.user.model.web;

public class Student {
    private String studentId;
    private int studentScore;
    private int courseId;
    private String studentName;
    private  Course course;
    private String sex;
    private int  age;
    private User user;
    public int getStudentScore() {
        return this.studentScore;
    }
    public void setStudentScore(int studentScore ) {
        this.studentScore = studentScore;
    }
    public Course getCourse() {
        return this.course;
    }
    public void setCourse(Course course ) {
        this.course = course;
    }
    public int getCourseId() {
        return this.courseId;
    }
    public void setCourseId(int courseId ) {
        this.courseId = courseId;
    }
    public String getStudentId() {
        return this.studentId;
    }
    public void setStudentId(String studentId ) {
        this.studentId = studentId;
    }
    public String getStudentName() {
        return this.studentName;
    }
    public void setStudentName(String studentName ) {
        this.studentName = studentName;
    }
    public String getSex() {
        return this.sex;
    }
    public void setSex(String sex ) {
        this.sex = sex;
    }
    public int getAge() {
        return this.age;
    }
    public void setAge(int age ) {
        this.age = age;
    }
    public User getUser() {
        return this.user;
    }
    public void setUser(User user ) {
        this.user = user;
    }
    @Override
    public String toString() {
        return "Student [studentId=" + this.studentId + ", studentScore=" + this.studentScore + ", courseId="
                + this.courseId + ", studentName=" + this.studentName + ", course=" + this.course + ", sex=" + this.sex
                + ", age=" + this.age + ", user=" + this.user + "]";
    }

    


    
}
