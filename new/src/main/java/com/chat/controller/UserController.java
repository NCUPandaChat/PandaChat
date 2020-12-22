package com.chat.controller;

import com.chat.pojo.User;
import com.chat.service.UserService;
import com.chat.utils.UploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

@Controller
@SessionAttributes("userid")
public class UserController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //聊天主页
    @RequestMapping("/toChat")
    public String toChat() {
        return "chat_page";
    }

    //返回个人信息
    @RequestMapping("/{userid}")
    @ResponseBody
    public User selectUserByUserId(@PathVariable("userid") String userid) {
        User user = userService.selectById(userid);
        return user;
    }

    //更新个人资料卡
    @RequestMapping(value = "{userid}/update")
    @ResponseBody
    public boolean  update(@PathVariable("userid") String userid, RedirectAttributes attributes,
                           String nickname, int age, int sex, String email,
                           String profile){
        User user = new User();
        user.setUserid(userid);
        user.setNickname(nickname);
        user.setAge(age);
        user.setSex(sex);
        user.setEmail(email);
        user.setProfile(profile);
        boolean flag = userService.update(user);
//        if(flag){
//            attributes.addFlashAttribute("message", "["+userid+"]资料更新成功!");
//        }else{
//            attributes.addFlashAttribute("error", "["+userid+"]资料更新失败!");
//        }
        return flag;
    }

    //返回好友个人信息
    @RequestMapping(value = "/info/{userid}")
    @ResponseBody
    public User selectFriendByUserId(@PathVariable("userid") String userid){
        User user = userService.selectById(userid);
        return user;
    }

    //返回好友印象
    @RequestMapping(value = "/info/impress")
    @ResponseBody
    public String selectImpressByUserId(String userid){
        User user = userService.selectById(userid);
        return user.getImpression();
    }

    //更新好友印象
    @RequestMapping(value = "/info/update")
    @ResponseBody
    public String  updateFriend(String userid, String impression, HttpServletRequest request){
//        System.out.println(impression);
//        System.out.println(userid);
        User user = userService.selectById(userid);
//        System.out.println("user===>"+user);
        user.setImpression(impression);
        boolean flag = userService.update(user);
        if(flag){
            return "好友印象更新成功";
        } else{
            return "好友印象更新失败,请重试";
        }
}

    //头像上传
    @RequestMapping(value = "/{userid}/upload")
    public String upload(@PathVariable("userid") String userid, @RequestParam("file") MultipartFile file, HttpServletRequest request,RedirectAttributes attributes){
        try{
            UploadUtil uploadUtil = new UploadUtil();
            String fileurl = uploadUtil.upload(request, "upload", userid);
            System.out.println(fileurl);
            User user = userService.selectById(userid);
            System.out.println(user);
            user.setProfilehead(fileurl);
            userService.update(user);
            return "redirect:/toChat";
        } catch (Exception e){
            return "error";
        }
    }

    //获取用户头像
    @RequestMapping(value = "info/head")
    public void head(String userid, HttpServletRequest request, HttpServletResponse response){
        try {
            User user = userService.selectById(userid);
            String path = user.getProfilehead();
            String rootPath = request.getSession().getServletContext().getRealPath("/");
            String picturePath = rootPath + "statics\\img\\" +path;
            System.out.println(picturePath);
            response.setContentType("image/jpeg; charset=UTF-8");
            ServletOutputStream outputStream = response.getOutputStream();
            FileInputStream inputStream = new FileInputStream(picturePath);
            byte[] buffer = new byte[1024];
            int i = -1;
            while ((i = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, i);
            }
            outputStream.flush();
            outputStream.close();
            inputStream.close();
            outputStream = null;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //获取用户头像
    @RequestMapping("/getUserProfile")
    @ResponseBody
    public String getUserProfile(String userId,HttpServletRequest request){
        User user = userService.selectById(userId);
//        String rootPath = request.getSession().getServletContext().getRealPath("/");
        return user.getProfilehead();
    }
}
