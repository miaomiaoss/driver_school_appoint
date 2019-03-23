package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.FateDao;
import com.lanysec.rbac.user.model.web.Fate;
@Service
public class FateServiceImpl implements FateService {
    private Logger logger = Logger.getLogger(UserServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public List<Fate> getFateListBStudentId(String studentId ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Fate> list=this.sqlSession.getMapper(FateDao.class).getFateListBStudentId(studentId);
        return list;
    }

    @Override
    public List<Fate> getFateList(int startNum , int Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Fate> list=this.sqlSession.getMapper(FateDao.class).getFateList(startNum , Page);
        return list;
    }

    @Override
    public int getCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(FateDao.class).getCount();
        return count;
    }

    @Override
    public boolean deleteFateInfoById(int id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        boolean flag=this.sqlSession.getMapper(FateDao.class).deleteFateInfoById(id);
        this.sqlSession.commit();
        return flag;
    }

    @Override
    public boolean modifyFateInfoById(Fate fate ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        boolean flag=this.sqlSession.getMapper(FateDao.class).modifyFateInfoById(fate);
        this.sqlSession.commit();
        return flag;
    }

    @Override
    public boolean addFate(Fate fate ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        boolean flag=this.sqlSession.getMapper(FateDao.class).addFate(fate);
        this.sqlSession.commit();
        return flag;
    }
    
    @Override
    public Fate getSignalFateId(int id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        Fate fate=this.sqlSession.getMapper(FateDao.class).getSignalFateId(id);
        return fate;
    }

}
