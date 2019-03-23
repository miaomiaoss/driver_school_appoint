package com.lanysec.rbac.user.dao.web;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.Course;

public interface CourseDao {
    public Course getCourseInfoById(@Param("courseId") Integer courseId);

}
