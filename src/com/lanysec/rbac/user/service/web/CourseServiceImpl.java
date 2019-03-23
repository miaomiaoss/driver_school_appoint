
package com.lanysec.rbac.user.service.web;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.CourseDao;
import com.lanysec.rbac.user.model.web.Course;

public class CourseServiceImpl implements CourseService {
    private Logger logger = Logger.getLogger(CourseServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public Course getCourseInfoById(int courseId ) {
        // TODO Auto-generated method stub
        this.sqlSession = MyBatisUtils.getSqlSession();
        Course course=this.sqlSession.getMapper(CourseDao.class).getCourseInfoById(courseId);
        return course;
    }
    
}
