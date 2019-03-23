package com.lanysec.controller.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanysec.rbac.user.model.web.Car;
import com.lanysec.rbac.user.model.web.Teacher;
import com.lanysec.rbac.user.service.web.CarService;
import com.lanysec.rbac.user.service.web.TeacherService;

@Controller
public class CarController {
    @Autowired
    CarService cs;
    @Autowired
    TeacherService ts;
    @RequestMapping("/car/toCarInfoPage")
    public String tocarInfoPage(Integer startPage,Integer Page,Model model){
        //int startNum=(startPage-1)*Page;//开始坐标
        List<Car> list=cs.getCarInfoList(0 , 2);
        int count=cs.getCarCount();
        System.out.println(list.toString());
        model.addAttribute("list" , list);
        model.addAttribute("count" , count);
        return"/jsp/CarInfo.jsp";
    }
    @RequestMapping("/car/toTargetCarInfoPage")
    public void toTargetCarInfoPage(Integer Page,PrintWriter pw){
        int startNum=(Page-1)*2;//开始坐标
        List<Car> list=cs.getCarInfoList(startNum, 2);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("list" , list);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
    }
    @RequestMapping("/car/getCarInfoById")
    public void getCarInfoById(String car_id,PrintWriter pw){
        Car car=cs.getCarInfoById(car_id);
        Teacher teacher=ts.getTeaInfoByCarId(car_id);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("car" , car);
        map.put("teacher" , teacher);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
        
        
    }
    @RequestMapping("/car/toModifyCarInfoById")
    public String toModifyPage(String carId ,Model model){
        Car car=cs.getCarInfoById(carId);
        model.addAttribute("car" , car);
        return"/jsp/car_info_modify.jsp";
    }
    @RequestMapping("/car/ModifyCarInfoById")
    public String ModifyPage(Car car){
        System.out.println(car.toString());
        boolean flag=cs.modifyCarInfoById(car);
        return"redirect:/car/toCarInfoPage";
    }
    @RequestMapping("/car/toDeleteCarInfoById")
    public void deleteCarInfoById(String car_id,PrintWriter pw){
        boolean flag=false;
        flag=cs.deleteCarInfoById(car_id);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("flag" , flag);
        ObjectMapper om=new ObjectMapper();
        try{
            String jsonString =om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
        }catch(JsonProcessingException e){
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return;
    }
}
