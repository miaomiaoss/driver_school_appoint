package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.TeacherAssment;

public interface TeacherAssmentDao {
    public TeacherAssment getTeaAssmentInfoByTeaId(@Param("id")int id);
    public List<TeacherAssment> getTeaAssmentInfoList(@Param("startNum")int startNum,@Param("Page")int Page);
    public int getTeacherAssmentCount();
    public boolean deleteTeacherAssmentInfoById(@Param("id")int id);
    public boolean modifyTeaAssmentInfoById(@Param("teacherAssment")TeacherAssment teacherAssment);
    public boolean  addTeacherAssment(@Param("teacherAssment")TeacherAssment teacherAssment);
    public TeacherAssment checkExist(@Param("tea_id")String tea_id,@Param("stu_id")String stu_id);
    public List<TeacherAssment> getStudentAssmentByStuId(@Param("stu_id")String stu_id,@Param("startNum")int startNum,@Param("Page")int Page);
    public List<TeacherAssment> getTeacherAssmentByTeaId(@Param("tea_id")String tea_id,@Param("startNum")int startNum,@Param("Page")int Page);
}
