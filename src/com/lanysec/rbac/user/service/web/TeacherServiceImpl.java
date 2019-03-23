package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.TeacherDao;
import com.lanysec.rbac.user.model.web.Teacher;
@Service
public class TeacherServiceImpl implements TeacherService {
    private Logger logger = Logger.getLogger(TeacherServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public Teacher getCourseInfoByTeaId(String tea_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        Teacher teacher = this.sqlSession.getMapper(TeacherDao.class).getTeaInfoByTeaId(tea_id);
        return teacher;
    }
    @Override
    public List<Teacher> getTeaInfoList(int startNum , int Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Teacher> list = this.sqlSession.getMapper(TeacherDao.class).getTeaInfoList(startNum, Page);
        return list;
    }
    @Override
    public int getTeacherCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(TeacherDao.class).getTeacherCount();
        return count;
    }
    @Override
    public Teacher getTeaInfoByTeaId(String tea_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        Teacher teacher = this.sqlSession.getMapper(TeacherDao.class).getTeaInfoByTeaId(tea_id);
        return teacher;
    }
    @Override
    public boolean deleteTeacherInfoById(String tea_id ) {
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(TeacherDao.class).deleteTeacherInfoById(tea_id);
        this.sqlSession.commit();
        return flag;
    }
    @Override
    public boolean modifyTeaInfoById(Teacher teacher ) {
        // TODO Auto-generated method stub
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(TeacherDao.class).modifyTeaInfoById(teacher);
        this.sqlSession.commit();
        return flag;
    }
    @Override
    public boolean addTeacher(Teacher teacher ) {
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(TeacherDao.class).addTeacher(teacher);
        this.sqlSession.commit();
        return flag;
    }
    @Override
    public Teacher getTeaInfoByCarId(String car_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        Teacher teacher = this.sqlSession.getMapper(TeacherDao.class).getTeaInfoByCarId(car_id);
        return teacher;
    }

}
