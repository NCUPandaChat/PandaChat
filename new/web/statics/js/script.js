$('#password').focusin(function () {
    $('form').addClass('up')
})
$('#password').focusout(function () {
    $('form').removeClass('up')
})
$('#confirm_password').focusin(function () {
    $('form').addClass('up')
})
$('#confirm_password').focusout(function () {
    $('form').removeClass('up')
})

// 眼睛移动
$(document).on('mousemove', function (event) {
    var dw = $(document).width() / 15
    var dh = $(document).height() / 15
    var x = event.pageX / dw
    var y = event.pageY / dh
    $('.eye-ball').css({
        width: x,
        height: y
    })
})

// 表单验证
$('.btn').click(function () {
    $('form').addClass('wrong-entry')
    setTimeout(function () {
        $('form').removeClass('wrong-entry')
    }, 3000)
})
//不能输入为空
$('#login').click(function () {
    var x = "";
    var name = document.getElementById("userid").value;
    var pwd = document.getElementById("password").value ;
    if(name == ""){
        x += "用户名不能为空！\n"
    }
    if (pwd == "") {
        x += "密码不能为空！";
    }
    if (x != "") {
        alert("请注意！\n"+x);
        return false;
    }
})




function checkpwd() {
    var x = document.getElementById("password").value;
    if (x != '') {
        if(x.length>10 || x.length<6){
            alert("密码长度有误！")
            return false;
        }
    }
}

function checkconfirm_pwd() {
    var x = document.getElementById("password").value;
    var y = document.getElementById("confirm_password").value;
    if (y != '' & x != '') {
        if(x != y){
            alert("两次密码不一致！")
            return false;
        }
    }
}
// $(function(){
//     $('#talksub').click(function(){
//         //发送单击，获取用户输入的数据value属性值
//         var vals=$('#talkwords').val()
//         //如果输入的数据为空，则弹窗提示
//         if (vals=='')
//         {
//             alert('请输入数据！')
//             return
//         }
//         //条件下拉列表中的value值是0还是1
//         var whovals=$('#who').val()
//         var str=""
//         //选择A发送还是B发送
//         if (whovals==0){
//             str='<div class="atalk"><img src="2.png"><span>A：'+ vals+'</span></div>'
//         }
//         else{
//             str='<div class="btalk"><span>B：'+ vals+'</span><img src="2.png"></div>'
//         }
//         //原有的内容+str,否则会覆盖掉原有内容
//         $('#words').html($('#words').html()+str)
//         //发送完数据后清空输入框
//         $('#talkwords').val('')
//     })
// })
//
// var timer;
// $("#friend,#content1").bind("onmouseover",Moveoutsover);
// $("#friend").bind("onmouseout",MoveoutSout);
// $("#content1").bind("onmouseout",function(){
//     if(timer){clearTimeout(timer);}
//     $("#content1").css("display","none");
// })
// function Moveoutsover(){
//     if(timer){clearTimeout(timer);}
//     $("#content1").css("display","block");
//     // $("#content1").css("left",event.clientX-100);
//     // $("#content1").css("top",event.clientY-50);
// }
// function MoveoutSout(){
//     timer=setTimeout(function(){
//         $("#content1").css("display","none");
//     },500)
// }

// window.onload = function () {
//     var friend = document.getElementById("friend");
//     var content1 = document.getElementById("content1");
//     //鼠标移入显示
//     friend.onmouseover = function () {
//         content1.style.display = "block";
//     }
//     function Moveoutsover() {
//         content1.style.display = "block";
//     }
//     //鼠标移出隐藏
//     friend.onmouseout = function () {
//         content1.style.display = "none";
//     }
//     function MoveoutSout() {
//         content1.style.display = "none";
//     }
// }

// $("#friend").mouseenter(function () {
//     //$("#content1").show();
//     $("#content1").css("display", "block");
//     $("#content1").css("left", event.clientX -50); //弹出框的位置X值
//
//     $("#content1").css("top", event.clientY -100);     //弹出框位置Y值
// })
//
// //鼠标移出隐藏
// $("friend").mouseleave(function () {
//     //$("#content").hide();
//     $("#content1").css("display", "none");
// })