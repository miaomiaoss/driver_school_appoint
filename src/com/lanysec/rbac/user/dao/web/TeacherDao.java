package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.Teacher;

public interface TeacherDao {
    public Teacher getTeaInfoByTeaId(@Param("tea_id")String tea_id);
    public List<Teacher> getTeaInfoList(@Param("startNum")int startNum,@Param("Page")int Page);
    public int getTeacherCount();
    public boolean deleteTeacherInfoById(@Param("tea_id")String tea_id);
    public boolean modifyTeaInfoById(@Param("teacher")Teacher teacher);
    public boolean  addTeacher(@Param("teacher")Teacher teacher);
    public Teacher getTeaInfoByCarId(@Param("car_id")String car_id);
    
}
