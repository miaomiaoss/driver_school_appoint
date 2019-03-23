package com.lanysec.rbac.user.model.web;

public class SchoolCourse {
    private int id;
    private  String stu_id;
    private String tea_id;
    private String course_time;
    private String endTime;
    private String course_name;
    private Teacher teacher;
    private Student student;
    public String getStu_id() {
        return this.stu_id;
    }
    public void setStu_id(String stu_id ) {
        this.stu_id = stu_id;
    }
    public String getTea_id() {
        return this.tea_id;
    }
    public void setTea_id(String tea_id ) {
        this.tea_id = tea_id;
    }
    public String getCourse_time() {
        return this.course_time;
    }
    public void setCourse_time(String course_time ) {
        this.course_time = course_time;
    }
    public String getCourse_name() {
        return this.course_name;
    }
    public void setCourse_name(String course_name ) {
        this.course_name = course_name;
    }
    public Teacher getTeacher() {
        return this.teacher;
    }
    public void setTeacher(Teacher teacher ) {
        this.teacher = teacher;
    }
    public Student getStudent() {
        return this.student;
    }
    public void setStudent(Student student ) {
        this.student = student;
    }
    public int getId() {
        return this.id;
    }
    public void setId(int id ) {
        this.id = id;
    }
    public String getEndTime() {
        return this.endTime;
    }
    public void setEndTime(String endTime ) {
        this.endTime = endTime;
    }
    @Override
    public String toString() {
        return "SchoolCourse [id=" + this.id + ", stu_id=" + this.stu_id + ", tea_id=" + this.tea_id + ", course_time="
                + this.course_time + ", endTime=" + this.endTime + ", course_name=" + this.course_name + ", teacher="
                + this.teacher + ", student=" + this.student + "]";
    }

    
    
}
