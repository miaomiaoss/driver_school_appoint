package com.lanysec.rbac.user.service.web;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.UserDao;
import com.lanysec.rbac.user.model.web.User;
@Service
public class UserServiceImpl implements UserService{
    private Logger logger = Logger.getLogger(UserServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public User login(String account , String password ) {
        System.out.println("查询结果");
        try{
            this.sqlSession = MyBatisUtils.getSqlSession();
            System.out.println();
            User user = this.sqlSession.getMapper(UserDao.class).login(account , password);//接口代理
            if(user==null){
                throw new RuntimeException("账号或者密码错误,请重新输入");
            }else{
                return user;
            }
        }catch(Exception e){
            System.out.println("信息异常");
            this.logger.error("登录异常,原因为:"+e.getMessage());
            throw new RuntimeException("登录异常,原因为:"+e.getMessage());

        }
    }
    @Override
    public User getUserInfoById(String account ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        User user = this.sqlSession.getMapper(UserDao.class).getUserInfoById(account);
        return user;
    }
    @Override
    public boolean updateUserById(User user ) {
        // TODO Auto-generated method stub
        boolean tag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        tag = this.sqlSession.getMapper(UserDao.class).updateUserInfoById(user);
        sqlSession.commit();
        return tag;
    }
    @Override
    public boolean deleteUserInfoById(int userId ) {
        boolean tag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        int a=-1;
        a= this.sqlSession.getMapper(UserDao.class).deleteUserInfoById(userId);
        sqlSession.commit();
        System.out.println("删除行数---->>>"+a);
        if(a>=0){
            tag=true;
        }
        return tag;
    }
    @Override
    public boolean modifyUserPass(String account , String password ) {
        boolean tag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        tag = this.sqlSession.getMapper(UserDao.class).modifyUserPass(account , password);
        sqlSession.commit();
        
        MyBatisUtils.closeSqlSession(sqlSession);
        
        return tag;
    }
    @Override
    public int addUser(User user ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int  tag = this.sqlSession.getMapper(UserDao.class).addUser(user);
        sqlSession.commit();
        MyBatisUtils.closeSqlSession(sqlSession);
        return tag;
    }
    @Override
    public int deleteUserInfoByAccount(String account ) {
        System.out.println("用户信息---->>"+account);
        boolean tag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        int  num= this.sqlSession.getMapper(UserDao.class).deleteUserInfoByAccount(account);
        sqlSession.commit();
        return num;
    }

}
