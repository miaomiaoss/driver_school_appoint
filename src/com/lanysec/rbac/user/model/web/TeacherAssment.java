package com.lanysec.rbac.user.model.web;

public class TeacherAssment {
    private int id;
    private String tea_id;
    private String stu_id;
    private String assment;
    private String assment_status;
    private Teacher teacher;
    private Student student;
    public int getId() {
        return this.id;
    }
    public void setId(int id ) {
        this.id = id;
    }
    public String getTea_id() {
        return this.tea_id;
    }
    public void setTea_id(String tea_id ) {
        this.tea_id = tea_id;
    }
    public String getStu_id() {
        return this.stu_id;
    }
    public void setStu_id(String stu_id ) {
        this.stu_id = stu_id;
    }
    public String getAssment() {
        return this.assment;
    }
    public void setAssment(String assment ) {
        this.assment = assment;
    }
    public String getAssment_status() {
        return this.assment_status;
    }
    public void setAssment_status(String assment_status ) {
        this.assment_status = assment_status;
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
    @Override
    public String toString() {
        return "TeacherAssment [id=" + this.id + ", tea_id=" + this.tea_id + ", stu_id=" + this.stu_id + ", assment="
                + this.assment + ", assment_status=" + this.assment_status + ", teacher=" + this.teacher + ", student="
                + this.student + "]";
    }


}
