package com.lanysec.rbac.user.dao.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lanysec.rbac.user.model.web.Fate;

public interface FateDao {
    public List<Fate> getFateListBStudentId(@Param("studentId")String studentId);
    public List<Fate> getFateList(@Param("startNum")int startNum,@Param("Page")int Page);
    public int getCount();
    public boolean deleteFateInfoById(@Param("id")int id);
    public boolean modifyFateInfoById(@Param("fate")Fate fate);
    public boolean  addFate(@Param("fate")Fate fate);
    public Fate getSignalFateId(@Param("id")int id);
    
}
