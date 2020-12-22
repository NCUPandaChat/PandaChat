package com.chat.service;


import com.chat.dao.ChatRecordMapper;
import com.chat.pojo.ChatRecord;

import java.util.List;

public class ChatRecordServiceImpl implements ChatRecordService {

    private ChatRecordMapper chatRecordMapper;

    public void setChatRecordMapper(ChatRecordMapper chatRecordMapper) {
        this.chatRecordMapper = chatRecordMapper;
    }

    public  int insertChatRecordById(ChatRecord chatRecord){return chatRecordMapper.insertChatRecordById(chatRecord);}
    public  List<ChatRecord> searchChatRecord(ChatRecord chatRecord){return chatRecordMapper.searchChatRecord(chatRecord);}
}

