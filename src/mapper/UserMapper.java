package mapper;


import pojo.User;

import java.util.List;

public interface UserMapper {
    User login(User user);
    Boolean RegisterUser(User user);
    List<User> getUserList(User user);
    boolean updateUser(User user);
    boolean deleteUserByid(Integer id);
    User getUserByid(Integer id);
//    int checkPassword(User user);
    int modifyPs(User user);
    Integer checkUserName(String name);
    List<User> search(User user);
}
