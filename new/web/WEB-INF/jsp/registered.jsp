<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <title>注册页面</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style.css">

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
        <div class="foot ">
            <div class="finger"></div>
        </div>
        <div class="foot rgt">
            <div class="finger"></div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/user/registered" method="post">
        <div class="hand"></div>
        <div class="hand rgt"></div>
        <h1>用户注册</h1>
        <div class="form-group">
            <input name="userId" id="userid" required="required" class="form-control" onblur="checkuserid()" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请以大写字母开头"/>
            <label  class="form-label">用户名</label>
        </div>
        <div class="form-group">
            <input name="userNickname" id="nickname" required="required" class="form-control" />
            <label  class="form-label">昵称</label>
        </div>
        <div class="form-group">
            <input name="userEmail" id="email" required="required" class="form-control" onblur="checkemail()" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请填写正确的邮箱格式"/>
            <label  class="form-label">邮箱</label>
        </div>
        <div class="form-group">
            <input id="password" type="password" required="required" class="form-control" onblur="checkpwd()" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;密码长度为6-10之间"/>
            <label class="form-label">密码</label>
        </div>
        <div class="form-group">
            <input name="userPassword" id="confirm_password" type="password" required="required" onblur="checkconfirm_pwd()" class="form-control" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;要与密码一致"/>
            <label class="form-label">确认密码</label>
            <input type="submit" class="btn" value="注 册"/><br><br>
            <input style="position: relative;top: -35px;" type="button" class="btn" value="返回登录页面" onclick="window.location.href='${pageContext.request.contextPath}/user/tologin'"/><br><br>
        </div>
    </form>
</div>

<script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/script.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
<script>
    function checkuserid() {
        var x = document.getElementById("userid").value;
        var y = x.charAt(0);
        //console.log(x);
        if (x!='') {
            if(y > 'Z' || y < 'A'){
                alert("用户名要以大写字母开头！")
                document.getElementById("userid").value="";
                return false;
            }
            $.post({
                url:"${pageContext.request.contextPath}/user/checkUserId",
                data:{'userId': $("#userid").val()},
                success:function (data) {
                    console.log(data);
                    if (data == "false") {
                        alert("该用户名已被注册");
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
            $.post({
                url:"${pageContext.request.contextPath}/user/checkUserEmail",
                data:{'email': $("#email").val()},
                success:function (data) {
                    console.log(data);
                    if (data == "false") {
                        alert("该邮箱已注册");
                        document.getElementById("email").value="";
                    }
                }
            });
        }
    }
</script>

</body>
</html>
