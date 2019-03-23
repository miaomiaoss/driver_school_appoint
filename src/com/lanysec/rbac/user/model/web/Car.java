package com.lanysec.rbac.user.model.web;

public class Car {
    private String car_id;
    private String  car_owner;
    private String car_type;
    private int  car_age;
    private String car_status;
    private String startTime;
    private String endTime;
    private SchoolCourse schoolCourse;
    private Teacher teacher;
    public String getCar_id() {
        return this.car_id;
    }
    public void setCar_id(String car_id ) {
        this.car_id = car_id;
    }
    public String getCar_owner() {
        return this.car_owner;
    }
    public void setCar_owner(String car_owner ) {
        this.car_owner = car_owner;
    }
    public String getCar_type() {
        return this.car_type;
    }
    public void setCar_type(String car_type ) {
        this.car_type = car_type;
    }
    public int getCar_age() {
        return this.car_age;
    }
    public void setCar_age(int car_age ) {
        this.car_age = car_age;
    }
    public String getCar_status() {
        return this.car_status;
    }
    public void setCar_status(String car_status ) {
        this.car_status = car_status;
    }
    public SchoolCourse getSchoolCourse() {
        return this.schoolCourse;
    }
    public void setSchoolCourse(SchoolCourse schoolCourse ) {
        this.schoolCourse = schoolCourse;
    }
    public String getStartTime() {
        return this.startTime;
    }
    public void setStartTime(String startTime ) {
        this.startTime = startTime;
    }
    public String getEndTime() {
        return this.endTime;
    }
    public void setEndTime(String endTime ) {
        this.endTime = endTime;
    }
    public Teacher getTeacher() {
        return this.teacher;
    }
    public void setTeacher(Teacher teacher ) {
        this.teacher = teacher;
    }
    @Override
    public String toString() {
        return "Car [car_id=" + this.car_id + ", car_owner=" + this.car_owner + ", car_type=" + this.car_type
                + ", car_age=" + this.car_age + ", car_status=" + this.car_status + ", startTime=" + this.startTime
                + ", endTime=" + this.endTime + ", schoolCourse=" + this.schoolCourse + ", teacher=" + this.teacher
                + "]";
    }

    


}
