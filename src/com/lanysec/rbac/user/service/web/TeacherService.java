package com.lanysec.rbac.user.service.web;

import java.util.List;

import com.lanysec.rbac.user.model.web.Teacher;

public interface TeacherService {
    public Teacher getCourseInfoByTeaId(String tea_id);
    public List<Teacher> getTeaInfoList(int startNum,int Page);
    public int getTeacherCount();
    public Teacher getTeaInfoByTeaId(String tea_id);
    public boolean deleteTeacherInfoById(String tea_id);
    public boolean modifyTeaInfoById(Teacher teacher);
    public boolean  addTeacher(Teacher teacher);
    public Teacher getTeaInfoByCarId(String car_id);

}
