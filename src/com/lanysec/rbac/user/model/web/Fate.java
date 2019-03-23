package com.lanysec.rbac.user.model.web;

public class Fate {
    private int id;
    private int courseId;
    private String studentId;
    private double money;
    private String fateTime;
    private String fateRemark;
    private Student student;
    private Course course;
    public int getId() {
        return this.id;
    }
    public void setId(int id ) {
        this.id = id;
    }
    public int getCourseId() {
        return this.courseId;
    }
    public void setCourseId(int courseId ) {
        this.courseId = courseId;
    }
    public double getMoney() {
        return this.money;
    }
    public void setMoney(double money ) {
        this.money = money;
    }
    public String getFateTime() {
        return this.fateTime;
    }
    public void setFateTime(String fateTime ) {
        this.fateTime = fateTime;
    }
    public String getFateRemark() {
        return this.fateRemark;
    }
    public void setFateRemark(String fateRemark ) {
        this.fateRemark = fateRemark;
    }
    public String getStudentId() {
        return this.studentId;
    }
    public void setStudentId(String studentId ) {
        this.studentId = studentId;
    }
    public Student getStudent() {
        return this.student;
    }
    public void setStudent(Student student ) {
        this.student = student;
    }
    public Course getCourse() {
        return this.course;
    }
    public void setCourse(Course course ) {
        this.course = course;
    }
    @Override
    public String toString() {
        return "Fate [id=" + this.id + ", courseId=" + this.courseId + ", studentId=" + this.studentId + ", money="
                + this.money + ", fateTime=" + this.fateTime + ", fateRemark=" + this.fateRemark + ", student="
                + this.student + ", course=" + this.course + "]";
    }


    
}
