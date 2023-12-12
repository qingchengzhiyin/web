package com.entity;

import java.util.Date;

public class House {
    private int houseId;
    private String address;
    private int price;
    private int checkStatement;
    private int hostUserId; // 更新为对应的数据库字段名
    private String image;
    private String title;

    // 构造函数
    public House(int houseId, String address, int price, int checkStatement, int hostUserId, String image, String title) {
        this.houseId = houseId;
        this.address = address;
        this.price = price;
        this.checkStatement = checkStatement;
        this.hostUserId = hostUserId;
        this.image = image;
        this.title = title;
    }

    public House(String address, int price, int checkStatement, int hostUserId, String image, String title) {
        this.address = address;
        this.price = price;
        this.checkStatement = checkStatement;
        this.hostUserId = hostUserId;
        this.image = image;
        this.title = title;
    }

    // Getters and setters
    // ...（略去其他方法）

    public int getHouseId() {
        return houseId;
    }

    public void setHouseId(int houseId) {
        this.houseId = houseId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getCheckStatement() {
        return checkStatement;
    }

    public void setCheckStatement(int checkStatement) {
        this.checkStatement = checkStatement;
    }

    public int getHostUserId() {
        return hostUserId;
    }

    public void setHostUserId(int hostUserId) {
        this.hostUserId = hostUserId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


}
