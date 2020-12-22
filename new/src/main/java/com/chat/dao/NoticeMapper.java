package com.chat.dao;

import com.chat.pojo.Notice;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface NoticeMapper {
    //根据用户id查询通知
    List<Notice> selectNoticeByUserid(String userid);
    //根据用户id查询通知数量
    String getNoticeNum(String userid);
    //根据用户id删除通知
    boolean deleteNotice(@Param("userid")String userid, @Param("userid2")String userid2);
    //增加通知
    boolean addNotice(@Param("toUserid")String toUserid, @Param("fromUserid")String fromUserid, @Param("content")String content);
    //判断该消息是否存在
    Notice selectNotice(@Param("toUserid")String toUserid, @Param("fromUserid")String fromUserid);
}
