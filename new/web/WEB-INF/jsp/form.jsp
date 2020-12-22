<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>头像上传</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style1.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
    <style>
        .aaa{
            width: 300px;
            height: 300px;
            <%--background-image: url("${pageContext.request.contextPath}/statics/img/head5.jpg");--%>
            background-repeat:no-repeat;
            background-size:100% 100%;
            -moz-background-size:100% 100%;
            border-radius: 160px
        }
    </style>
</head>
<body>
<!--${pageContext.request.contextPath}/user/head-->
<form action="${pageContext.request.contextPath}/${userid}/upload" enctype="multipart/form-data" method="post">
    <center>
        <div style="width: 400px;height: 480px;background-color: white;margin: 50px">
            <div style="width: 400px;height: 400px;background-color: pink;">
                <p style="padding: 10px">选择头像</p >
                <div id="head" class="aaa"><img id="img_file" class="aaa" src="${pageContext.request.contextPath}/statics/img/head5.jpg"></div>
                <p>点击图片更换头像</p>
            </div>
            <table style="margin-top: 25px">
                <tr>
                    <td><input id="file" type="file" name="file"></td>
                </tr>
                <tr>
                    <td>开始上传</td>
                    <td><input type="submit" value="上传" onclick="alert('温馨提示:\n点击上传之后，需重新登陆系统')"></td>
                </tr>
            </table>
        </div>
    </center>
</form>
</body>
<script>
    //获取用户头像
    $.ajax({
        async: false,
        url: "${pageContext.request.contextPath}/getUserProfile",
        data: {'userId':'${userid}'},
        success: function (data) {
            // console.log(data);
            var src_img = '${pageContext.request.contextPath}/statics/img/' + data;
            document.getElementById('img_file').src = src_img;
        },
        error: function () {
        }
    });


    $(function(){
        //在input file内容改变的时候触发事件
        $('#file').change(function(){
            //获取input file的files文件数组;
            //$('#filed')获取的是jQuery对象，.get(0)转为原生对象;
            //这边默认只能选一个，但是存放形式仍然是数组，所以取第一个元素使用[0];
            var file = $('#file').get(0).files[0];
            //创建用来读取此文件的对象
            var reader = new FileReader();
            //使用该对象读取file文件
            reader.readAsDataURL(file);
            //读取文件成功后执行的方法函数
            reader.onload=function(e){
                //读取成功后返回的一个参数e，整个的一个进度事件
                console.log(e);
                //选择所要显示图片的img，要赋值给img的src就是e中target下result里面
                //的base64编码格式的地址
                $('#img_file').get(0).src = e.target.result;
            }
        });

        //隐藏input file控件
        $("#file").hide();

        $("#head").bind('click',function(){
            //当点击头像框时，就会弹出文件选择对话框
            $("#file").click();

        });

    });
</script>
</html>