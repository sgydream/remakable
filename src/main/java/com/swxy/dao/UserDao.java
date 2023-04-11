package com.swxy.dao;

import com.swxy.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    List<User> login(User user);
     List<User> getUserByUserName(User user);
     int addUser(User user);



}
