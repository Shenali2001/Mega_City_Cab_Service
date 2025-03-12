package com.cabservice.models;


import java.sql.Timestamp;

public class Booking {
    
    private int id;
    private String pickupLocation;
    private String dropOffLocation;
    private String customerUsername;
    private String riderUsername;
    private double price;
    private double lengthOfRide;
    private String rideStatus;
    private String vehicleType;
    private String vehicleNumber;
    private String mobile;
    private Timestamp rideStartedAt;
    private Timestamp rideEndedAt;
    private Timestamp createdAt;

    // Default Constructor
    public Booking() {
    }

    // Parameterized Constructor
    public Booking(int id, String pickupLocation, String dropOffLocation, String customerUsername,
                   String riderUsername, double price, double lengthOfRide, String rideStatus,
                   String vehicleType, String vehicleNumber, String mobile, Timestamp rideStartedAt,
                   Timestamp rideEndedAt, Timestamp createdAt) {
        this.id = id;
        this.pickupLocation = pickupLocation;
        this.dropOffLocation = dropOffLocation;
        this.customerUsername = customerUsername;
        this.riderUsername = riderUsername;
        this.price = price;
        this.lengthOfRide = lengthOfRide;
        this.rideStatus = rideStatus;
        this.vehicleType = vehicleType;
        this.vehicleNumber = vehicleNumber;
        this.mobile = mobile;
        this.rideStartedAt = rideStartedAt;
        this.rideEndedAt = rideEndedAt;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

    public String getDropOffLocation() { return dropOffLocation; }
    public void setDropOffLocation(String dropOffLocation) { this.dropOffLocation = dropOffLocation; }

    public String getCustomerUsername() { return customerUsername; }
    public void setCustomerUsername(String customerUsername) { this.customerUsername = customerUsername; }

    public String getRiderUsername() { return riderUsername; }
    public void setRiderUsername(String riderUsername) { this.riderUsername = riderUsername; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getLengthOfRide() { return lengthOfRide; }
    public void setLengthOfRide(double lengthOfRide) { this.lengthOfRide = lengthOfRide; }

    public String getRideStatus() { return rideStatus; }
    public void setRideStatus(String rideStatus) { this.rideStatus = rideStatus; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public String getVehicleNumber() { return vehicleNumber; }
    public void setVehicleNumber(String vehicleNumber) { this.vehicleNumber = vehicleNumber; }

    public String getMobile() { return mobile; }
    public void setMobile(String mobile) { this.mobile = mobile; }

    public Timestamp getRideStartedAt() { return rideStartedAt; }
    public void setRideStartedAt(Timestamp rideStartedAt) { this.rideStartedAt = rideStartedAt; }

    public Timestamp getRideEndedAt() { return rideEndedAt; }
    public void setRideEndedAt(Timestamp rideEndedAt) { this.rideEndedAt = rideEndedAt; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

  
}