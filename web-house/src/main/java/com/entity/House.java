package com.entity;

import java.util.Date;

public class House {
    private int houseId;
    private String address;
    private int price;
    private int checkStatement;
    private Date time;
    private int rentStatement;
    private int hostId;
    private Integer rentUserId; // 可能为空

    public House(int houseId, String address, int price, int checkStatement, Date time, int rentStatement, int hostId, int rentUserId) {
        this.houseId=houseId;
        this.address=address;
        this.price=price;
        this.checkStatement=checkStatement;
        this.time=time;
        this.rentStatement=rentStatement;
        this.hostId=hostId;
        this.rentUserId=rentUserId;
    }

    public House(String address, int price, int checkStatement, Date time, int rentStatement, int hostId, int rentUserId) {
        this.address=address;
        this.price=price;
        this.checkStatement=checkStatement;
        this.time=time;
        this.rentStatement=rentStatement;
        this.hostId=hostId;
        this.rentUserId=rentUserId;
    }

    // Getters and setters

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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getRentStatement() {
        return rentStatement;
    }

    public void setRentStatement(int rentStatement) {
        this.rentStatement = rentStatement;
    }

    public int getHostId() {
        return hostId;
    }

    public void setHostId(int hostId) {
        this.hostId = hostId;
    }

    public Integer getRentUserId() {
        return rentUserId;
    }

    public void setRentUserId(Integer rentUserId) {
        this.rentUserId = rentUserId;
    }

    // toString 方法，方便调试
    @Override
    public String toString() {
        return "House{" +
                "houseId=" + houseId +
                ", address='" + address + '\'' +
                ", price=" + price +
                ", checkStatement=" + checkStatement +
                ", time=" + time +
                ", rentStatement=" + rentStatement +
                ", hostId=" + hostId +
                ", rentUserId=" + rentUserId +
                '}';
    }
}
