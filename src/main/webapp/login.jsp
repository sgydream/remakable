<%@ page import="com.swxy.util.TenXunYun" %><%--
  Created by IntelliJ IDEA.
  User: 无论 而且
  Date: 2023/4/6
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<section style="flex-direction: column;">
    <!-- 背景颜色 -->
    <div class="color"></div>
    <div class="color"></div>
    <div class="color"></div>
    <div class="box">
        <!-- 背景圆 -->
        <div class="circle" style="--x:0"></div>
        <div class="circle" style="--x:1"></div>
        <div class="circle" style="--x:2"></div>
        <div class="circle" style="--x:3"></div>
        <div class="circle" style="--x:4"></div>
        <!-- 登录框 -->

        <div id="containers">
            <div class="form">
                <h2 style="color:blue;">用户系统</h2>
                <form action="" id="fm">

                    <div class="item-inner">

                        <div class="inputBox">
                            <input type="text" placeholder="用户名" name="username" style="color: saddlebrown">
                        </div>
                        <div class="inputBox">
                            <input id="pwd1" type="password" placeholder="密码" name="password">
                        </div>
                        <div class="inputBox">
                            <input id="pwd2" type="password" placeholder="确认密码" name="password">
                        </div>

                        <form action="/code/fasong">
                            <div class="inputBox">
                                <div>
                                    <input type="text" id="phone" class="form-control" placeholder="请输入手机号码"
                                           name="phone"
                                           style="color: saddlebrown">
                                </div>

                            </div>

                            <div class="inputBox">
                                <input type="text" name="Code" class="form-control" placeholder="请输入验证码"
                                       style="color: saddlebrown">
                                <button class="getCode">发送短信</button>
                            </div>
                        </form>
                    </div>


                </form>
                <jsp:useBean id="TenXunYun" class="com.swxy.util.TenXunYun">

                </jsp:useBean>
                <form action=""></form>
                <%--        <div style="justify-content:flex-end;display: flex;">--%>
                <%--          <button type="button" class="btn btn-info" id="send" onclick="<%com.swxy.util.TenXunYun tenXunYun = TenXunYun;%>">点击获取验证码</button>--%>
                <%--        </div>--%>
                <div class="inputBox" align="center">

                    <button onclick="
                    checkPwd()" style="width: 150px;height: 40px;background-color: beige"
                            id="registerBut">注册
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div id="captcha" style="position: relative"></div>
    </div>
</section>

<%--<script>--%>
<%--    const seconds = 3--%>
<%--    let delay = seconds--%>
<%--    let timer = null--%>
<%--    let btn = document.querySelector("button")--%>
<%--    btn.onclick = function () {--%>
<%--        btn.disabled = true--%>
<%--        timer = setInterval(fn(), 1000)--%>
<%--    }--%>

<%--    function fn() {--%>
<%--        if (delay != 0) {--%>
<%--            btn.innerHTML = '${delay}s'--%>
<%--            btn.style.backgroundColor = "orange"--%>
<%--            delay----%>
<%--        } else {--%>
<%--            clearInterval(timer)--%>
<%--            btn.innerHTML = '发送短信'--%>
<%--            btn.style.backgroundColor = "orange"--%>
<%--            delay----%>
<%--            btn.disabled = false--%>
<%--        }--%>
<%--        return fn--%>
<%--    }--%>
<%--</script>--%>
<script>
        var phone = document.querySelector("#phone");
        function CreateXmlHttp() {
            var xhr = null
            if (window.XMLxHttpRequest) {
                var xhr = new XMLHttpRequest();
            } else if (window.ActiveXObject) {
                // IE浏览器 IE5 IE6
                xhr = new ActiveXObject('Microsoft.XMLHTTP')
            }
            return xhr
        }
        var getCodeBtn = document.querySelector(".getCode");
        getCodeBtn.addEventListener("click", function() {
            getCodeBtn.disabled = true;
            var second = 10;
            var timer = setInterval(function () {
                getCodeBtn.innerText = second + "s 后可重新获取"
                if (second <= 0) {
                    clearInterval(timer);
                    getCodeBtn.innerText = "获取验证码"
                    getCodeBtn.disabled = false;
                }
                second--;
            }, 1000);
        }

</script>
<script>

    function checkPwd() {
        var pwd1 = document.getElementById("pwd1").value;
        var pwd2 = document.getElementById("pwd2").value;
        if (pwd1 != pwd2) {
            alert("两次密码不一致！");
            return false;
        } else {
            return true;
        }
    }
</script>
<script>
    var clock = '';//定时器对象，用于页面30秒倒计时效果
    var nums = 30;
    var validateCodeButton;//按钮对象
    //基于定时器实现30秒倒计时效果
    function doLoop() {
        validateCodeButton.disabled = true;//将按钮置为不可点击
        nums--;
        if (nums > 0) {
            validateCodeButton.value = nums + '秒后重新获取';
        } else {
            clearInterval(clock); //清除js定时器
            validateCodeButton.disabled = false;//按钮又可以点击了
            validateCodeButton.value = '重新获取验证码';
            nums = 30; //重置时间
        }
    }
</script>
</body>
</html>