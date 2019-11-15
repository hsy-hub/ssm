package service;

import pojo.User;

import java.util.List;

public interface UserDao {
    public User Login(User user);
    public Boolean RegisterUser(User user);
    public List<User> getUserList(User user);
    public boolean updateUser(User user);
    public boolean deleteUserByid(Integer id);
    public User getUserByid(Integer id);
    public boolean checkPassword(User user);
    public boolean modifyPs(User user);
}
