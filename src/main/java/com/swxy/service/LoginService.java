package com.swxy.service;

import com.swxy.pojo.User;

public interface LoginService {
    User login(User user);
     User getUserByUserName(User user);

    int addUser(User user);
}
