package com.cabservice.dao;


import com.cabservice.models.Booking;


import utills.DBConnection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;

public class BookingDAO {

	 public boolean insertBooking(Booking booking) {
	        String query = "INSERT INTO bookings (Pickup_Location, Drop_off_location, customer_username, price, length_of_ride, ride_status, vehicleType) VALUES (?, ?, ?, ?, ?, ?, ?)";

	        try (Connection conn = DBConnection.getConnection();
	        		 PreparedStatement pstmt = conn.prepareStatement(query))
	        {

	        	  pstmt.setString(1, booking.getPickupLocation());
	        	  pstmt.setString(2, booking.getDropOffLocation());
	              pstmt.setString(3, booking.getCustomerUsername());
	              pstmt.setDouble(4, booking.getPrice());
	              pstmt.setDouble(5, booking.getLengthOfRide());
	              pstmt.setString(6, booking.getRideStatus());
	              pstmt.setString(7, booking.getVehicleType());

	              return pstmt.executeUpdate() > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 

}
