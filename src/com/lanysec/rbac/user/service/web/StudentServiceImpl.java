package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.StudentDao;
import com.lanysec.rbac.user.model.web.SchoolCourse;
import com.lanysec.rbac.user.model.web.Student;
@Service
public class StudentServiceImpl implements StudentService {
    private Logger logger = Logger.getLogger(StudentServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public List<Student>  getStuScore(String account ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Student> list=this.sqlSession.getMapper(StudentDao.class).getStuScore(account);
        return list;
    }
    @Override
    public boolean updateScoreInfo(Student student ) {
        System.out.println("学生信息"+student.toString());
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        int tag=this.sqlSession.getMapper(StudentDao.class).updateScoreInfo(student);
        this.sqlSession.commit();
        System.out.println("修改结果--->>>"+tag);
        if(tag>=0){
            flag=true;
        }
        return flag;
    }
    @Override
    public boolean deleteStuScoreInfo(String studentId , Integer courseId ) {
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(StudentDao.class).deleteStuScoreInfo(studentId , courseId);
        this.sqlSession.commit();
        return flag;
    }
    @Override
    public boolean insertStuScore(Student student ) {
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(StudentDao.class).insertStuScore(student);
        this.sqlSession.commit();
        return flag;
    }
    @Override
    public List<SchoolCourse> getStuCourseInfoById(String stu_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<SchoolCourse> list=this.sqlSession.getMapper(StudentDao.class).getStuCourseInfoById(stu_id);
        return list;
    }
    @Override
    public List<Student> getStudentInfoList(Integer startNum , Integer Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Student> list=this.sqlSession.getMapper(StudentDao.class).getStudentInfoList(startNum , Page);
        return list;
    }
    @Override
    public List<Student> getStudentList(Integer startNum , Integer Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Student> list=this.sqlSession.getMapper(StudentDao.class).getStudentList(startNum , Page);
        return list;
    }
    @Override
    public int getStudentCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(StudentDao.class).getStudentCount();
        return count;
    }
    @Override
    public int addStudent(Student student ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int num=this.sqlSession.getMapper(StudentDao.class).addStudent(student);
        this.sqlSession.commit();
        return num;
    }
    @Override
    public int deleteStuById(String stu_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int num=this.sqlSession.getMapper(StudentDao.class).deleteStuById(stu_id);
        this.sqlSession.commit();
        return num;
    }
    @Override
    public Student getSignalStudent(String account ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        Student student=this.sqlSession.getMapper(StudentDao.class).getSignalStudent(account);
        return student;
    }

}
