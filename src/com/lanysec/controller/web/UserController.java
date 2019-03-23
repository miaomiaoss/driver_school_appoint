package com.lanysec.controller.web;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanysec.rbac.user.model.web.Student;
import com.lanysec.rbac.user.model.web.Teacher;
import com.lanysec.rbac.user.model.web.User;
import com.lanysec.rbac.user.service.web.StudentService;
import com.lanysec.rbac.user.service.web.TeacherService;
import com.lanysec.rbac.user.service.web.UserService;

@Controller
public class UserController {
    @Autowired
    UserService us;
    @Autowired
    TeacherService ts;
    @Autowired
    StudentService ss;
    @RequestMapping("/user/toStu")
    public String stuInfo(){

        return"/jsp/stu_info_modify.jsp";
    }
    @RequestMapping("/user/toTea")
    public String teaInfo(String account){
        return"/jsp/tea_info_modify.jsp";
    }
    @RequestMapping("/user/getStuInfoById")
    public String getUserInfo(String account,Model model){
        User user=us.getUserInfoById(account);
        model.addAttribute("User" , user);
        return "/jsp/stuInfo.jsp";
    }
    @RequestMapping("/user/getTeaInfoById")
    public String getUTeaInfo(String teaId,Model model){
        System.out.println("编号"+teaId);
        Teacher teacher=ts.getTeaInfoByTeaId(teaId);
        System.out.println("JIAO---"+teacher.toString());
        model.addAttribute("teacher" , teacher);
        return "/jsp/teaInfo.jsp";
    }
    @RequestMapping("/user/updateStuInfoById")
    public String updateUserInfo(User user,Model model){
        boolean tag=false;
        tag=us.updateUserById(user);
        System.out.println("修改结果---->>>>"+tag);
        model.addAttribute("User" , user);
        return "/jsp/stuInfo.jsp";
    }
    @RequestMapping("/user/deleteStuInfoById")
    public String updateUserInfo(int account){
        boolean tag=false;
        tag=us.deleteUserInfoById(account);
        System.out.println("修改结果---->>>>"+tag);
        return "/jsp/stuInfo.jsp";
    }
    @RequestMapping("/user/modifyUserPass")
    public void  modifyUserPass(String account,String password,String newPassword,PrintWriter pw){
        boolean flag=false;
        User user;
        Map<String,Object> map=new HashMap<String,Object>();
        try{
            user = us.login(account , password);
            flag=us.modifyUserPass(account , newPassword);
            map.put("flag" , flag);
        }catch(Exception e1){
            map.put("flag" , flag);
        }


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
    @RequestMapping("/user/toModifyPassPage")
    public String toModifyPassPage(){
        
        
        return"/jsp/modifyPass.jsp";
    }
    @RequestMapping("/user/welcom")
    public String towelcom(){
        
        
        return"/jsp/welcom.jsp";
    }
    @RequestMapping("/user/addUser")
    public void addUser(String studentName,String password,PrintWriter pw){
        String Id="S"+ new Date().getTime();
        User user=new User();
        user.setAccount(Id);
        user.setPassword(password);
        user.setUserLimit("学员");
        us.addUser(user);
        Student student=new Student();
        student.setStudentId(Id);
        student.setStudentName(studentName);
        ss.addStudent(student);
        boolean flag=false;
        System.out.println("用户信息---==="+user.getAccount().toString());
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("user" , user);
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
