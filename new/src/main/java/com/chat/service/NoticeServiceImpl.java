package com.chat.service;


import com.chat.dao.NoticeMapper;
import com.chat.pojo.Notice;

import java.util.List;

public class NoticeServiceImpl implements NoticeService{
    private NoticeMapper noticeMapper;

    public void setNoticeMapper(NoticeMapper noticeMapper) {
        this.noticeMapper = noticeMapper;
    }

    @Override
    public List<Notice> selectNoticeByUserid(String userid) {
        return noticeMapper.selectNoticeByUserid(userid);
    }

    @Override
    public String getNoticeNum(String userid) {
        return noticeMapper.getNoticeNum(userid);
    }

    @Override
    public boolean deleteNotice(String userid, String userid2) {
        return noticeMapper.deleteNotice(userid, userid2);
    }

    @Override
    public boolean addNotice(String toUserid, String fromUserid, String content) {
        return noticeMapper.addNotice(toUserid,fromUserid,content);
    }

    @Override
    public Notice selectNotice(String toUserid, String fromUserid) {
        return noticeMapper.selectNotice(toUserid,fromUserid);
    }
}
