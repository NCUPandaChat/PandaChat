package com.chat.controller;

import com.chat.pojo.Notice;
import com.chat.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;


@Controller
public class NoticeController {
    @Autowired
    @Qualifier("NoticeServiceImpl")
    private NoticeService noticeService;

    //返回通知界面
    @RequestMapping("{userid}/notice")
    public String toNotice(){
        return "notice";
    }

    //返回通知消息列表
    @RequestMapping("{userid}/getNotice")
    @ResponseBody
    public List<Notice> getNotice(@PathVariable("userid") String userid){
        System.out.println(userid);
        List<Notice> noticeList = noticeService.selectNoticeByUserid(userid);
        return noticeList;
    }

    //添加通知
    @RequestMapping(value = "{userid}/addNotice")
    @ResponseBody
    public String addNotice(String fromUserid, @PathVariable("userid") String toUserid){
        System.out.println(fromUserid);
        System.out.println(fromUserid+toUserid);
        Notice notice = noticeService.selectNotice(toUserid, fromUserid);
        if (notice == null) {
            String content = "请求添加你为好友";
            boolean bool =  noticeService.addNotice(toUserid,fromUserid,content);
            System.out.println(bool);
            return null;
        }
        else {
            return "error_repeat";
        }
    }

    //获取通知消息数量
    @RequestMapping(value = "{userid}/getNoticeNum")
    @ResponseBody
    public String getNoticeNum(@PathVariable("userid") String toUserid){
        return noticeService.getNoticeNum(toUserid);
    }

    //删除通知消息
    @RequestMapping(value = "{userid}/deleteNotice")
    @ResponseBody
    public void deleteNotice(String fromUserid, String toUserid){
        System.out.println(fromUserid);
        boolean bool =  noticeService.deleteNotice(fromUserid,toUserid);
        System.out.println(bool);
    }

}
