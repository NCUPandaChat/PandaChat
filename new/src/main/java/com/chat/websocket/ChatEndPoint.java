package com.chat.websocket;

import com.chat.pojo.Message;
import com.chat.utils.MessageUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 */
@ServerEndpoint(value = "/websocket",configurator=GetHttpSessionConfigurator.class)
public class ChatEndPoint {
    //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;

    //concurrent包的线程安全Map，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识

    private static Map<String,ChatEndPoint> onlineUsers = new ConcurrentHashMap<>();
    @Autowired
    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    //声明一个HttpSession对象，我们之前在Httpsession对象中存储了用户名
    private HttpSession httpSession;

    /**
     * 连接建立成功调用的方法
     * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session,EndpointConfig config){
        this.session = session;
        //获取 httpSession
        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        this.httpSession = httpSession;
        //从 httpSession 中获取 userid

        String Userid = (String) httpSession.getAttribute("userid");

        System.out.println(Userid);

        //添加到 map 中

        onlineUsers.put(Userid,this);

        String message = MessageUtil.getMessage(true,null,getUserid());

        broadcastAllUsers(message);

        addOnlineCount();           //在线数加1
        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
    }

    @OnClose
    public void onClose(){
        String userid = (String) httpSession.getAttribute("userid");
        onlineUsers.remove(userid);  //从 map 中删除
        String message = MessageUtil.getMessage(true,null,getUserid());
        broadcastAllUsers(message);
        subOnlineCount();           //在线数减1
        System.out.println(userid+"下线了！当前在线人数为" + getOnlineCount());
    }


    @OnMessage
    public void onMessage(String message, Session session) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            //把 json 字符串转换成 Message 实体类
            Message message1 = mapper.readValue(message,Message.class);
            //获取接收数据的用户
            String toUserid = message1.getToUserid();
            //获取消息数据
            String data = message1.getMessage();
            //获取当前用户id
            String Userid = (String) httpSession.getAttribute("userid");
            //处理消息格式
            String resultMessage = MessageUtil.getMessage(false,Userid,data);
            //把消息格式发给接收方
            System.out.println(resultMessage);
            System.out.println(getUserid());

            onlineUsers.get(toUserid).session.getBasicRemote().sendText(resultMessage);

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("来自客户端的消息:" + message);


    }


    @OnError
    public void onError(Session session, Throwable error){
        System.out.println("发生错误");
        error.printStackTrace();
    }


    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        ChatEndPoint.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        ChatEndPoint.onlineCount--;
    }

    //获取当前在线的 userid
    private Set<String> getUserid(){
        return onlineUsers.keySet();
    }
    //每一个 userid 都会给它返回系统 message
    private void broadcastAllUsers(String message){
        try {
            Set<String> userIds = onlineUsers.keySet();
            for (String userid : userIds){
                ChatEndPoint chatEndpoint = onlineUsers.get(userid);
                System.out.println(message);
                chatEndpoint.session.getBasicRemote().sendText(message);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}