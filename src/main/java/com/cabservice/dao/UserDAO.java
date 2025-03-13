package com.cabservice.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cabservice.models.Booking;
import com.cabservice.models.User;
import utills.DBConnection;

public class UserDAO {

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }

    public boolean registerUser(User user) {
        String query = "INSERT INTO users (full_name, email, password, phone, address, role, license, vehicleType, vehicleNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, user.getFullName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, hashPassword(user.getPassword())); // Hash the password before saving
            pstmt.setString(4, user.getPhone());
            pstmt.setString(5, user.getAddress());
            pstmt.setString(6, user.getRole());
            pstmt.setString(7, user.getLicense());
            pstmt.setString(8, user.getVehicleType());
            pstmt.setString(9, user.getVehicleNumber());

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String email, String password) {
        String query = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String storedPassword = rs.getString("password");

                if (storedPassword.equals(hashPassword(password))) {
                    return new User(
                            rs.getInt("user_id"),
                            rs.getString("full_name"),
                            rs.getString("email"),
                            password, // Store the original password in the object
                            rs.getString("phone"),
                            rs.getString("address"),
                            rs.getString("role"),
                            rs.getString("license"),
                            rs.getString("vehicleType"),
                            rs.getString("vehicleNumber")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get all customer display for admin
    public List<User> getAllCustomers() {
        List<User> customers = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = 'CUSTOMER'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("role"),
                        rs.getString("license"),
                        rs.getString("vehicleType"),
                        rs.getString("vehicleNumber")
                );
                customers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }
    
   // get all Riders for admin
    public List<User> getAllDrivers() {
        List<User> drivers = new ArrayList<>();
        String query = "SELECT * FROM users WHERE role = 'DRIVER'";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("user_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("role"),
                        rs.getString("license"),
                        rs.getString("vehicleType"),
                        rs.getString("vehicleNumber")
                );
                drivers.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return drivers;
    }
}
