package com.lanysec.rbac.user.service.web;

public class Test {

    public static void main(String[] args ) {
        
        
        SchoolCourseService scs=new SchoolCourseServiceImpl();
        try{
            System.out.println("312312"+scs.getAssmetTeacherByStuId("account"));
            
        }catch(Exception e){
            // TODO Auto-generated catch block
        }
    }

}
