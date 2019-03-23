package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.SchoolCourse;
import com.lanysec.rbac.user.model.web.Student;

public interface StudentDao {
    public List<Student>  getStuScore(@Param("account") String account);
    public int updateScoreInfo(@Param("student") Student student);
    public boolean deleteStuScoreInfo(@Param("studentId") String  studentId,@Param("courseId") Integer  courseId);
    public boolean insertStuScore(@Param("student") Student student);
    public Student getStuInfoById(@Param("stu_id") String stu_id);
    public List<SchoolCourse> getStuCourseInfoById(@Param("stu_id") String stu_id);
    public List<Student> getStudentInfoList(@Param("startNum")Integer startNum,@Param("Page")Integer Page);
    public List<Student> getStudentList(@Param("startNum")Integer startNum,@Param("Page")Integer Page);
    public int getStudentCount();
    public int addStudent(@Param("student") Student student);
    public int deleteStuById(@Param("stu_id") String stu_id);
    public Student getSignalStudent(@Param("account") String account);
}
