package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.SchoolCourseDao;
import com.lanysec.rbac.user.model.web.SchoolCourse;
@Service
public class SchoolCourseServiceImpl implements SchoolCourseService {
    private Logger logger = Logger.getLogger(SchoolCourseServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public List<SchoolCourse> getCourseInfoByTeaId(String tea_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<SchoolCourse> list=this.sqlSession.getMapper(SchoolCourseDao.class).getCourseInfoByTeaId(tea_id);
        return list;
    }
    @Override
    public List<SchoolCourse> getCourseInfoByStuId(String stu_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<SchoolCourse> list=this.sqlSession.getMapper(SchoolCourseDao.class).getCourseInfoByStuId(stu_id);
        return list;
    }
    @Override
    public List<SchoolCourse> getSchoolCourseList(int startNum , int Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<SchoolCourse> list=this.sqlSession.getMapper(SchoolCourseDao.class).getSchoolCourseList(startNum , Page);
        return list;
    }
    @Override
    public int getCourseCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(SchoolCourseDao.class).getCourseCount();
        return count;
    }
    @Override
    public int addSchoolCourse(SchoolCourse schoolCourse ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(SchoolCourseDao.class).addSchoolCourse(schoolCourse);
        this.sqlSession.commit();
        return count;
    }
    @Override
    public int deleteCourseByKeywords(String keywords ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(SchoolCourseDao.class).deleteCourseByKeywords(keywords);
        this.sqlSession.commit();
        return count;
    }
    @Override
    public SchoolCourse getSignalSchoolCourseById(String keywords ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        SchoolCourse schoolCourse=this.sqlSession.getMapper(SchoolCourseDao.class).getSignalSchoolCourseById(keywords);
        return schoolCourse;
    }
    @Override
    public int updateSchoolCourseById(SchoolCourse schoolCourse ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(SchoolCourseDao.class).updateSchoolCourseById(schoolCourse);
        this.sqlSession.commit();
        return count;
    }
    @Override
    public List<SchoolCourse> getAssmetTeacherByStuId(String stu_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<SchoolCourse> list=this.sqlSession.getMapper(SchoolCourseDao.class).getAssmetTeacherByStuId(stu_id);
        return list;
    }

}
