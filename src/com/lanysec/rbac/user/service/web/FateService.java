package com.lanysec.rbac.user.service.web;

import java.util.List;

import com.lanysec.rbac.user.model.web.Fate;

public interface FateService {
    public List<Fate> getFateListBStudentId(String studentId);
    public List<Fate> getFateList(int startNum,int Page);
    public int getCount();
    public boolean deleteFateInfoById(int id);
    public boolean modifyFateInfoById(Fate fate);
    public boolean  addFate(Fate fate);
    public Fate getSignalFateId(int id);
}
