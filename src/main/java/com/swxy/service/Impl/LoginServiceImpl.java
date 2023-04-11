package com.swxy.service.Impl;

import com.swxy.dao.UserDao;
import com.swxy.pojo.User;
import com.swxy.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class LoginServiceImpl implements LoginService {
    @Autowired
    private UserDao userDao;


    @Override
    public User login(User user) {
        List<User> list=userDao.login(user);
        if(list==null||list.isEmpty()) {
            System.out.println("用户名，密码不匹配");
            return null;
        }else {
            System.out.println(list.get(0));
            return list.get(0);
        }
    }

    @Override
    public User getUserByUserName(User user) {
        List<User> list=userDao.getUserByUserName(user);
        if(list==null || list.isEmpty()) {
            return null;
        }
        return list.get(0);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);

    }


    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
