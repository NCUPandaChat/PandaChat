<%--
  Created by IntelliJ IDEA.
  User: Mr_wei
  Date: 2020/12/12
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>重置密码</title>

    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">


</head>

<body>

<div class="dwo">
    <div class="panda">
        <div class="ear"></div>
        <div class="face">
            <div class="eye-shade"></div>
            <div class="eye-white">
                <div class="eye-ball"></div>
            </div>
            <div class="eye-shade rgt"></div>
            <div class="eye-white rgt">
                <div class="eye-ball"></div>
            </div>
            <div class="nose"></div>
            <div class="mouth"></div>
        </div>
        <div class="body"> </div>
        <div class="foot2">
            <div class="finger"></div>
        </div>
        <div class="foot2 rgt">
            <div class="finger"></div>
        </div>
    </div>
    <form style="height: 360px" action="${pageContext.request.contextPath}/user/updateUser" method="post">

        <div class="hand"></div>
        <div class="hand rgt"></div>
        <h1>重置密码</h1>
        <div class="form-group">
            <input onblur="checkid()" name="userid" id="userid"  class="form-control" placeholder="请输入账号绑定的用户名">
            <label  class="form-label" >用户名</label>
        </div>
        <div class="form-group">
            <input onblur="checkemail()" name="email" id="email"  class="form-control" placeholder="请输入账号绑定的邮箱">
            <label  class="form-label" >邮箱</label>
        </div>
        <div class="form-group">
            <input name="password" id="password" type="password"  class="form-control" placeholder="请输入新密码">
            <label class="form-label">密码</label>
        </div>
        <div class="form-group">
            <input name="confirm_password" id="confirm_password"  type="password" class="form-control" placeholder="请确认新密码">
            <label class="form-label">确认密码</label>
            <input type="submit" id="login" class="btn" value="重置密码"/><br>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/script.js"></script>
<script>
    function checkid() {
        var x = document.getElementById("userid").value;
        console.log(x);
        if (x!='') {
            $.post({
                url:"${pageContext.request.contextPath}/user/checkUserId",
                data:{'userId': $("#userid").val()},
                success:function (data) {
                    console.log(data);
                    if (data == "true") {
                        alert("该用户名不存在");
                        document.getElementById("userid").value="";
                    }
                }
            });
        }
    }

    function checkemail() {
        var x=document.getElementById("email").value;
        //console.log(x)
        if(x!=""){
            var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
            isok=reg.test(x);
            if (!isok) {
                alert("邮箱格式不正确！");
                document.getElementById("email").value="";
                return false;
            }
            if (document.getElementById("email").value!="" & document.getElementById("userid").value!="") {
                $.post({
                    url:"${pageContext.request.contextPath}/user/check_ID_Email",
                    data:{
                        'userid': $("#userid").val(),
                        'userEmail': $("#email").val()
                    },
                    success:function (data) {
                        console.log(data);
                        if (data == "false") {
                            alert("该邮箱和用户名绑定的邮箱不一致");
                            document.getElementById("email").value="";
                        }
                    }
                });
            }
            else {
                alert("请先输入用户名");
                document.getElementById("email").value="";
            }
        }
    }
</script>

</body>
</html>
