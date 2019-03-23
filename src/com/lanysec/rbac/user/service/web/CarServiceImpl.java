package com.lanysec.rbac.user.service.web;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.lanysec.base.util.web.MyBatisUtils;
import com.lanysec.rbac.user.dao.web.CarDao;
import com.lanysec.rbac.user.model.web.Car;
@Service
public class CarServiceImpl implements CarService {
    private Logger logger = Logger.getLogger(UserServiceImpl.class);
    private SqlSession sqlSession = null;
    @Override
    public Car getCarInfoById(String car_id ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        Car car=this.sqlSession.getMapper(CarDao.class).getCarInfoById(car_id);
        return car;
    }

    @Override
    public List<Car> getCarInfoList(int startNum , int Page ) {
        this.sqlSession = MyBatisUtils.getSqlSession();
        List<Car> list=this.sqlSession.getMapper(CarDao.class).getCarInfoList(startNum , Page);
        return list;
    }

    @Override
    public int getCarCount() {
        this.sqlSession = MyBatisUtils.getSqlSession();
        int count=this.sqlSession.getMapper(CarDao.class).getCarCount();
        return count;
    }
    
    @Override
    public boolean deleteCarInfoById(String car_id ) {
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(CarDao.class).deleteCarInfoById(car_id);
        this.sqlSession.commit();
        return flag;
    }
    
    @Override
    public boolean modifyCarInfoById(Car car ) {
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(CarDao.class).modifyCarInfoById(car);
        this.sqlSession.commit();
        return flag;
    }
    
    @Override
    public boolean addCar(Car car ) {
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(CarDao.class).addCar(car);
        this.sqlSession.commit();
        return flag;
    }

    @Override
    public boolean modifyCarTimeInfoById(Car car ) {
        boolean flag=false;
        this.sqlSession = MyBatisUtils.getSqlSession();
        flag=this.sqlSession.getMapper(CarDao.class).modifyCarTimeInfoById(car);
        this.sqlSession.commit();
        return flag;
    }

}
