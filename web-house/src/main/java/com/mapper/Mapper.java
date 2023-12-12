package com.mapper;

import com.entity.House;
import com.entity.User;

import java.util.List;

public interface Mapper {
//    @Select("SELECT * FROM users")
    List<User> getAllUsers();
    void  deleteUserById(int id);
    User getUserById(int id);
    void updateUser(User user);
    void addUser(User user);
    List<House> getAllHouses();
    void deleteHouseById(int id);
    House getHouseById(int id);
    void updateHouse(House house);
    void addHouse(House house);

}



