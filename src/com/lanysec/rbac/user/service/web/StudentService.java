package com.lanysec.rbac.user.service.web;

import java.util.List;

import com.lanysec.rbac.user.model.web.SchoolCourse;
import com.lanysec.rbac.user.model.web.Student;

public interface StudentService {
    public List<Student>  getStuScore( String account);
    public boolean updateScoreInfo( Student student);
    public boolean deleteStuScoreInfo(String  studentId,Integer  courseId);
    public boolean insertStuScore(Student student);
    public List<SchoolCourse> getStuCourseInfoById(String stu_id);
    public List<Student> getStudentInfoList(Integer startNum,Integer Page);
    public List<Student> getStudentList(Integer startNum,Integer Page);
    public int getStudentCount();
    public int addStudent(Student student);
    public int deleteStuById(String stu_id);
    public Student getSignalStudent(String account);
    
}
