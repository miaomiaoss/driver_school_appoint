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
import com.lanysec.rbac.user.model.web.SchoolCourse;
import com.lanysec.rbac.user.service.web.CarService;
import com.lanysec.rbac.user.service.web.SchoolCourseService;

@Controller
public class CourseController {
    @Autowired
    SchoolCourseService scs;
    @Autowired
    CarService cs;
    @RequestMapping("/course/toCourseList")
    public String addCourse(Model model,HttpServletRequest request){
        HttpSession session=request.getSession();
        String userLimit=(String)session.getAttribute("userLimit");
        List<SchoolCourse> list=scs.getSchoolCourseList(0 , 3);
        System.out.println(list.toString());
        int count =scs.getCourseCount();
        if(count/3<=1){count=2;}
        model.addAttribute("list" , list);
        model.addAttribute("count" , count);
        if(userLimit.equals("学员")){
            return "/jsp/school_course.jsp";
        }else{
            System.out.println("管理员------");
            return "/jsp/school_course_car.jsp";
        }

    }

    @RequestMapping("/course/toTargetCoursePage")
    public void toTargetCourse(Integer Page,PrintWriter pw){
        int startNum=(Page-1)*2;//开始坐标
        List<SchoolCourse> list=scs.getSchoolCourseList(startNum , 3);
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
    @RequestMapping("/course/addSchoolCourse")
    public void addCourse(SchoolCourse  schoolCourse,PrintWriter pw)
    {   boolean flag=false;
    int temp=scs.addSchoolCourse(schoolCourse);
    if(temp>0){
        flag=true;
    }
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
    @RequestMapping("/course/delSchoolCourseByKeyWords")
    public void delSchoolCourseByKeyWords(String  keywords,PrintWriter pw)
    {
        boolean flag=false;
        int temp=scs.deleteCourseByKeywords(keywords);
        if(temp>0){
            flag=true;
        }
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
    @RequestMapping("/course/toModSchoolCourseById")
    public String toModSchoolCourseById(String keywords,Model model){
        SchoolCourse schoolCourse=scs.getSignalSchoolCourseById(keywords);
        model.addAttribute("schoolCourse" , schoolCourse);
        System.out.println("获取到的信息-----"+schoolCourse);
        return"/jsp/school_course_mod.jsp";

    }
    @RequestMapping("/course/ModSchoolCourseById")
    public String toModSchoolCourseById(SchoolCourse schoolCourse,Model model){
        System.out.println("更新----"+schoolCourse);
        scs.updateSchoolCourseById(schoolCourse);
        return"redirect:/course/toCourseList";

    }
    @RequestMapping("/course/getSignalSchoolCourse")
    public void getSignalSchoolCourse(String keywords,PrintWriter pw){

        SchoolCourse schoolCourse=scs.getSignalSchoolCourseById(keywords);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("schoolCourse" , schoolCourse);
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

