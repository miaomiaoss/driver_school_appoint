package com.lanysec.rbac.user.service.web;

import com.lanysec.rbac.user.model.web.User;

public interface UserService {
    /**
     *
     * FunName: login
     * Description : 通过账号和密码获取用信息
     * @param：
     *      string account 账号
     * @param：
     *      string password 密码,需要进行加密
     * @return User对象或者抛出异常
     *
     * @Author: pangsir
     * @Create Date: 2016-10-12
     */
    public User login(String account,String password);
    public User  getUserInfoById(String account);
    public boolean updateUserById(User user);
    public boolean deleteUserInfoById(int userId);
    public boolean modifyUserPass(String account, String password);
    public int addUser(User user);
    public int deleteUserInfoByAccount(String account);
}
