package com.chat.utils;

import com.chat.pojo.ResultMessage;
import com.fasterxml.jackson.databind.ObjectMapper;

public class MessageUtil {
    public static String getMessage(boolean isSystem,String Userid,Object message) {

        try {
        ResultMessage resultMessage = new ResultMessage();
        resultMessage.setIsSystem(isSystem);
        resultMessage.setMessage(message);
        if (Userid != null) {
            resultMessage.setUserid(Userid);
        }
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(resultMessage);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
