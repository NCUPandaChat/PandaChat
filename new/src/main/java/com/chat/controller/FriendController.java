package com.chat.controller;

import com.chat.pojo.User;
import com.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/friend")
public class FriendController {
    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

//    @RequestMapping("/addFriend")
//    public String addFriend(Model model){
//        return "addFriend";
//    }

    //通过用户名，昵称，邮箱查找
    @RequestMapping("/searchFriend")
    public List<User> searchFriend(String info){
        List<User> userList = new ArrayList<>();
        List<User> selectByNickName = userService.selectByNickName(info);
        User selectById = userService.selectById(info);
        User selectByEmail = userService.selectByEmail(info);
        if (selectByNickName.size() != 0)
            userList.addAll(selectByNickName);
        if (selectById != null)
            userList.add(selectById);
        if (selectByEmail != null)
            userList.add(selectByEmail);
        return userList;
    }

    //获取好友列表
    @RequestMapping("/getFriend")
    @ResponseBody
    public List<String> getFriend(@RequestParam("userid")String userid) {
        List<String> friendlist = userService.selectAllFriend(userid);
//        for (String s : friendlist) {
//            System.out.println(s);
//        }
        return  friendlist;
    }

    //添加好友
    @RequestMapping("/insertFriend")
    public void insertFriend(String fromUserid, String toUserid) {
        boolean b1 = userService.insertFriend(fromUserid, toUserid);
        boolean b = userService.insertFriend(toUserid, fromUserid);
        System.out.println(b1);
        System.out.println(b);
    }

    //删除好友
    @RequestMapping("/deleteFriend")
    public void deleteFriend(@RequestParam("userid")String userid, @RequestParam("friendid")String friendid) {
        boolean b = userService.deleteFriend(userid, friendid);
        boolean b1 = userService.deleteFriend(friendid, userid);
        System.out.println(b1);
        System.out.println(b);
    }

    @RequestMapping("/isFriend")
    @ResponseBody
    public String isFriend(String firstID, String secondID) {
        User ship = userService.isFriendShip(firstID, secondID);
        if (ship != null)
            return "false";
        else
            return "true";
    }

}
