package service;


import mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.User;

import java.util.List;

@Service
public class UserDaoImpl implements UserDao {
    @Autowired
    UserMapper userMapper;

    @Override
    public User Login(User user) {

        return userMapper.login(user);
    }

    @Override
    public Boolean RegisterUser(User user) {
        return userMapper.RegisterUser(user);
    }


    @Override
    public List<User> getUserList(User user) {
        return userMapper.getUserList(user);
    }

    @Override
    public boolean updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public boolean deleteUserByid(Integer id) {
        return userMapper.deleteUserByid(id);
    }

    @Override
    public User getUserByid(Integer id) {
        return userMapper.getUserByid(id);
    }


    @Override
    public boolean checkPassword(User user) {
        return userMapper.checkPassword(user);
    }

    @Override
    public boolean modifyPs(User user) {
        return userMapper.modifyPs(user);
    }
}
