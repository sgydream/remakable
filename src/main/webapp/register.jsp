<%--
  Created by IntelliJ IDEA.
  User: 无论 而且
  Date: 2023/4/10
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>猫眼电影注册</title>
</head>
<body>
<h1 align="center">猫眼电影注册</h1>
<div>
    <div>
        <form action="">
            <div align="center"> 用户名：<input type="text" name="userName" id="userName"/>
            </div>
            <div align="center"> 密码：<input type="password" name="password" id="pw1"/>
            </div>
            <div align="center"> 确认密码：<input type="text" name="userName" id="pw2"/>
            </div>
            <div align="center"> 手机号：<input type="text" name="phone" id="phone"/>
                <button class="getCode">发送短信</button>

            </div>


            <div align="center"> 验证码：<input type="text" id="code" placeholder="请输入验证码"/>
            </div>


        </form>
    </div>
    <div align="center">
        <button type="submit" id="btn" >已有帐户，点击登录</button>
        <button type="submit" id="zc" >注册</button>

    </div>

</div>


<script>
    $(function () {
        $("#zc").onclick(function () {
            if ($("#userName").val() == '') {
                alert("请输入用户名");
                $("#userName").focus();
                return;
            } else if ($("#pw1").val() == '') {
                alert("请输入密码");
                $("#pw1").focus();
                return;
            } else if ($("#pw2").val() == '') {
                alert("请确认密码");
                $("#pw2").focus();
                return;
            }

            if ($('#pw1').val() != $('#pw2').val()) {
                alert('输入密码和确认密码不一致');
                return;
            }




            var sendData = {
                "username": $('#username').val(),
                "password": $('#ps').val(),
                "passwords": $('#pss').val(),
                "name": $('#name').val(),
                "age": $('#age').val()
            };
            $.ajax({
                type: "post",
                url: "user/register.do",
                data: sendData,
                datatype: 'json',
                success: function (msg) {
                    if (msg.state == 1) {
                        alert(msg.message);
                    } else {
                        alert(msg.message);
                    }
                },
                error: function (msg) {
                    alert('通信失败');
                }
            });
        })
    })
</script>
</body>
</html>
