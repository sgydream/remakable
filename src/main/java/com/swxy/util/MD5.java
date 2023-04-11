package com.swxy.util;


import org.apache.commons.codec.digest.DigestUtils;

public class MD5 {
    public static String md5(String text,String key) throws Exception{
        String md5str= DigestUtils.md5Hex(text+key);
        System.out.println("MD5加密的字符串为"+md5str);
        return md5str;
    }
}
