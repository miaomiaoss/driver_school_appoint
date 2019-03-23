package com.lanysec.rbac.user.service.web;

import java.util.List;

import com.lanysec.rbac.user.model.web.SchoolCourse;

public interface SchoolCourseService {
    public List<SchoolCourse> getCourseInfoByTeaId(String tea_id);
    public List<SchoolCourse> getCourseInfoByStuId(String stu_id);
    public List<SchoolCourse> getSchoolCourseList(int startNum,int Page);
    public int getCourseCount();
    public int addSchoolCourse(SchoolCourse schoolCourse);
    public int  deleteCourseByKeywords(String keywords);
    public SchoolCourse  getSignalSchoolCourseById(String keywords);
    public int updateSchoolCourseById(SchoolCourse schoolCourse);
    public List<SchoolCourse> getAssmetTeacherByStuId(String stu_id);
    

}
