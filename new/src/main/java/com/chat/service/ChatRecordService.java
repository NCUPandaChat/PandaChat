package com.chat.service;

import com.chat.pojo.ChatRecord;

import java.util.List;

public interface ChatRecordService {

    //根据用户Id添加聊天记录
    int insertChatRecordById(ChatRecord chatRecord);
    //根据聊天双方的 Id 查找消息
    List<ChatRecord> searchChatRecord(ChatRecord chatRecord);
}
