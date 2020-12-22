<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>聊天页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/style1.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/statics/imgs/font_xiongmao/iconfont.js"></script>
    <script src="${pageContext.request.contextPath}/statics/imgs/font_laba/iconfont.js"></script>
    <script src="${pageContext.request.contextPath}/statics/imgs/font_shuaxin/iconfont.js"></script>
    <script src="${pageContext.request.contextPath}/statics/imgs/font_new/iconfont.js"></script>
    <script src="${pageContext.request.contextPath}/statics/imgs/font_baocun/iconfont.js"></script>
    <script src="${pageContext.request.contextPath}/statics/imgs/font_zhuxiao/iconfont.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font-icon/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_wo/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_laba/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_haoyouliebiao/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_liaotian/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_tuichu/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_sousuo/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_tianjia/iconfont.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_xiongmao/iconfont.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_xiaoxitongzhi/iconfont.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_new/iconfont.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_shuaxin/iconfont.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_liaotianjilu/iconfont.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_baocun/iconfont.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/imgs/font_zhuxiao/iconfont.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"/>
</head>

<body>
<div class="tail_con1">
    <!--    最左边一栏-->
    <div class="tail_con3" style="float: left;margin: 0;display: inline">
        <div class="info3">
            <!--            自己头像-->
            <center style="padding: 10px">
                <!--                显示个人资料-->
                <div id="head_photo" onmouseover="show_pro_info()"  class="head_photo">
                    <!--                    onclick="" onmouseover="Moveoutsover()" onmouseout="MoveoutSout()"-->
                    <img id="user_head" width="50px" height="50px" onmouseover="show_pro_info()" src="${pageContext.request.contextPath}/statics/img/head_2.png">
                    <div class="contenter" id="content" >
                    <div class="profile-card">
                        <div class="card-header">
                            <div class="pic">
                                <img id="user_head2" src="${pageContext.request.contextPath}/statics/img/head_2.png" >
                            </div>
                            <div class="name">昵称：<p id="nick-info" class="p_info"></p></div>
                            <div class="desc">用户名：<p id="useId-info" class="p_info"></p></div>
                            <div class="desc">年龄：<p id="age-info" class="p_info"></p></div>
                            <div class="desc">性别：<p id="sex-info" class="p_info"></p></div>
                            <div class="desc">邮箱：<p id="email-info" class="p_info"></p></div>
                            <div class="sm">
                                <a href="#" class="fab fa-qq"></a>
                                <a href="#" class="fab fa-weixin"></a>
                                <a href="#" class="fab fa-github"></a>
                                <a href="#" class="fab fa-youtube"></a>
                            </div>
                        </div>
                        <div class="desc" style="float: left">
                            个人简介：
                            <%--                                <textarea id="profile-info" name="profile-info" style="resize: none" placeholder=""></textarea>--%>
                            <p id="profile-info" class="p_info"></p>
                        </div>
                    </div>
                    <div style="float: bottom"><button style="position:relative; top: 20px" onclick = "document.getElementById('impression').style.display='block';showOwnImpression('${userid}')">点击查看好友印象</button></div>
                    <div id="impression" class="impression">
                        <a style="font-size: 18px">好友印象</a>
                        <%--                            <form>--%>
                        <center>
                            <div id="own_impress" class="impression1" style="height: 290px"></div>
                            <%--                                    <div>--%>
                            <%--                                        说点什么~<input type="text" >--%>
                            <%--                                        <button style="margin: 10px">提交</button>--%>
                            <button class="close iconfont5" id="close3" style="border-radius: 8px;background-color: #50a3a2;border: 0px" onclick = "document.getElementById('impression').style.display='none';">&#xe75d</button>
                            <%--                                    </div>--%>
                        </center>
                        <%--                            </form>--%>
                    </div>
                </div>
                </div>


            </center>
            <!--            聊天（暂时未写）-->
            <div>
                <button class="iconfont4" style="margin: 15px 10px 15px 11px" title="聊天" onclick = "click_word();document.getElementById('link').style.display='none';document.getElementById('online_p').style.display='block';document.getElementById('online_hr').style.display='block';document.getElementById('online_button').style.display='block';document.getElementById('words').style.display='block';document.getElementById('online_list').style.display='block'">&#xe64c;</button>
                <div class="online_list" style="width: 168px; position: absolute;top: 40px;height: 558px;left: 72px" >
                    <p id="online_p" style="font-family:宋体;font-size: 12px;color: grey;display: none">在线好友</p ><hr id="online_hr" style="display: none">
                    <div id="online_list" class="online_list" style="overflow:auto;display:none;width: 168px; position: absolute;top: 42px;height: 518px;left: 1px"></div>
                    <button id="online_button" class="close iconfont5" style="display: none;background-color: #f9f9f9;border: 0px"  onclick = "document.getElementById('online_p').style.display='none';document.getElementById('online_hr').style.display='none';document.getElementById('online_button').style.display='none';document.getElementById('online_list').style.display='none';document.getElementById('words').style.display='none'">&#xe75d</button>
                </div>
                <div class="words" id="words" style="z-index: 2;position: absolute;width:606px;height:601px;top: -1px;left: 244px;">
                    <center><div id="chat_userId" style="height: 20px;background-image: linear-gradient(-90deg, #f2c5ae 0%, #e0b1e0 100%);font-family: Roboto " >To:???</div></center>
                    <div class="talk_show" id="word">
<%--                        <div class="atalk"><img src="${pageContext.request.contextPath}/statics/img/head_1.png">&nbsp;&nbsp;&nbsp;<p>A：你还好吗？</p></div>--%>
<%--                        <div class="btalk"><p>B：嗯，你呢？</p>&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/statics/img/head_1.png"></div>--%>
                    </div>
                    <div style="margin: 10px">
                        <button id="down" class="iconfont8" title="下载聊天记录">&#xe637;</button>
                    </div>
                    <div class="talk_input">
                        <%--            <select class="whotalk" id="who">--%>
                        <%--                <option value="0">A：</option>--%>
                        <%--                <option value="1">B：</option>--%>
                        <%--            </select>--%>
                        <%--            <button class="whotalk" id="who">toUser:???</button>--%>
<%--                        <input type="text" class="talk_word" id="talkwords">--%>
                        <textarea class="talk_word" id="talkwords" style="font-family:宋体;font-size:14px;padding-top: 5px;width:500px;height: 75px;overflow: auto; resize: none"></textarea>
                        <button class="talk_sub" id="talksub" onclick="send();addChatRecord();update_scroll()" style="border: 0px;background-color: white">
                            <svg class="icon5" aria-hidden="true" style="border: 0px;background-color: white">
                                <title>发送</title>
                                <use xlink:href="#icon-fasong"></use>
                            </svg>
                        </button>
<%--                        <input type="button" value="发送" class="talk_sub" id="talksub" onclick="send();addChatRecord()">--%>
                        <button class="close iconfont5" id="close5" style="background-color: #f2c4b1;border: 0px" onclick = "document.getElementById('words').style.display='none'">&#xe75d;</button>
                    </div>
                </div>
            </div>
            <div>
                <!--            好友列表按钮-->
                <button class="iconfont2" style="margin: 15px 10px 15px 11px" title="好友列表" onclick = "document.getElementById('link').style.display='block';getFriendList()">&#xe666;</button>
                <!--                显示好友列表-->
                <div id="link" class="link_content" style="width: 168px; position: absolute;top: 40px;height: 558px;left: 72px" >
                    <p style="font-family:宋体;font-size: 12px;color: grey">新的朋友</p><hr>
                    <!--                    好友申请弹窗按钮-->
                    <div class="new_friend" onclick = "document.getElementById('relationship').style.display='block',getNotice('${userid}') ">
                        <button class="iconfont6">&#xe6d8;</button><p class="new_p" >新的朋友</p >
                    </div>
                    <br>
                    <!--                    我的好友列表-->
                    <p style="font-family:宋体;font-size: 12px;color: grey;width: 50px;display: inline">我的朋友</p>
                    <hr>

                    <span id="span1" style="width: 100%;height: 28px;font-family:宋体;font-size:16px;border:none;display:block;cursor:pointer;" onclick="openDiv();change_color()">朋友</span>
                    <div class="friendList" id="friendList" style="display: none" >

                    </div>
<%--                    <hr style="width: 166px">--%>
                    <!--                    退出好友列表弹窗按钮-->
                    <button class="close iconfont5" id="close1" style="background-color: white;border: 0px"  onclick = "document.getElementById('link').style.display='none';document.getElementById('relationship').style.display='none'">&#xe75d</button>
                </div>
                <!--                好友申请弹窗内容-->
                <div id="relationship" class="relationship" style="z-index: 3;position: absolute;width:606px;height:601px;top: -1px;left: 244px;">
                    <p>好友请求</p>
                    <hr>
                    <ul class="apply msg-box">

                    </ul>
                    <!--                    退出好友申请弹窗按钮-->
                    <button class="close iconfont5" style="border: 0px;background-color: #f1c4b2"  onclick = "document.getElementById('relationship').style.display='none'">&#xe75d</button>
                </div>
            </div>
            <%--个人资料--%>
            <div>
                <!--                个人资料弹窗按钮-->
                <button class="iconfont3" style="margin: 15px 10px 15px 11px;" title="个人资料" onclick="document.getElementById('light').style.display='block';show_userInfo()">&#xe61e;</button>
                <!--                个人资料内容-->
                <!--                以下12.16修改添加的内容-->
                <!--                <div id="light" class="white_content">-->
                <div class="Content-Main white_content" id="light">
                    <form method="post" class="form-userInfo">
                        <h1>个人信息</h1>
                        <span class="text1">请在文本框中完善您的个人信息：</span>
                        <p>
                        <div class="fileInputContainer">
                            <img id="update_info_head"  width='50px' height='50px' src="${pageContext.request.contextPath}/statics/img/head_1.jpg">
                        </div>
                        <a href="${pageContext.request.contextPath}/user/toChange_head"><p>更换头像</p></a>

                        <label>
                            <span style="text-shadow: 1px 1px 1px #444;color: #D3D3D3;">昵称</span>
                            <input id="info_nickName" type="text"  name="name" placeholder="">
                        </label>
                        <label>
                            <span>年龄</span>
                            <input id="info_age" type="text"  name="age" placeholder="你的年龄">
                        </label>
                        <label class="Main-sex">
                            <span>性别</span>
                            <input id="sex_man" type="radio" name="sex" class="man" value="1">男
                            <input id="sex_male" type="radio" name="sex" class="women" value="2">女
                            <input id="sex_none" type="radio" name="sex" class="none" value="0">未知
                        </label>
                        <label>
                            <span>邮箱</span>
                            <input id="info_email" type="email" name="email" placeholder="@.com">
                        </label>
                        <label>
                            <span>个人介绍</span>
                            <textarea id="message" name="message" style="resize: none" placeholder=""></textarea>
                        </label>
                        <label>
                            <center><button type="button" onclick="change_pro_info()"  class="button" >
                                <svg class="icon5" aria-hidden="true" style="border: 0px;background-color: white">
                                    <title>保存</title>
                                    <use xlink:href="#icon-save"></use>
                                </svg>
                            </button></center>
<%--    <center><input onclick="change_pro_info()" type="button" class="button" value="保存"></center>--%>
                        </label>
                    </form>
                    <button class="close iconfont5" style="background-color: #f0c3b5;border: 0px" id="close" onclick = "document.getElementById('light').style.display='none'">&#xe75d</button>
                </div>
                <!--                    退出个人资料弹窗按钮-->
                <!--                </div>-->
                <!--                以上12.16-->
            </div>
            <div style="position: absolute; bottom: 10px">
                <button class="iconfont4" onclick="window.location.href='${pageContext.request.contextPath}/user/logout'" style="margin: 15px 10px 15px 11px">
                    <svg class="icon5" aria-hidden="true" style="border: 0px;background-image: linear-gradient(-90deg, #f2c5ae 0%, #e0b1e0 100%);font-size: 30px;">
                        <title>注销</title>
                        <use xlink:href="#icon-zhuxiaosuoping"></use>
                    </svg>
                </button>
            </div>
        </div>
    </div>

    <div class="tail_con2" style="float:left; margin:0;display:inline" >
        <div class="back"style="display: inline ">
<%--            <span class="iconfont" style="line-height: 40px;  font-size: 16px; float: left; background-color:#dbd9d8" >&#xe646;</span>--%>
<%--            <input type="text" class="search-text" style="background-color: #dbd9d8;width: 100px ;float: left" placeholder="搜索联系人">--%>
            <div class="search-text" style="background-image: linear-gradient(-90deg, #f2c5ae 0%, #e0b1e0 100%);width: 128px ;float: left;margin-top: 2px;margin-left: 2px;">
                昵称:<span id="ownNickname" style="display: inline-block"></span>
            </div>
            <button style="margin-top: 2px;" class="add_button iconfont"  onclick="document.getElementById('search').style.display='block'" title="添加好友">&#xe612;</button>
            <div id="search" class="search_content" >
                <center>
                    <input id="input" type="text" autocomplete="off" class="search_friend" placeholder="请输入用户名/昵称/邮箱进行查找">
<%--                    <button id="btn" class="search_button" onclick="searchUser()">查找</button>--%>
                    <button class="search_button" onclick="searchUser()" style="border: 0px;background-color: white" >
                        <svg class="icon5" aria-hidden="true" style="border: 0px;background-color: white;font-size: 30px;margin: -6px">
                            <title>查找</title>
                            <use xlink:href="#icon-chazhao"></use>
                        </svg>
                    </button>
                </center>
                <button class="close iconfont5" style="background-color:#c7d2e4;border: 0px " id="close2" onclick = "document.getElementById('search').style.display='none'">&#xe75d</button>
                <div class="bottom_search">
                    <div class="contenter_search" id="content_search" >
                        <div class="profile-card">
                            <div id="search_card" class="card-header">
                                <div class="pic">
                                    <img id="user_head_search" src="${pageContext.request.contextPath}/statics/img/head_2.png" >
                                </div>
                                <div class="name">昵称：<p id="nick-info_search" class="p_info"></p></div>
                                <div class="desc">用户名：<p id="useId-info_search" class="p_info"></p></div>
                                <div class="desc">年龄：<p id="age-info_search" class="p_info"></p></div>
                                <div class="desc">性别：<p id="sex-info_search" class="p_info"></p></div>
                                <div class="desc">邮箱：<p id="email-info_search" class="p_info"></p></div>
                                <div class="sm">
                                    <a href="#" class="fab fa-qq"></a>
                                    <a href="#" class="fab fa-weixin"></a>
                                    <a href="#" class="fab fa-github"></a>
                                    <a href="#" class="fab fa-youtube"></a>
                                </div>
                                <button class="close iconfont5" style="background-color: #f1c4b0;border: 0px" id="close_search" onclick = "document.getElementById('content_search').style.display='none'">&#xe75d</button>
                            </div>
                        </div>
                    </div>
                    <div class="bottom"></div>
                </div>
            </div>
        </div>
<%--        <div id="online_friend" class="online_friend">--%>
<%--            <p>傻逼</p>--%>
<%--        </div>--%>
    </div>
    <%--聊天框--%>
    <div class="talk_con" style="float:left; vertical-align: middle">
<%--        <center><div id="chat_userId" style="background-color:yellow;font-family: Roboto " >To:???</div></center>--%>
<%--        <div class="talk_show" id="word">--%>
<%--            <div class="atalk"><img src="${pageContext.request.contextPath}/statics/img/head_1.png">&nbsp;&nbsp;&nbsp;<p>A：你还好吗？</p></div>--%>
<%--            <div class="btalk"><p>B：嗯，你呢？</p>&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/statics/img/head_1.png"></div>--%>
<%--        </div>--%>
<%--        <div class="talk_input">--%>
<%--&lt;%&ndash;            <select class="whotalk" id="who">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="0">A：</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="1">B：</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </select>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <button class="whotalk" id="who">toUser:???</button>&ndash;%&gt;--%>
<%--            <input type="text" class="talk_word" id="talkwords">--%>
<%--            <input type="button" value="发送" class="talk_sub" id="talksub" onclick="send();addChatRecord()">--%>
<%--        </div>--%>
        <center>
            <svg class="icon1"  aria-hidden="true">
                <use xlink:href="#icon-aichong29"></use>
            </svg>
            <div><a class="box" >Welcome PandaChat</a></div>
        </center>
    </div>

    <div class="tail_con4">
        <div>
            <center>
                <svg class="icon2" aria-hidden="true"  style="font-size: 30px;margin: 15px 10px 15px 11px">
                    <use xlink:href="#icon-laba"></use>
                    <title>广播</title>
                </svg>
                <div style="width: 140px;height: 400px;background-color: white;overflow: auto">
                    <div style="display: inline-block">您有：<p id="friend_req" style="display:inline-block;"></p>条好友申请<br></div>
                    <div id="broadcast"></div>
                </div>
                <button style="margin: 20px;background-image: linear-gradient(-90deg, #f2c5ae 0%, #e0b1e0 100%);border: 0px" type="reset" onclick="document.getElementById('broadcast').innerHTML=''">
                    <svg class="icon2" aria-hidden="true"  style="font-size: 22px">
                        <use xlink:href="#icon-icon-test"></use>
                        <title>刷新</title>
                    </svg>
                </button>
            </center>
        </div>
    </div>
</div>
</body>
<script>
    //定义全局变量
    var userid;
    var toUserid;
    var mes;
    var chatRecord;
    var filename;

    // $("#head_photo").hover(function () {
    //     $("#content").slideToggle()
    // })

    function getFriendList() {
        var friendlist;
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/friend/getFriend',
            data: {
                'userid':'${userid}',
            },
            success: function (data) {
                console.log(data);
                friendlist = data;
                // console.log("friendList_extend"+friendList_extend);
                showFriend(friendlist);
            },
            error: function () {
                console.log("erro_show_friend_list")
            }
        });
    }

    function showFriend(friendlist){
        // console.log(friendlist);
        $("#friendList").html("");    //清空好友列表
        $.each(friendlist, function(index, item){     //添加私聊按钮
            var li = "<li>"+item+"</li>";
            var userProfile;
            // console.log(li);
            if('${userid}' != item){    //排除自己
                //请求获得头像
                $.ajax({
                    async: false,
                    url: "${pageContext.request.contextPath}/getUserProfile",
                    data: {'userId':item},
                    success: function (data) {
                        userProfile = data;
                    },
                    error: function () {
                    }
                });
                li = "<li class='new_friend' onclick=\"addChat('"+item
                    +"');document.getElementById('words').style.display='block';\"><img id=\""+item+"_friend_head\" onmouseover=\"Moveoutsover('"+item+"_show');show_pro_info_friend('"+item+"')\" onmouseout=\"MoveoutSout('"+item+"_show')\""+" width='40px' height='40px' id='"+item+"_friend' class='avatar' src=\"${pageContext.request.contextPath}/statics/img/" + userProfile + "\">"
                    +"<span "+"style=\"line-height:40px\"" +">"+item+"</span>"+" <button class=\"delete-btn\" " +
                    " onclick=\"deleteFriend('"+item+"')\" >删除</button></li>" ;
            }

            $("#friendList").append("<div class='contenter' id='"+item+"_show' onmouseover=\"Moveoutsover('"+item+"_show');show_pro_info_friend('"+item+"')\" onmouseout=\"MoveoutSout_Q('"+item+"_show')\">"+
            "                           <div class=\"profile-card\">\n" +
            "                            <div class=\"card-header\">\n" +
            "                                <div class=\"pic\">\n" +
            "                                    <img id='"+item+"_head_h' width='100px' height='100px' src=\"${pageContext.request.contextPath}/statics/img/" + userProfile + "\">" +
            "                                </div>\n" +
            "                                <div class=\"name\">昵称：<p id=\""+item+"_nick-info_f\" class=\"p_info\"></p></div>\n" +
            "                                <div class=\"desc\">用户名：<p id=\""+item+"_useId-info_f\" class=\"p_info\"></p></div>\n" +
            "                                <div class=\"desc\">年龄：<p id=\""+item+"_age-info_f\" class=\"p_info\"></p></div>\n" +
            "                                <div class=\"desc\">性别：<p id=\""+item+"_sex-info_f\" class=\"p_info\"></p></div>\n" +
            "                                <div class=\"desc\">邮箱：<p id=\""+item+"_email-info_f\" class=\"p_info\"></p></div>\n" +
            "                                <div class=\"sm\">\n" +
            "                                    <a href=\"#\" class=\"fab fa-qq\"></a>\n" +
            "                                    <a href=\"#\" class=\"fab fa-weixin\"></a>\n" +
            "                                    <a href=\"#\" class=\"fab fa-github\"></a>\n" +
            "                                    <a href=\"#\" class=\"fab fa-youtube\"></a>\n" +
            "                                </div>\n" +
            "                            </div>\n" +
            "                            <div class=\"desc\" style=\"float: left\">\n" +
            "                                个人简介：\n" +
            "<%--                                <textarea id=\"profile-info\" name=\"profile-info\" style=\"resize: none\" placeholder=\"\"></textarea>--%>\n" +
            "                                <p id=\""+item+"_profile-info_f\" class=\"p_info\"></p>\n" +
            "                            </div>\n" +
            "                        </div>\n" +
            "                        <div style=\"float: bottom\"><button style=\"position:relative; top: 20px\" onclick = \"document.getElementById('"+item+"').style.display='block';showImpression('"+item+"')\">点击查看/添加好友印象</button></div>\n" +
            "                        <div id=\""+item+"\" class=\"impression\">\n" +
            "                            <a style=\"font-size: 18px\">好友印象</a>\n" +
            "<%--                            <form>--%>\n" +
            "                                <center>\n" +
            "                                    <div id=\""+item+"_impress\" class=\"impression1\"></div>\n" +
            "                                    <div>\n" +
            "                                        说点什么~<input id=\""+item+"_impressInput\" type=\"text\" >\n" +
            "                                        <button onclick=\"updateImpression('"+item+"')\" style=\"margin: 10px\">提交</button>\n" +
            "                                        <button class=\"close iconfont5\" id=\"close3\" style=\"border-radius: 8px;background-color: #50a3a2;border: 0px\" onclick = \"document.getElementById('"+item+"').style.display='none';\">&#xe75d</button>\n" +
            "                                    </div>\n" +
            "                                </center>\n" +
            "<%--                            </form>--%>\n" +
            "                        </div>" +
            "</div>");

            $("#friendList").append(li);
        });
        //$("#friendnum").text($("#friendlist li").length);     //获取好友人数
    }

    function show_Online_Friend(friendlist){
        $("#online_list").html("");    //清空好友列表
        $.each(friendlist, function(index, item){
            var userProfile;
            $.ajax({
                async: false,
                url: "${pageContext.request.contextPath}/getUserProfile",
                data: {'userId':item},
                success: function (data) {
                    userProfile = data;
                },
                error: function () {
                }
            });
            // console.log(item);
            var li = "<li>"+item+"</li>";
            // console.log(li);
            if('${userid}' != item){    //排除自己
                li = "<li class='new_friend' onclick=\"addChat('"+item
                    +"');document.getElementById('words').style.display='block'\"><img id='"+item+"_head' width='40px' height='40px' id='"+item+"_friend' class='avatar' src=\"${pageContext.request.contextPath}/statics/img/" + userProfile + "\">"
                    +"<span "+"style=\"line-height:40px\" onclick=\"update_scroll()\"" +">"+item+"</span>"+" <button class=\"delete-btn\" " +
                    " onclick=\"deleteFriend('"+item+"')\" >删除</button></li>" ;
                $("#online_list").append(li);
                //请求获得头像
                <%--$.ajax({--%>
                <%--    url: "${pageContext.request.contextPath}/info/head",--%>
                <%--    data: {'userid':item},--%>
                <%--    success: function (data) {--%>
                <%--        // console.log("online====>head===>"+data);--%>
                <%--        document.getElementById(item+'_head').src = data;--%>
                <%--    },--%>
                <%--    error: function () {--%>
                <%--    }--%>
                <%--});--%>
            }
        });
        //$("#friendnum").text($("#friendlist li").length);     //获取好友人数
    }

    //增加聊天记录
    function addChatRecord(){
        $.ajax({
            url:"${pageContext.request.contextPath}/chatRecord/addChatRecord",
            data:{
                'userid':userid,
                'toUserid':toUserid,
                'content':mes
            }
        })
    }
    //下载聊天记录
    function downLoadChatRecord(filename, content) {
        var blob = new Blob([content], {type: 'text/plain'});
        var url = window.URL.createObjectURL(blob);
        var a = document.createElement('a');

        a.style = "display: none";
        a.href = url;
        a.download = filename;
        document.body.appendChild(a);
        a.click();

        setTimeout(function () {
            document.body.removeChild(a);
            window.URL.revokeObjectURL(url);
        }, 5);
    }
    //设置的一个点击事件,设置了默认的文件名和路径
    //默认文件名改成了聊天双方的名字
    document.getElementById('down').onclick = function () {
        filename = userid+"和"+toUserid+".txt";
        var content = chatRecord;
        downLoadChatRecord(filename, content);
    };

    //显示聊天记录，并且将
    function showChatRecord(){
        $.post({
            url: '${pageContext.request.contextPath}/chatRecord/searchChatRecord/'+userid+'/'+toUserid,
            success:function (res){
                var message = "";
                //建立一个单纯用来显示聊天记录的变量
                var data = "";
                $(".talk_show").html("");
                var a_talk_img_src;
                var b_talk_img_src;
                if (res.length > 0) {
                    //请求获得头像
                    $.ajax({
                        async: false,
                        url: "${pageContext.request.contextPath}/getUserProfile",
                        data: {'userId':userid},
                        success: function (data) {
                            a_talk_img_src = data;
                        },
                        error: function () {
                        }
                    });
                    $.ajax({
                        url: "${pageContext.request.contextPath}/getUserProfile",
                        data: {'userId':toUserid},
                        async:false,
                        success: function (data) {
                            // console.log("online====>head===>"+data);
                            b_talk_img_src = data;
                        },
                        error: function () {
                        }
                    });
                    console.log('+a_talk_img_src+'+a_talk_img_src);
                    console.log('+b_talk_img_src+'+b_talk_img_src)
                }
                for (var i = 0;i<res.length;i++){
                    //if（userid == res.firstperson）,$("#message").append(data);btalk类，属于我发给其他人的消息
                    if(userid == res[i].firstperson){
                        data = '<div class="btalk"><p class="btalk">'+res[i].content+'</p><img height="40px" width="40px" id="a_talk_img_src" src=\"${pageContext.request.contextPath}/statics/img/'+ a_talk_img_src +'\"></div>'
                        $(".talk_show").append(data+'<br>')
                    }
                    else {
                        data = '<div class="atalk"><img height="40px" width="40px" id="b_talk_img" src=\"${pageContext.request.contextPath}/statics/img/'+ b_talk_img_src +' \"><p class="atalk">'+res[i].content+'</p></div>'
                        $(".talk_show").append(data+'<br>')
                    }
                    //else $("#message").append(data);atalk类，属于其他人发给我的消息

                    message += res[i].firstperson+" 对 "+res[i].secondperson+" 说 "+res[i].content+"    时间："+res[i].time+'<br>\n';
                    // console.log(message);
                }

                chatRecord = message;
                update_scroll();
            }
        })
    }

    $(function() {
        setInterval("searchNotice()", 1000);
        get_user_head();

        $.ajax({
            async: false,
            url: "${pageContext.request.contextPath}/${userid}",
            <%--data: {'userId':'${userid}'},--%>
            success: function (data) {
                document.getElementById('ownNickname').innerHTML = data.nickname;
            },
            error: function () {
            }
        });
    });

    //登录便获取用户头像
    function get_user_head() {
        $.ajax({
            async: false,
            url: "${pageContext.request.contextPath}/getUserProfile",
            data: {'userId':'${userid}'},
            success: function (data) {
                console.log(data);
                var src_head = "${pageContext.request.contextPath}/statics/img/"+data;
                document.getElementById('user_head').src = src_head;
                document.getElementById('user_head2').src = src_head;
                document.getElementById('update_info_head').src = src_head;
            },
            error: function () {
            }
        });
    }

    //将滚轮条固定在聊天框的最下面
    function update_scroll() {
        var div1 = document.getElementById('word');
        div1.scrollTop = div1.scrollHeight;
        console.log("执行了update_scroll")
    }

    function update_impress_scroll(impressID) {
        var div = document.getElementById(impressID);
        div.scrollTop = div.scrollHeight;
    }

    //上线之后，通知用户有多少条添加好友的通知
    function searchNotice(){
        $.ajax({
            url:'${pageContext.request.contextPath}/${userid}/getNoticeNum',
            success:function (data){
                $("#friend_req").html(data);
                // if (data > 0)
                //     $("#broadcast").append("你有"+data+"条好友请求"+'<br>');
                // else
                //     $("#broadcast").append("无任何好友请求"+'<br>');
                var div = document.getElementById('broadcast');
                div.scrollTop = div.scrollHeight;
            }
        });
    }

    //从登录页面获取 userid
    window.onload = function(){
        $.ajax({
            url:"${pageContext.request.contextPath}/user/getUserid",
            success:function (res){
                userid = res;
                $("#broadcast").append("用户"+userid+"上线了"+'<br>');
            },
            async:false
        })
    }

    //一对一聊天、获取对方的ID
    function addChat(ToUserId) {
        toUserid = ToUserId;
        console.log(toUserid);
        //$("#message").html("");

        $(".talk_show").html("");
        $("#chat_userId").html("To:" + ToUserId);

        showChatRecord();
        //     var chatData = sessionStorage.getItem(toUserid)
        //     if (chatData != null){
        //         //将聊天记录显示在聊天区
        //         //加上了聊天记录显示的文本框
        //         var str = '<div class="atalk"><img src="2.png"><span>'+chatData+'</span></div>'
        //         $(".talk_show").html(str)
        //         // $(".talk_show").html(toUserid+"说"+chatData+'<br>');
        //         //str='<div class="atalk"><img src="2.png"><span>A：'+ vals+'</span></div>'
        //     }
        // }
    }
    //websocket连接建立
    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket('ws://' + window.location.host + '/websocket');
    }
    else {
        alert('当前浏览器 Not support websocket')
    }


    //连接成功建立的回调方法
    websocket.onopen = function () {
        searchNotice();
        // alert("用户"+userid+"上线了"+'<br>')
    }

    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        //获取服务端推送过来的 json 字符串
        var dataStr = event.data;
        //将 dataStr 转换为 json 对象
        var res = JSON.parse(dataStr);
        if (res.system){
            //系统消息的消息里面包含的是上线成员的 userid
            var userIds = res.message;

            // console.log(userIds);
            //所有在线用户
            var friendListStr = userIds;
            //好友列表
            var friendlist;

            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/friend/getFriend',
                data: {
                    'userid':'${userid}',
                },
                success: function (data) {
                    // console.log("好友列表"+data);
                    friendlist = data;
                    // console.log(friendlist);
                    // console.log("friendListStr=======>"+friendListStr);
                    var friends = [];
                    for (var user_F of friendlist) {
                        friends.push(user_F);
                    }
                    // console.log("====>friends"+friends);
                    // console.log("friends========>"+friends);
                    for (var userId of friends){
                        // console.log("遍历====>"+userId);
                        var flag = 1;
                        for (var allUserId of friendListStr) {
                            if (userId === allUserId) {
                                console.log("进入here==>flag = 0");
                                flag = 0;
                            }
                        }
                        if (flag == '1') {
                            console.log("进入here===>flag=1移除"+userId);
                            var index = friendlist.indexOf(userId);
                            friendlist.splice(index,1);
                        }
                    }
                    // console.log("friendlist======>"+friendlist);
                    // console.log("friends======>"+friends);
                    show_Online_Friend(friendlist)
                },
                error: function () {
                    console.log("erro_show_friend_list")
                }
            });
        } else {
            //不是系统消息
            var str = res.message;


            var src_img;
            //获取头像
            $.ajax({
                url: "${pageContext.request.contextPath}/getUserProfile",
                data: {'userId':toUserid},
                async:false,
                success: function (data) {
                    // console.log("online====>head===>"+data);
                    src_img = data;
                },
                error: function () {
                }
            });

            //我要发的人以及服务器推给我的信息也是这个人的发送的话，才会在聊天框显示
            if (res.userid=== toUserid){
                var str2 = '<div class="atalk"><img height="40px" width="40px" src=\"${pageContext.request.contextPath}/statics/img/'+ src_img +' \"><p class="atalk">'+str+'</p></div>'
                $(".talk_show").append(str2+'<br>')
                update_scroll();
                // $(".talk_show").append(toUserid+"说："+str+'<br>');
            }else{
                $("#broadcast").append(res.userid+"给你发送了一条新消息");
            }
        }

            //将其他人发给我的消息存储
            var chatData = sessionStorage.getItem(res.userid)
            if (chatData != null){
                str = chatData +'<br>'+ str;
            }
            sessionStorage.setItem(res.userid,str);
        }

    //发送消息的方法
    function send() {
        var data = $("#talkwords").val();
        if (data=="") {alert("不可发送空消息")}
        else {
            $("#talkwords").val("");

            var src_img;
            $.ajax({
                url: "${pageContext.request.contextPath}/getUserProfile",
                data: {'userId':'${userid}'},
                async:false,
                success: function (data) {
                    // console.log("online====>head===>"+data);
                    src_img = data;
                },
                error: function () {
                }
            });
            console.log("====>head===>"+src_img);
            mes = data;
            var str1 = '<div class="btalk"><p class="btalk">'+data+'</p><img height="40px" width="40px" src=\"${pageContext.request.contextPath}/statics/img/'+ src_img +' \"></div>'
            $(".talk_show").append(str1)

            // $("#talkwords").val("");
            // $(".talk_show").append(userid+"说："+data+'<br>');
            //获取消息记录
            var str = data;
            var chatData = sessionStorage.getItem(toUserid);
            if (chatData != null){
                str = chatData +'<br>'+ str;
            }
            sessionStorage.setItem(toUserid,str);
            //包装成 Json 对象
            var json = {"toUserid": toUserid,"message":data};
            websocket.send(JSON.stringify(json));
        }
    }
    //连接关闭的回调方法
    websocket.onclose = function () {
        //$("#broadcast").html("用户"+userid+"下线了");
    }
    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };
    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('message').innerHTML += innerHTML + '<br/>';
    }
    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }


    var timer;
    function Moveoutsover(itemId){
        if(timer){clearTimeout(timer);}
        document.getElementById(itemId).style.display = "block";
    }
    function MoveoutSout(itemId){
        timer=setTimeout(function(){
            document.getElementById(itemId).style.display = "none";
        },500)
    }
    function MoveoutSout_Q(itemId){
        // timer=setTimeout(function(){
            document.getElementById(itemId).style.display = "none";
        // },500)
    }

    //更新好友印象
    function updateImpression(userID) {
        // console.log($("#nick-info").val());
        var input_impress = document.getElementById(userID+'_impressInput').value;
        if (input_impress != null && input_impress != '') {
            var impress = '${userid}' + ":" + input_impress + "<br>";
            console.log(impress)
            $.ajax({
                url: '${pageContext.request.contextPath}/info/update',
                data: {
                    'userid':userID,
                    'impression':impress,
                },
                success: function (data) {
                    //清除输入框
                    document.getElementById(userID+'_impressInput').value = "";
                    showImpression(userID);
                }
            });
        } else {
            alert("添加好友印象不可为空")
        }
    }

    //展示自己的好友印象
    function showOwnImpression(userID) {
        // console.log("UserId=====>"+userID)
        $.ajax({
            url: '${pageContext.request.contextPath}/info/impress',
            data: {
                'userid':userID,
            },
            success: function (data) {
                document.getElementById('own_impress').innerHTML = data;
            }
        });
    }

    //展示好友印象
    function showImpression(userID) {
        // console.log("UserId=====>"+userID)
        $.ajax({
            url: '${pageContext.request.contextPath}/info/impress',
            data: {
                'userid':userID,
            },
            success: function (data) {
                document.getElementById(userID+'_impress').innerHTML = data;
                update_impress_scroll(userID+'_impress');
            }
        });
    }
    

    //显示好友资料卡
    function show_pro_info_friend(item) {
        $.ajax({
            url: '${pageContext.request.contextPath}/info/'+item,
            success: function (data) {
                document.getElementById(item+"_nick-info_f").innerHTML=data.nickname;
                document.getElementById(item+"_useId-info_f").innerHTML=data.userid;
                document.getElementById(item+"_age-info_f").innerHTML=data.age;

                if (data.sex == 0) {
                    document.getElementById(item+"_sex-info_f").innerHTML="未知";
                }else if (data.sex == 1) {
                    document.getElementById(item+"_sex-info_f").innerHTML="男";
                }else {
                    document.getElementById(item+"_sex-info_f").innerHTML="女";
                }
                document.getElementById(item+"_email-info_f").innerHTML=data.email;
                if (data.profile == null) {
                    document.getElementById(item+"_profile-info_f").innerHTML="这个人很懒，什么也没有留下";
                } else
                    document.getElementById(item+"_profile-info_f").innerHTML=data.profile;
            }
        });
    }


    function show_pro_info_friend1(item) {
        $.ajax({
            url: '${pageContext.request.contextPath}/info/'+item,
            success: function (data) {
                document.getElementById("user_head_search").src="${pageContext.request.contextPath}/statics/img/"+data.profilehead;
                document.getElementById("nick-info_search").innerHTML=data.nickname;
                document.getElementById("useId-info_search").innerHTML=data.userid;
                document.getElementById("age-info_search").innerHTML=data.age;

                if (data.sex == 0) {
                    document.getElementById("sex-info_search").innerHTML="未知";
                }else if (data.sex == 1) {
                    document.getElementById("sex-info_search").innerHTML="男";
                }else {
                    document.getElementById("sex-info_search").innerHTML="女";
                }
                document.getElementById("email-info_search").innerHTML=data.email;
            }
        });
    }

    //显示个人资料卡
    function show_pro_info() {
        $.ajax({
            url: '${pageContext.request.contextPath}/${userid}',
            success: function (data) {
                $("#nick-info").html(data.nickname);
                $("#useId-info").html(data.userid);
                $("#age-info").html(data.age);
                if (data.sex == 0) {
                    $("#sex-info").html("未知");
                }else if (data.sex == 1) {
                    $("#sex-info").html("男");
                }else {
                    $("#sex-info").html("女");
                }
                $("#email-info").html(data.email);
                if (data.profile == null) {
                    $("#profile-info").html("这个人很懒，什么也没有留下");
                } else
                    $("#profile-info").html(data.profile);
            }
        });
    }


    //修改个人资料卡
    function change_pro_info() {
        if ($("#info_nickName").val() == "") {
            alert("昵称不可为空")
            return;
        }
        if ($("#info_age").val()=="") {
            alert("年龄不可为空")
            return;
        }
        if ($(':radio[name="sex"]:checked').val()=="") {
            alert("性别不可为空")
            return;
        }
        if($("#info_email").val() == "") {
            alert("邮箱不可为空")
            return;
        }
        if ($("#message").val() == "") {
            alert("个人简介不可为空")
            return;
        }
        $.ajax({
            url: '${pageContext.request.contextPath}/${userid}/update',
            data: {
                'nickname' : $("#info_nickName").val(),
                'age':$("#info_age").val(),
                'sex':$(':radio[name="sex"]:checked').val(),
                'email':$("#info_email").val(),
                'profile':$("#message").val(),
            },
            success: function (data) {
                alert("用户资料卡修改成功")
            }
        });
        document.getElementById('light').style.display='none';
    }

    function show_userInfo() {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/${userid}',
            success: function (data) {
                $("#info_nickName").val(data.nickname);
                $('#info_age').val(data.age);
                if (data.sex == 1) {
                    $('#sex_man').attr("checked",true);
                } else if (data.sex == 2){
                    $('#sex_male').attr("checked",true);
                } else {
                    $('#sex_none').attr("checked",true);
                }
                $('#info_email').val(data.email);
                if (data.profile == "")
                    $('#message').val("这个人很懒，什么也没有留下");
                else
                    $('#message').val(data.profile);
            }
        });
    }


    //删除好友
    function deleteFriend(friendid) {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/friend/deleteFriend?userid=${userid}&friendid='+friendid,
            // data: data,
            success: function (data) {
                getFriendList();
            }
        });
    }

    function addAgree(fromUserid) {
        // console.log("agree");
        var toUserid = "${userid}";
        console.log(toUserid);
        $.ajax({
            type: 'POST',
            url: '/friend/insertFriend',
            data: {
                'fromUserid':fromUserid,
                'toUserid':toUserid,
            },
            success: function () {
                //更新好友列表
                getFriendList();
            }
        });
        //作用是完成添加好友后删除通知
        addRefuse(fromUserid, toUserid);
    }

    function addRefuse(fromUserid, toUserid) {
        //delete notice
        $.ajax({
            type: 'POST',
            url: '/${userid}/deleteNotice',
            data: {
                'fromUserid':fromUserid,
                'toUserid':toUserid,
            },
            success: function () {
                console.log("删除成功");
            }
        });
        $(".msg-box").find("#"+fromUserid).remove();
    }
    function getNotice(userid) {
        console.log(userid);
        $.ajax({
            type: 'POST',
            url: '/${userid}/getNotice',
            // data: data,
            success: function (data) {
                console.log(data);
                $(".msg-box").html("");//先清空
                for(var i=0;i<data.length;i++) {
                    $(".msg-box").append("<li class='notice' id="+data[i].fromUserid+">\n" +
                        "        <a><img class=\"avatar\" src=\"../../statics/img/5.png\"></a>\n" +
                        "        <p class=\"username\">"+data[i].fromUserid+"</p>\n" +
                        "        <p class=\"content\">"+data[i].content+"</p>\n" +
                        "        <p class=\"button\">" +
                        "            <button style=\"float: right ;position: relative;right: 90px;\" onclick=\"addAgree("+"'"+data[i].fromUserid+"'"+")\">同意</button>\n" +
                        "            <button style=\"float: right ;position: relative\" onclick=\"addRefuse("+"'"+data[i].fromUserid+"','${userid}'"+")\">拒绝</button>\n" +
                        "        </p>" +
                        "        <hr class='notice_hr'>" +
                        "    </li>");
                }
                $(".msg-box").append("<li class=\"notice\">暂无更多消息</li>");
            }
        });
    }


    function addFriend(toUserid) {
        console.log("${userid}");
        if(toUserid=="${userid}")
        {
            alert("不能添加自己为好友！");
        }
        else{
            var flag = 1;
            $.post({
                url:'${pageContext.request.contextPath}/friend/isFriend',
                data:{
                    'firstID' : '${userid}',
                    'secondID' : toUserid,
                },
                success: function (data) {
                    if (data == "false") {
                        alert("对方已经是你的好友了！请勿重新添加");
                        flag = 0;
                    }
                }
            })
            console.log(flag);
            if (flag == '1') {
                $.post({
                    url: '/'+toUserid+'/addNotice?fromUserid=${userid}',
                    success: function (data) {
                        if (data == "error_repeat") {
                            alert("请勿重复发送好友请求");
                        }
                        else {
                            alert("已发送!");
                        }
                    }
                });
            }
        }
    }
    function searchUser() {
        var userid = $("#input").val();
        if (userid.length==0){
            alert("用户名不能为空！");
        }
        else {
            //先将原搜索结果清空
            $(".bottom").html("");
            $.ajax({
                type: 'POST',
                url: '/friend/searchFriend',
                data: {'info' : $("#input").val()},
                success: function (data) {
                    console.log(data);
                    if (data[0] == null) {
                        alert('用户不存在');
                    }
                    else {
                        // 将所有符合搜索条件的用户显示
                        for (var i = 0; i < data.length; i++) {
                            //请求获得头像
                            var userID_search = data[i].userid;
                            var src_head;
                            $.ajax({
                                async: false,
                                url: "${pageContext.request.contextPath}/getUserProfile",
                                data: {'userId':userID_search},
                                success: function (data) {
                                    src_head = data;
                                },
                                error: function () {
                                }
                            });
                            $(".bottom").append("        <div class=\"user\">\n" +
                                "            <img onclick=\"show_pro_info_friend1('" + data[i].userid + "');document.getElementById('content_search').style.display='block'\" id=\"" + "" + data[i].userid + "" + "_head_search\" width='50px' height='50px' style='position: relative; top: 5px; left: 5px' class=\"am-comment-avatar\" src=\"${pageContext.request.contextPath}/statics/img/" + src_head + "\">\n" +
                                "            <p style='display: inline-block;vertical-align: bottom;margin: 13px'>" + data[i].userid + "</p>\n" +
                                "            <button style='float: right;margin: 20px' class=\"add-friend-btn\" onclick=\"addFriend(" + "'" + data[i].userid + "'" + ")\">添加好友</button>\n" +
                                "        </div>");
                        }

                    }
                }
            });
        }
    }


    //清空聊天区域
    function click_word() {
        $("#word").html("");
        $("#chat_userId").html("To:???");
    }

    function change_color() {
        var color = document.getElementById('span1').style.backgroundColor;
        var color1 = 'rgb(219, 217, 216)';
        // console.log(color)
        if (color != color1)
            document.getElementById('span1').style.backgroundColor='#dbd9d8';
        else
            document.getElementById('span1').style.backgroundColor='white'
    }

    function openDiv(){
        //1.获取当前分组内好友列表div
        var odiv=document.getElementById("friendList");//秦始皇，刘邦，李世民所在的div
        //2.判断当前分组div是展开还是关闭
        if(odiv.style.display==="block"){
            odiv.style.display="none";//3.如果当前div是打开的, 只需关闭该div即可
        }else{//4.如果当前div是关闭的, 先关闭其他分组的div, 再打开当前的
            var aDiv=document.getElementById("friendList");
            //获取所有分组内的div(两个用来存储好友列表的div),遍历依次关闭所有分组
            for(var i=0;i<aDiv.length;i++){
                aDiv[i].style.display="none";
            }
            //再打开当前分组
            odiv.style.display="block";
        }
    }
</script>
</html>
