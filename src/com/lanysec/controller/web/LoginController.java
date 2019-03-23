package com.lanysec.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lanysec.rbac.user.model.web.User;
import com.lanysec.rbac.user.service.web.UserService;
@Controller
public class LoginController {
    @Autowired
    UserService us;
    
    @RequestMapping("/user/login")
    public String toLoginPage(){
        return"/jsp/login.jsp";
    }
    @RequestMapping("/user/main")
    public String Login(Model model,String userLimit,String account,String password,HttpServletRequest request){
        HttpSession session=request.getSession();
        String userAccount=(String)session.getAttribute("account");
        User user = null;
        try{
            user = us.login(account , password);
            System.out.println(user.toString());
            if(userAccount!=null){
                return "/jsp/main.jsp";
            }
            if(account.equals(user.getAccount())&&password.equals(user.getPassword())&&userLimit.equals(user.getUserLimit()))
            {
                session.setAttribute("account" , account);
                session.setAttribute("userLimit" , user.getUserLimit());
                if(user.getUserLimit().equals("管理员")){
                    return"/jsp/main.jsp";
                    
                }
                if(user.getUserLimit().equals("教员")){
                    return"/jsp/tea_main.jsp";
                    
                }
                else{
                    return"/jsp/stu_main.jsp";

                }
                
            }
            else{
                model.addAttribute("account" , account);
                model.addAttribute("error_message" , "用户名,权限或密码错误!");
                return"/jsp/login.jsp";
            }
        }catch(RuntimeException ex){
            model.addAttribute("account" , account);
            model.addAttribute("error_message" , ex.getMessage());
            return"/jsp/login.jsp";
        }
        
    }
    @RequestMapping("/user/loginOut")
    public String loginOut(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.invalidate();
        return "/jsp/login.jsp";
    }
}
