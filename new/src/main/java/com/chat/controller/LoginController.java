package com.chat.controller;

import com.chat.pojo.User;
import com.chat.service.UserService;
import com.chat.utils.UploadUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletConfig;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;


@Controller
@RequestMapping("/user")
public class LoginController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;


    //跳转到更换头像页面
    @RequestMapping("/toChange_head")
    public String toChange_head() {
        return "form";
    }

    //跳到登录界面
    @RequestMapping("/tologin")
    public String tologin() {
        return "login";
    }

    @RequestMapping("/login")
    public String login(String userId, String password, HttpServletResponse response, HttpSession session, RedirectAttributes attributes) {
        HashMap map = new HashMap();
        map.put("userid", userId);
        map.put("password", password);
        //使用密码和userid一同查找，如果找不到，则密码错误，否则密码正确
        User user = userService.judge_User(map);
        //由于用户不存在的情况已在前端使用Ajax判断，固此时只需要判断密码是否正确
        if (user == null) {
            attributes.addFlashAttribute("error", "false");
            return "redirect:/user/tologin";
        }
        //判断用户是否在线！
        else if(user.getStatus() != 1) {
            attributes.addFlashAttribute("error", "error_status");
            return "redirect:/user/tologin";
        }
        else {
            //将该用户加入在线用户列表

            //增加session
            session.setAttribute("userid", userId);
            //添加一个user.update方法
            //user.setAge(19);
            userService.update(user);
//            return "redirect:/toChat";
            return "chat_page";
        }
    }

    //注销
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session, RedirectAttributes attributes) {
        String userid = session.getAttribute("userid").toString();
        System.out.println(userid);
        session.removeAttribute(userid);
        return "redirect:/user/tologin";
    }

    @RequestMapping("/getUserid")
    @ResponseBody
    public String getUserid(HttpSession session){
        return (String) session.getAttribute("userid");
    }

    //跳转注册页面
    @RequestMapping("/toRegistered")
    public String toRegistered(){
        return "registered";
    }

    //注册新用户
    @RequestMapping("/registered")
    public String registered(@RequestParam("userId") String userid,
                             @RequestParam("userNickname") String userNickname,
                             @RequestParam("userPassword") String userPassword,
                             @RequestParam("userEmail") String userEmail,
                             Model model){
        Date day = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        User user = new User();
        user.setUserid(userid);
        user.setPassword(userPassword);
        user.setNickname(userNickname);
        user.setSex(0);//默认性别位置
        user.setAge(0);//默认年龄0
        String src_img = "/statics/img/6.png";
        user.setProfilehead(src_img);
        user.setFirsttime(df.format(day));
        user.setStatus(1);
        user.setEmail(userEmail);
        user.setImpression("");

        userService.addUser(user);
        return "redirect:/user/tologin";
    }

    //检查userid有没有重复
    @RequestMapping("/checkUserId")
    public void ajax_checkUserId(String userId, HttpServletResponse response) throws IOException {
        //System.out.println("checkUserId=>" + userId);
        User user = userService.selectById(userId);
        if (user == null){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    //检查邮箱有没有重复
    @RequestMapping("/checkUserEmail")
    public void ajax_checkUserEmail(String email, HttpServletResponse response) throws IOException {
        //System.out.println("checkUseremail=>" + email);
        User user = userService.selectByEmail(email);
        System.out.println(user);
        if (user == null){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    @RequestMapping("/toReset_pwd")
    public String toReset_pwd() {
        return "reset_pwd";
    }

    //检查用户名绑定的邮箱是否一致
    @RequestMapping("/check_ID_Email")
    public void check_ID_Email(String userid, String userEmail, HttpServletResponse response) throws IOException {
        //System.out.println("check_ID_Email=>");
        User user = userService.selectById(userid);
//        System.out.println(userid);
//        System.out.println(userEmail);
//        System.out.println(user.getEmail());
        if (userEmail.equals(user.getEmail())){
            response.getWriter().print("true");
        }else{
            response.getWriter().print("false");
        }
    }

    //更新用户信息
    @RequestMapping("/updateUser")
    public String updateUser(String password, String userid) {
        User user = userService.selectById(userid);
        user.setPassword(password);
        userService.update(user);
        return "redirect:/user/tologin";
    }
}
