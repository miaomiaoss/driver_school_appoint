package com.lanysec.rbac.user.model.web;

import org.springframework.stereotype.Component;

@Component("user")
public class User {
    private int userId;
    private  String account;
    private String password;
    private  String userLimit;
    public String getAccount() {
        return this.account;
    }
    public void setAccount(String account ) {
        this.account = account;
    }
    public String getPassword() {
        return this.password;
    }
    public void setPassword(String password ) {
        this.password = password;
    }
    public String getUserLimit() {
        return this.userLimit;
    }
    public void setUserLimit(String userLimit ) {
        this.userLimit = userLimit;
    }
    public int getUserId() {
        return this.userId;
    }
    public void setUserId(int userId ) {
        this.userId = userId;
    }
    @Override
    public String toString() {
        return "User [userId=" + this.userId + ", account=" + this.account + ", password=" + this.password
                + ", userLimit=" + this.userLimit + "]";
    }

}
