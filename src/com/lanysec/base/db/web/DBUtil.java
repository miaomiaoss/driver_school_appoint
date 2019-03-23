package com.lanysec.base.db.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public final class DBUtil {
    /**数据库的练习信息*/
    private static final String USERNAME="root";
    private static final String PASSWORD="shxt";
    private static final String URL="jdbc:mysql://127.0.0.1:3306/vip";//设置编码格式
    private static final String DRIVER="com.mysql.jdbc.Driver";

    private DBUtil(){}

    static{
        try{
            Class.forName(DRIVER);
        }catch(ClassNotFoundException e){
            throw new RuntimeException("连接数据库失败,原因为:"+e.getMessage());
        }
    }
    
    public static Connection getConnection(){
        try{
            return DriverManager.getConnection(URL , USERNAME , PASSWORD);
        }catch(SQLException e){
            throw new RuntimeException("获取Connection失败,原因为:"+e.getMessage());
        }
    }
    
}
