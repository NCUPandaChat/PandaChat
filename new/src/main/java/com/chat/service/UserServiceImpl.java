package com.chat.service;

import com.chat.dao.UserMapper;
import com.chat.pojo.User;

import java.util.List;
import java.util.Map;

public class UserServiceImpl implements UserService{
    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public int addUser(User user){
        return userMapper.addUser(user);
    }

    @Override
    public boolean delete(String userid) {
        return userMapper.delete(userid);
    }

    @Override
    public User selectByEmail(String email) {
        return userMapper.selectByEmail(email);
    }

    @Override
    public User selectById(String userId) {
        return userMapper.selectById(userId);
    }

    @Override
    public List<User> selectByNickName(String nickname) {
        return userMapper.selectByNickName(nickname);
    }

    @Override
    public User judge_User(Map map) {
        return userMapper.judge_User(map);
    }

    @Override
    public boolean update(User user) {
        return userMapper.update(user);
    }

    @Override
    public boolean insertFriend(String userid, String friendid) {
        return userMapper.insertFriend(userid,friendid);
    }

    @Override
    public boolean deleteFriend(String userid, String friendid) {
        return userMapper.deleteFriend(userid, friendid);
    }

    @Override
    public List<String> selectAllFriend(String userid) {
        return userMapper.selectAllFriend(userid);
    }

    @Override
    public User isFriendShip(String firstID, String secondID) {
        return userMapper.isFriendShip(firstID,secondID);
    }

}
