package com.swxy.controller;

import com.swxy.pojo.User;
import com.swxy.service.LoginService;
import com.swxy.util.JsonResult;
import com.swxy.util.MD5;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/user")
public class CodeController {
    @Autowired
    private LoginService loginSerivce;


    private static Logger logger = LogManager.getLogger(CodeController.class);

    @Autowired
    LoginService userService;

    @RequestMapping("/login")
    @ResponseBody
    public Object login(User user) {

        logger.info("登录");
//        try {
//            user.setPassword(MD5.md5(user.getPassword(), "helloworld"));
//        } catch (Exception e) {
//            e.printStackTrace();
//        }


        User userResult = userService.login(user);
        JsonResult jsonResult;


        if (userResult != null) {
            jsonResult = new JsonResult(JsonResult.STATE_SUCCESS, "", userResult);
        } else {
            jsonResult = new JsonResult(JsonResult.STATE_ERROR, "用户名密码错误", null);
        }

        return jsonResult;
    }
    @RequestMapping("/register")
    @ResponseBody
    public Object register(User user) {
        user.setUserId(Integer.parseInt(UUID.randomUUID().toString()));
        try {
            String md5password=MD5.md5(user.getPassword(), "helloworld");
            user.setPassword(md5password);
        }catch(Exception e){
            e.printStackTrace();
        }

        JsonResult jsonResult=null;
        User userResult=userService.getUserByUserName(user);

        if(userResult==null) {
            int result=userService.addUser(user);
            if(result==1) {
                //添加成功
                jsonResult = new JsonResult(JsonResult.STATE_SUCCESS,"注册成功",null);
            }else {
                //添加失败
                jsonResult = new JsonResult(JsonResult.STATE_ERROR,"注册失败",null);
            }
        }else {
            jsonResult = new JsonResult(JsonResult.STATE_ERROR,"用户名重复",null);
        }

        return jsonResult;


    }

}



