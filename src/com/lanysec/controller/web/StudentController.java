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
import com.lanysec.rbac.user.model.web.Student;
import com.lanysec.rbac.user.model.web.Teacher;
import com.lanysec.rbac.user.model.web.TeacherAssment;
import com.lanysec.rbac.user.model.web.User;
import com.lanysec.rbac.user.service.web.CarService;
import com.lanysec.rbac.user.service.web.SchoolCourseService;
import com.lanysec.rbac.user.service.web.StudentService;
import com.lanysec.rbac.user.service.web.TeacherAssmentService;
import com.lanysec.rbac.user.service.web.TeacherService;
import com.lanysec.rbac.user.service.web.UserService;

@Controller
public class StudentController {
    @Autowired
    StudentService ss;
    @Autowired
    UserService us;
    @Autowired
    SchoolCourseService scs;
    @Autowired
    TeacherAssmentService ts;
    @Autowired
    CarService cs;
    @Autowired
    TeacherService tas;
    @RequestMapping("/user/toSelStuScore")
    public String toStuScoreSel(){
        
        return"/jsp/stu_score_sel.jsp";
    }
    @RequestMapping("/user/getStuScore")
    public  String getStuScore(String account,Model model){
        System.out.println("查询成绩"+account);
        List<Student> list=ss.getStuScore(account);
        System.out.println(list.toString()+"======"+list.size());
        model.addAttribute("list" , list);
        model.addAttribute("account" , account);
        return "/jsp/stu_score.jsp";
        
    }
    @RequestMapping("/user/getStuScoreBySession")
    public  String getStuScore(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        List<Student> list=ss.getStuScore(userAccount);
        System.out.println(list.toString()+"======"+list.size());
        model.addAttribute("list" , list);
        model.addAttribute("account" , userAccount);
        return "/jsp/stu_score.jsp";
        
    }

    @RequestMapping("/user/toModifyStuScore")
    public String toModifyStuScore(){


        return "jsp/login.jsp";
    }
    @RequestMapping("/stu/modifyScore")
    public void modifyScore(Student student,PrintWriter pw){
        ObjectMapper om=new ObjectMapper();
        Map<String,Object> map=new HashMap<String,Object>();
        boolean flag=false;
        flag=ss.updateScoreInfo(student);
        System.out.println(flag+"《《《-----");
        map.put("flag" , flag);
        String jsonString;
        try{
            jsonString = om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
            
        }catch(JsonProcessingException e){
            e.printStackTrace();
        }
    }
    @RequestMapping("/stu/deleteStuScore")
    public void deleteStuScore(String studentId,Integer courseId,PrintWriter pw){
        System.out.println(studentId+"---->"+courseId);
        ObjectMapper om=new ObjectMapper();
        Map<String,Object> map=new HashMap<String,Object>();
        boolean flag=false;
        flag=ss.deleteStuScoreInfo(studentId , courseId);
        map.put("flag" , flag);
        String jsonString;
        try{
            jsonString = om.writeValueAsString(map);
            pw.write(jsonString);
            pw.flush();
            pw.close();
            
        }catch(JsonProcessingException e){
            e.printStackTrace();
        }
        return ;
    }
    @RequestMapping("/stu/insertStuScore")
    public String  insertStuScore(Student student,Model model){
        System.out.println("进入数据上传");
        String account=student.getStudentId();
        Integer CourseId=student.getCourseId();
        boolean flag=ss.insertStuScore(student);
        List<Student> list=ss.getStuScore(account);
        model.addAttribute("list" , list);
        model.addAttribute("account" , account);
        return "/jsp/stu_score.jsp";
    }
    @RequestMapping("/stu/toInsertStuScore")
    public String   toInsertStuScore(String account,Model model){
        model.addAttribute("account" , account);
        return"/jsp/stu_score_add.jsp";
    }
    @RequestMapping("/stu/toCourseInfo")
    public String toStuCourseInfo(){
        
        
        return "/jsp/to_stu_course.jsp";
    }
    @RequestMapping("/stu/getCourseInfoById")
    public String getStuCourseInfo(String account,Model model){
        List<SchoolCourse> list=ss.getStuCourseInfoById(account);
        model.addAttribute("list" , list);
        return "/jsp/to_stu_course_list.jsp";
    }
    @RequestMapping("/stu/toStudentList")
    public String toStudentList(Model model){
        List<Student> list=ss.getStudentList(0 , 7);
        System.out.println(list.toString());
        int count=ss.getStudentCount();
        int temp=count%7;
        if(temp>0){
            count=count/7+1;
            
        }
        model.addAttribute("list" , list);
        model.addAttribute("count" , count);
        System.out.println("数量----"+count);
        return "/jsp/StudentInfo.jsp";
    }
    @RequestMapping("/stu/toTargetStuListInfo")
    public void toTargetStuInfoPage(Integer Page,PrintWriter pw){
        int startNum=(Page-1)*3;//开始坐标
        List<Student> list=ss.getStudentList(startNum , 3);
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
    @RequestMapping("/stu/addStudent")
    public void  addTeacherInfo(User user,Student student,PrintWriter pw){
        boolean flag=false;
        student.setStudentId(user.getAccount());
        System.out.println(user.toString()+"====="+student.toString());
        int tag=ss.addStudent(student);
        if(tag>=0){
            flag=true;
        }
        user.setPassword("123");
        us.addUser(user);
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
    @RequestMapping("/stu/deleteStuById")
    public void deleteStuInfoById(String account,PrintWriter pw){
        boolean flag=false;
        System.out.println("编号---->>>"+account);
        int tag=ss.deleteStuById(account);
        int ll=us.deleteUserInfoByAccount(account);
        System.out.println("影响的行数-->"+ll);
        if(tag>=0)
        {
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
    @RequestMapping("/stu/getSignalStudent")
    public void getSignalStuInfoByAccount(String account,PrintWriter pw){
        Student student=ss.getSignalStudent(account);
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("student" , student);
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
    @RequestMapping("/student/toStudentList")
    public String toStudentList(){
        
        return"/jsp/to_stu_course.jsp";
    }

    @RequestMapping("/student/getStudentCourseList")
    public String toStudentCouseList(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        List<SchoolCourse> list=scs.getCourseInfoByStuId(userAccount);
        model.addAttribute("list" , list);
        return "/jsp/to_stu_course_list.jsp";
    }
    @RequestMapping("/student/getStudentAssmentList")
    public String getStudentAssmentList(HttpServletRequest request,Model model){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        System.out.println("账号"+userAccount);
        List<TeacherAssment> list=ts.getStudentAssmentByStuId(userAccount , 0 , 4);
        System.out.println("获取信息----"+list);
        int count=ts.getTeacherAssmentCount();
        System.out.println(list.toString());
        model.addAttribute("list" , list);
        model.addAttribute("count" , count);
        return "/jsp/student_assment.jsp";
    }
    @RequestMapping("/student/toTargetStudentAssmentList")
    public void toTargetStudentAssmentList(Integer Page,HttpServletRequest request,PrintWriter pw){
        System.out.println(Page+"<<<<<<<<<------");
        int startNum=(Page-1)*4;//开始坐标
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        List<TeacherAssment> list=ts.getStudentAssmentByStuId(userAccount , startNum , 4);
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
    @RequestMapping("/student/studentToAddTeacherAssmentInfo")
    public void toAddTeacherAssmentInfoById(HttpServletRequest request,TeacherAssment teacherAssment,PrintWriter pw){
        boolean flag=false;
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        
        TeacherAssment temp=ts.checkExist(teacherAssment.getTea_id() , teacherAssment.getStu_id());
        System.out.println("-----******"+temp);
        if(temp==null){
            teacherAssment.setStu_id(userAccount);
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
    @RequestMapping("/student/toAddAssment")
    public String toAddAssment(Model model,HttpServletRequest request){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        System.out.println("学生账号----"+userAccount);
        List<SchoolCourse> list=scs.getAssmetTeacherByStuId(userAccount);
        System.out.println("教师----->>>"+list.toString());
        model.addAttribute("list" , list);
        return"/jsp/student_assment_add.jsp";
    }
    @RequestMapping("student/studentAddAssment")
    public void studentAddAssment(HttpServletRequest request,TeacherAssment teacherAssment,PrintWriter pw){
        boolean flag=false;
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        TeacherAssment temp=ts.checkExist(teacherAssment.getTea_id() , userAccount);
        System.out.println("-----******"+temp);
        if(temp==null){
            teacherAssment.setStu_id(userAccount);
            teacherAssment.setAssment_status("已评价");
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
    @RequestMapping("/stu/addStuCarAppoint")
    public void addCourse(SchoolCourse  schoolCourse,HttpServletRequest request ,PrintWriter pw)
    {
        HttpSession session=request.getSession();
        String account=(String)session.getAttribute("account");
        String teaId=schoolCourse.getTea_id();
        Teacher teacher=tas.getTeaInfoByTeaId(teaId);
        Car car=cs.getCarInfoById(teacher.getCar_id());
        car.setStartTime(schoolCourse.getCourse_time());
        car.setEndTime(schoolCourse.getEndTime());
        car.setCar_status("已占用");
        cs.modifyCarTimeInfoById(car);
        schoolCourse.setStu_id(account);
        boolean flag=false;
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
}
