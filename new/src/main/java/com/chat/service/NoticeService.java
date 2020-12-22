package com.chat.service;

import com.chat.pojo.Notice;

import java.util.List;

public interface NoticeService {
    //根据用户id查询通知
    List<Notice> selectNoticeByUserid(String userid);
    //根据用户id查询通知数量
    String getNoticeNum(String userid);
    //根据用户id删除通知
    boolean deleteNotice(String userid, String userid2);
    //增加通知
    boolean addNotice(String toUserid, String fromUserid, String content);
    //判断该消息是否存在
    Notice selectNotice(String toUserid, String fromUserid);
}
