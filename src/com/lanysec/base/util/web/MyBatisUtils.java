package com.lanysec.base.util.web;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public  class MyBatisUtils {

    private MyBatisUtils(){}//单例模式-四种

    private final static String PATH = "mybatis-config.xml";
    
    private static SqlSessionFactory factory;
    static{
        try{
            InputStream is  = Resources.getResourceAsStream(PATH);//读取核心配置文件
            System.out.println("流------>>>"+is.toString());
            factory = new SqlSessionFactoryBuilder().build(is);
            //System.out.println("会话--->>"+factory.openSession().toString());
        }catch(IOException e){
            e.printStackTrace();
            throw new RuntimeException("加载文件失败,原因为:"+e.getMessage());
        }
        
    }

    public static SqlSession getSqlSession(){
        return factory.openSession();
    }

    public static void closeSqlSession(SqlSession sqlSession){
        if(sqlSession!=null){
            sqlSession.close();
        }
        
    }

}
