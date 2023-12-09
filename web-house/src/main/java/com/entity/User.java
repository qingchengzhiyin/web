package com.entity;

public class User {

    public User(int id,String username,String userPassword,String phone){
        this.id = id;
        this.username = username;
        this.password = userPassword;
        this.phone = phone;
    }
    public User(String username, String password, String phone) {
        this.username = username;
        this.password = password;
        this.phone = phone;
    }

    private int id;
    private String username;
    private  String password;
    private String phone;

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPhone() {
        return phone;
    }

    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
// 构造函数、getter 和 setter 方法省略
    // 你需要根据实际情况完善这个类的构造函数以及 getter 和 setter 方法
}
