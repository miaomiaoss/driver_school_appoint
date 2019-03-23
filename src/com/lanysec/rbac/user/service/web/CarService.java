package com.lanysec.rbac.user.service.web;

import java.util.List;

import com.lanysec.rbac.user.model.web.Car;

public interface CarService {
    public Car getCarInfoById(String car_id);
    public List<Car> getCarInfoList(int startNum,int Page);
    public int getCarCount();
    public boolean deleteCarInfoById(String car_id);
    public boolean modifyCarInfoById(Car car);
    public boolean  addCar(Car car);
    public boolean modifyCarTimeInfoById(Car car);

}
