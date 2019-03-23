package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.TeacherAssment;

public interface TeacherAssmentService {
    public TeacherAssment getTeaAssmentInfoByTeaId(int id);
    public List<TeacherAssment> getTeaAssmentInfoList(int startNum,@Param("Page")int Page);
    public int getTeacherAssmentCount();
    public boolean deleteTeacherAssmentInfoById(int id);
    public boolean modifyTeaAssmentInfoById(TeacherAssment teacherAssment);
    public boolean  addTeacherAssment(TeacherAssment teacherAssment);
    public TeacherAssment checkExist(String tea_id,String stu_id);
    public List<TeacherAssment> getStudentAssmentByStuId(String stu_id,int startNum,int Page);
    public List<TeacherAssment> getTeacherAssmentByTeaId(String tea_id,int startNum,int Page);

}
