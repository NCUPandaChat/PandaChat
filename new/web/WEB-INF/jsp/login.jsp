<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录页面</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">

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
        <div class="foot1">
            <div class="finger"></div>
        </div>
        <div class="foot1 rgt">
            <div class="finger"></div>
        </div>
    </div>
    <form style="height: 350px" method="post" action="${pageContext.request.contextPath}/user/login">

        <div class="hand"></div>
        <div class="hand rgt"></div>
        <h1>用户登录</h1>
        <div class="form-group">
            <input name="userId" id="userid" type="text" required="required" class="form-control" onblur="checkid()"/>
            <label  class="form-label" >用户名</label>
        </div>
        <div class="form-group">
            <input name="password" id="password" type="password" required="required" class="form-control"/>
            <label class="form-label">密码</label>
<%--            <input id="login" onclick="check_pwd()" class="btn"  type="submit" value="登录"/><br>--%>
            <input id="login" class="btn"  type="submit" value="登录"/><br>
            <input type="button" class="btn1" onclick="window.location.href='${pageContext.request.contextPath}/user/toRegistered'" value="注 册 新 账 号"/><br><br>
            <a href="${pageContext.request.contextPath}/user/toReset_pwd" >忘记密码？</a>
        </div>
    </form>
</div>


<script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/script.js"></script>
<script>

$(function(){
    var dat = "${error}";
    console.log(dat);
    if(dat == "false"){
        alert("密码错误");
    }
    else if (dat == "error_status") {
        alert("该用户已在线，请勿重新登录");
    }
});
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

</script>

</body>
</html>
