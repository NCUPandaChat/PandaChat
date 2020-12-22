package com.chat.dao;

import com.chat.pojo.ChatRecord;

import java.util.List;

public interface ChatRecordMapper {
    //根据用户的 Id 插入消息
    int insertChatRecordById(ChatRecord chatRecord);
    //根据聊天双方的 Id 查找消息
    List<ChatRecord> searchChatRecord(ChatRecord chatRecord);

}
