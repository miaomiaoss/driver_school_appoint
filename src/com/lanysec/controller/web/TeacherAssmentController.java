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
import com.lanysec.rbac.user.model.web.TeacherAssment;
import com.lanysec.rbac.user.service.web.TeacherAssmentService;

@Controller
public class TeacherAssmentController {
    @Autowired
    TeacherAssmentService ts;
    @RequestMapping("/teacherAssment/toTAInfoPage")
    public String toTeacherAssmentInfoPage(Integer startPage,Integer Page,Model model){
        //int startNum=(startPage-1)*Page;//开始坐标
        List<TeacherAssment> list=ts.getTeaAssmentInfoList(0 , 4);
        int count=ts.getTeacherAssmentCount();
        System.out.println(list.toString());
        model.addAttribute("list" , list);
        model.addAttribute("count" , count);
        return"/jsp/teacher_assment.jsp";
    }
    @RequestMapping("/teacherAssment/toTargetTeacherAssmentInfoPage")
    public void toTargetTeacherAssmentInfoPage(Integer Page,PrintWriter pw){
        int startNum=(Page-1)*2;//开始坐标
        List<TeacherAssment> list=ts.getTeaAssmentInfoList(startNum, 4);
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
    @RequestMapping("/teacherAssment/getTeacherAssmentInfoById")
    public void getTeacherAssmentInfoById(int id,PrintWriter pw){
        TeacherAssment teacherAssment=ts.getTeaAssmentInfoByTeaId(id);
        System.out.println("----===="+teacherAssment.toString());
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("teacherAssment" , teacherAssment);
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
    @RequestMapping("/teacherAssment/toModifyTeacherAssmentInfoById")
    public String toModifyTeacherAssmentInfoById(int id ,Model model){
        TeacherAssment teacherAssment=ts.getTeaAssmentInfoByTeaId(id);
        model.addAttribute("teacherAssment" , teacherAssment);
        return"/jsp/teacherAssment_amodify.jsp";
    }
    @RequestMapping("/teacherAssment/ModifyTeacherAssmentInfoById")
    public String ModifyPage(TeacherAssment teacherAssment){
        boolean flag=ts.modifyTeaAssmentInfoById(teacherAssment);
        return"redirect:/teacherAssment/toTAInfoPage";
    }
    @RequestMapping("/teacherAssment/toDeleteTeacherAssmentInfoById")
    public void toDeleteTeacherAssmentInfoById(int id,PrintWriter pw){
        boolean flag=false;
        flag=ts.deleteTeacherAssmentInfoById(id);
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
    
    
    @RequestMapping("/teacherAssment/toAddTeacherAssmentInfo")
    public void toAddTeacherAssmentInfoById(TeacherAssment teacherAssment,PrintWriter pw){
        boolean flag=false;
        TeacherAssment temp=ts.checkExist(teacherAssment.getTea_id() , teacherAssment.getStu_id());
        System.out.println("-----******"+temp);
        if(temp==null){
            flag=ts.addTeacherAssment(teacherAssment);
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
}
