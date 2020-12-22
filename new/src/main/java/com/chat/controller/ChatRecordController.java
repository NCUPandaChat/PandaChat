package com.chat.controller;

import com.chat.pojo.ChatRecord;
import com.chat.service.ChatRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/chatRecord")
public class ChatRecordController {
    @Autowired
    @Qualifier("ChatRecordServiceImpl")
    private ChatRecordService chatRecordService;

    @RequestMapping("/searchChatRecord/{firstperson}/{secondperson}")
    @ResponseBody
    public List<ChatRecord> search(@PathVariable("firstperson") String firstperson, @PathVariable("secondperson") String secondperson) {
        ChatRecord chatRecord = new ChatRecord();
        chatRecord.setFirstperson(firstperson);
        chatRecord.setSecondperson(secondperson);
        return chatRecordService.searchChatRecord(chatRecord);
    }
    @RequestMapping("/addChatRecord")
    public void addChatRecord(String userid,String toUserid,String content){
        ChatRecord chatRecord = new ChatRecord();
        chatRecord.setFirstperson(userid);
        chatRecord.setSecondperson(toUserid);
        chatRecord.setContent(content);
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        chatRecord.setTime(df.format(new Date()));
        chatRecord.setState("1");
        chatRecordService.insertChatRecordById(chatRecord);

    }

}
