package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.Car;

public interface CarDao {
    public Car getCarInfoById(@Param("car_id")String car_id);
    public List<Car> getCarInfoList(@Param("startNum")int startNum,@Param("Page")int Page);
    public int getCarCount();
    public boolean deleteCarInfoById(@Param("car_id")String car_id);
    public boolean modifyCarInfoById(@Param("car")Car car);
    public boolean  addCar(@Param("car")Car car);
    public boolean modifyCarTimeInfoById(@Param("car")Car car);
    
}
