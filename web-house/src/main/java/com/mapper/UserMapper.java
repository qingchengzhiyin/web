package com.mapper;

import com.entity.User;
import org.apache.ibatis.annotations.Select;
import java.util.List;

public interface UserMapper {
//    @Select("SELECT * FROM users")
    List<User> getAllUsers();
    void  deleteUserById(int id);
    User getUserById(int id);
    void updateUser(User user);
    void addUser(User user);
}



