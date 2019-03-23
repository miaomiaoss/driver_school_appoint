package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.SchoolCourse;

public interface SchoolCourseDao {
    public List<SchoolCourse> getCourseInfoByTeaId(@Param("tea_id")String tea_id);
    public List<SchoolCourse> getCourseInfoByStuId(@Param("stu_id")String stu_id);
    public List<SchoolCourse> getSchoolCourseList(@Param("startNum")int startNum,@Param("Page")int Page);
    public int getCourseCount();
    public int addSchoolCourse(@Param("schoolCourse")SchoolCourse schoolCourse);
    public int  deleteCourseByKeywords(@Param("keywords")String keywords);
    public SchoolCourse  getSignalSchoolCourseById(@Param("keywords")String keywords);
    public int updateSchoolCourseById(@Param("schoolCourse")SchoolCourse schoolCourse);
    public List<SchoolCourse> getAssmetTeacherByStuId(@Param("stu_id")String stu_id);
}
