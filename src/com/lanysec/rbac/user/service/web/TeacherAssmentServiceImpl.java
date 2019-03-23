package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.TeacherAssmentDao;
import com.lanysec.rbac.user.model.web.TeacherAssment;
@Service
public class TeacherAssmentServiceImpl implements TeacherAssmentService {
    private Logger logger = Logger.getLogger(StudentServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public TeacherAssment getTeaAssmentInfoByTeaId(int id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        TeacherAssment teacherAssment=this.sqlSession.getMapper(TeacherAssmentDao.class).getTeaAssmentInfoByTeaId(id);
        return teacherAssment;
    }
    
    @Override
    public List<TeacherAssment> getTeaAssmentInfoList(int startNum , int Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<TeacherAssment> list=this.sqlSession.getMapper(TeacherAssmentDao.class).getTeaAssmentInfoList(startNum , Page);
        return list;
    }
    
    @Override
    public int getTeacherAssmentCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(TeacherAssmentDao.class).getTeacherAssmentCount();
        return count;
    }
    
    @Override
    public boolean deleteTeacherAssmentInfoById(int id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        boolean flag=this.sqlSession.getMapper(TeacherAssmentDao.class).deleteTeacherAssmentInfoById(id);
        this.sqlSession.commit();
        return flag;
    }
    
    @Override
    public boolean modifyTeaAssmentInfoById(TeacherAssment teacherAssment ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        boolean flag=this.sqlSession.getMapper(TeacherAssmentDao.class).modifyTeaAssmentInfoById(teacherAssment);
        this.sqlSession.commit();
        return flag;
    }
    
    @Override
    public boolean addTeacherAssment(TeacherAssment teacherAssment ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        boolean flag=this.sqlSession.getMapper(TeacherAssmentDao.class).addTeacherAssment(teacherAssment);
        this.sqlSession.commit();
        return flag;
    }
    
    @Override
    public TeacherAssment checkExist(String tea_id , String stu_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        TeacherAssment teacherAssment=this.sqlSession.getMapper(TeacherAssmentDao.class).checkExist(tea_id , stu_id);
        return teacherAssment;
    }

    @Override
    public List<TeacherAssment> getStudentAssmentByStuId(String stu_id , int startNum , int Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<TeacherAssment> list=this.sqlSession.getMapper(TeacherAssmentDao.class).getStudentAssmentByStuId(stu_id , startNum , Page);
        return list;
    }

    @Override
    public List<TeacherAssment> getTeacherAssmentByTeaId(String tea_id , int startNum , int Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<TeacherAssment> list=this.sqlSession.getMapper(TeacherAssmentDao.class).getTeacherAssmentByTeaId(tea_id , startNum , Page);
        return list;
    }
    
}
