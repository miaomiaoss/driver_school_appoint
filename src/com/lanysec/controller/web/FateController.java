package com.lanysec.controller.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.lanysec.rbac.user.model.web.Fate;
import com.lanysec.rbac.user.service.web.FateService;

@Controller
public class FateController {
    @Autowired
    FateService fs;
    @RequestMapping("/fate/tofateInfoPage")
    public String tofateInfoPage(Integer startPage,Integer Page,Model model){
        //int startNum=(startPage-1)*Page;//开始坐标
        List<Fate> list=fs.getFateList(0 , 4);
        int count=fs.getCount();
        model.addAttribute("list" , list);
        model.addAttribute("count" , count);
        return"/jsp/fate.jsp";
    }
    @RequestMapping("/fate/toTargetFateInfoPage")
    public void toTargetFateInfoPage(Integer Page,PrintWriter pw){
        int startNum=(Page-1)*4;//开始坐标
        List<Fate> list=fs.getFateList(startNum , 4);
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
    @RequestMapping("/fate/getFateInfoById")
    public void getFateInfoById(String studentId,PrintWriter pw){
        List<Fate> list=fs.getFateListBStudentId(studentId);
        Map<String,Object> map=new HashMap<String,Object>();
        StringBuffer sb=new StringBuffer();
        for(int i=0;i<list.size();i++){
            sb.append("编号:"+list.get(i).getId()+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
            sb.append("学生姓名:"+list.get(i).getStudent().getStudentName()+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ");
            sb.append("缴费项目:"+list.get(i).getCourse().getCourseName()+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ");
            sb.append("编缴费时间:"+list.get(i).getFateTime()+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
            sb.append("缴费金额:"+list.get(i).getMoney()+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
            sb.append("缴费备注:"+list.get(i).getFateRemark()+"</br></br>");
        }
        map.put("sb" , sb);
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
    @RequestMapping("/fate/toModifyFateInfoById")
    public String toModifyFateInfoById(int keyWords ,Model model){
        Fate fate=fs.getSignalFateId(keyWords);
        model.addAttribute("fate" , fate);
        return"/jsp/fate_modify.jsp";
    }
    @RequestMapping("/fate/ModifyFateInfoById")
    public String ModifyFateInfoById(Fate fate){
        boolean flag=fs.modifyFateInfoById(fate);
        return"redirect:/fate/tofateInfoPage";
    }
    @RequestMapping("/fate/toDeleteFateInfoById")
    public void toDeleteFateInfoById(int id,PrintWriter pw){
        boolean flag=false;
        flag=fs.deleteFateInfoById(id);
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
    
    @RequestMapping("/fate/addFate")
    public void addFate(Fate fate,PrintWriter pw){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String fateTime=df.format(new Date());
        fate.setFateTime(fateTime);
        boolean flag=false;
        flag=fs.addFate(fate);
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
