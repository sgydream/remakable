<%--
  Created by IntelliJ IDEA.
  User: 无论 而且
  Date: 2023/4/10
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
<%--    <link rel="stylesheet" href="css/login.css">--%>
<%--    <script src="js/ajax.js"></script>--%>
<%--    <script src="js/login.js"></script>--%>
</head>
<body>
<form action="${pageContext.request.contextPath }/user/login">
<div class="container">
    <div class="login">
        <h2>Login</h2>
        <div class="box">
            <div class="form-group">
                账号 <input  name="userId" id="userId"/>
            </div>
            <div class="form-group">
                密码 <input type="password" name="password" id="pwd"/>
            </div>
        </div>

    <a href="admin.jsp">管理员登录</a>
</div>
            <button type="submit" id="btn" >登录</button>
            <button type="submit" id="wj" >忘记密码</button>
            <a href="register.jsp" id="register">注册账号</a>
        </div>
    </div>
</div>
</form>

<script>
    $(function(){
        $('#btn').click(function () {

            if($('#userId').val()==' '){
                alert("请输入用户名");
            }else if($('#pwd').val()==''){
                alert("请输入密码");
            }
            var sendData={"userId":$('#userId').val(),"password":$('#password').val()};
            $.ajax({
                type:"post",
                url:"user/login.do",
                data:sendData,
                datatype:'json',
                success:function(msg){
                    if(msg.state==1){

                        console.log(msg.data.name);
                        alert("欢迎"+msg.data.name);
                    }
                    else{
                        alert(msg.message);
                    }

                },
                error:function(msg){
                    alert('失败');
                }
            });
        })
    })

</script>
</body>
</html>
