package com.cabservice.models;

public class User {
    
    private int userId;
    private String fullName;
    private String email;
    private String password;
    private String phone;
    private String address;
    private String role;
    private String license;
    private String vehicleType;
    private String vehicleNumber;

    public User() {}

    public User(int userId, String fullName, String email, String password, String phone, 
                String address, String role, String license, String vehicleType, String vehicleNumber) {
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.license = license;
        this.vehicleType = vehicleType;
        this.vehicleNumber = vehicleNumber;
    }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getLicense() { return license; }
    public void setLicense(String license) { this.license = license; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public String getVehicleNumber() { return vehicleNumber; }
    public void setVehicleNumber(String vehicleNumber) { this.vehicleNumber = vehicleNumber; }
}
