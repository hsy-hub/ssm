package service;

import pojo.User;

import java.util.List;

public interface UserDao {
    User Login(User user);
    Boolean RegisterUser(User user);
    List<User> getUserList(User user);
    boolean updateUser(User user);
    boolean deleteUserByid(Integer id);
    User getUserByid(Integer id);
    //boolean checkPassword(User user);
    boolean modifyPs(User user);
    Integer checkUserName(String name);
    List<User> search(User user);
}
