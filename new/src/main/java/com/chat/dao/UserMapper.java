package com.chat.dao;

import com.chat.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    //通过邮箱查找好友并且实现一邮箱只能注册一个用户
    User selectByEmail(@Param("email")String email);
    //通过ID查找用户
    User selectById(@Param("userid")String userId);
    //通过NickName查找
    List<User> selectByNickName(@Param("nickname")String nickname);
    //登录：邮箱型登录判断 User唯一的属性为：邮箱 UUID map中的值为e-mail 和 密码
    User judge_User(Map map);
    //注册时，增加用户 UUID(隐藏属性) 昵称 密码 确认密码 邮箱 性别 firsttime 一个邮箱只能注册一个账号
    int addUser(User user);
    //删除用户
    boolean delete(@Param("userid")String userid);
    //更新用户信息
    boolean update(User user);
    //插入好友关系
    boolean insertFriend(@Param("userid")String userid,@Param("friendid")String friendid);
    //删除好友关系
    boolean deleteFriend(@Param("userid")String userid,@Param("friendid")String friendid);
    //根据用户id查询好友列表
    List<String> selectAllFriend(@Param("userid")String userid);
    //查询俩个人是否有好友关系
    User isFriendShip(@Param("firstID")String firstID, @Param("secondID")String secondID);
}
