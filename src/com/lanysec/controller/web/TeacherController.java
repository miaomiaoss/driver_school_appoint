package com.lanysec.controller.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanysec.rbac.user.model.web.Car;
import com.lanysec.rbac.user.model.web.SchoolCourse;
import com.lanysec.rbac.user.model.web.Teacher;
import com.lanysec.rbac.user.model.web.TeacherAssment;
import com.lanysec.rbac.user.service.web.CarService;
import com.lanysec.rbac.user.service.web.SchoolCourseService;
import com.lanysec.rbac.user.service.web.TeacherAssmentService;
import com.lanysec.rbac.user.service.web.TeacherService;

@Controller
public class TeacherController {
    @Autowired
    SchoolCourseService sc;
    @Autowired
    TeacherService ts;
    @Autowired
    CarService cs;
    @Autowired
    TeacherAssmentService tas;
    @RequestMapping("/tea/toGetCourseInfo")
    public String toCourseInfo(){
        return "/jsp/to_course_info.jsp";
    }
    @RequestMapping("/tea/GetCourseInfo")
    public String CourseInfo(String tea_id,Model model){
        System.out.println("进入查询");
        List<SchoolCourse> list=sc.getCourseInfoByTeaId(tea_id);
        Teacher teacher=ts.getCourseInfoByTeaId(tea_id);
        System.out.println(teacher+"--->>"+list.toString());
        model.addAttribute("list" , list);
        model.addAttribute("teacher" , teacher);
        return "/jsp/to_course_list.jsp";
    }
    @RequestMapping("/tea/GetCourseInfoBySession")
    public String GetCourseInfoBySession(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        List<SchoolCourse> list=sc.getCourseInfoByTeaId(userAccount);
        Teacher teacher=ts.getCourseInfoByTeaId(userAccount);
        System.out.println(teacher+"--->>"+list.toString());
        model.addAttribute("list" , list);
        model.addAttribute("teacher" , teacher);
        return "/jsp/to_course_list.jsp";
    }
    @RequestMapping("/tea/toGetTeaListInfo")
    public String toTeaList(Model model){
        List<Teacher> list=ts.getTeaInfoList(0 , 3);
        int count=ts.getTeacherCount();
        System.out.println("数量"+count);
        System.out.println(list.toString());
        model.addAttribute("count" , count);
        model.addAttribute("list" , list);

        return "/jsp/TeacherInfo.jsp";
    }
    @RequestMapping("/tea/toTargetTeaListInfo")
    public void toTargetTeaInfoPage(Integer Page,PrintWriter pw){
        int startNum=(Page-1)*3;//开始坐标
        List<Teacher> list=ts.getTeaInfoList(startNum , 3);
        System.out.println("----》》》》"+list.toString());
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
    @RequestMapping("/tea/getTeaInfoById")
    public void getCarInfoById(String tea_id,PrintWriter pw){
        Teacher teacher=ts.getTeaInfoByTeaId(tea_id);
        Map<String,Object> map=new HashMap<String,Object>();
        System.out.println("信息"+teacher.toString());
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
    @RequestMapping("/tea/toDeleteTeaInfoById")
    public void deleteTeaInfoById(String tea_id,PrintWriter pw){
        boolean flag=false;
        flag=ts.deleteTeacherInfoById(tea_id);
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
    @RequestMapping("/tea/modifyTeacherById")
    public String modifyTeacherById(Teacher teacher){
        ts.modifyTeaInfoById(teacher);
        return"redirect:/tea/toGetTeaListInfo";
    }
    @RequestMapping("/tea/addTeacher")
    public void  addTeacherInfo(Teacher teacher,Car car,PrintWriter pw){
        System.out.println(car+"---"+teacher);
        boolean flag=false;
        car.setCar_owner(teacher.getTea_name());
        car.setStartTime("暂无");
        car.setEndTime("暂无");
        cs.addCar(car);
        flag=ts.addTeacher(teacher);
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

    @RequestMapping("/teacher/getTeacherAssmentList")
    public String getTeacherAssmentList(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        System.out.println("账号"+userAccount);
        List<TeacherAssment> list=tas.getTeacherAssmentByTeaId(userAccount , 0 , 4);
        System.out.println("获取信息----"+list);
        int count=tas.getTeacherAssmentCount();
        System.out.println(list.toString());
        model.addAttribute("list" , list);
        model.addAttribute("count" , count);
        return "/jsp/signal_teacher_assment.jsp";
    }
    @RequestMapping("/teacher/toTargetTeacherAssmentList")
    public void toTargetTeacherAssmentList(Integer Page,HttpServletRequest request,PrintWriter pw){
        System.out.println(Page+"<<<<<<<<<------");
        int startNum=(Page-1)*4;//开始坐标
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        List<TeacherAssment> list=tas.getTeacherAssmentByTeaId(userAccount , startNum, 4);
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
}
