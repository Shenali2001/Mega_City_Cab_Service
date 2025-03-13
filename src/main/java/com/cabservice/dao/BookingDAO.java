package com.cabservice.dao;


import com.cabservice.models.Booking;


import utills.DBConnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;

public class BookingDAO {

	// New Booking Adding
	 public boolean insertBooking(Booking booking) {
	        String query = "INSERT INTO bookings (Pickup_Location, Drop_off_location, mobile, customer_username, price, length_of_ride, ride_status, vehicleType) VALUES (?, ?, ?, ?, ?, ?, ? , ?)";

	        try (Connection conn = DBConnection.getConnection();
	        		 PreparedStatement pstmt = conn.prepareStatement(query))
	        {

	        	  pstmt.setString(1, booking.getPickupLocation());
	        	  pstmt.setString(2, booking.getDropOffLocation());
	        	  pstmt.setString(3, booking.getMobile());
	              pstmt.setString(4, booking.getCustomerUsername());
	              pstmt.setDouble(5, booking.getPrice());
	              pstmt.setDouble(6, booking.getLengthOfRide());
	              pstmt.setString(7, booking.getRideStatus());
	              pstmt.setString(8, booking.getVehicleType());

	              return pstmt.executeUpdate() > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	 
	 // Get Booking By Current User
	 public List<Booking> getBookingsByCustomerUsername(String customerUsername) {
	        List<Booking> bookings = new ArrayList<>();
	        String query = "SELECT * FROM bookings WHERE customer_username = ?";

	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query)) {

	            pstmt.setString(1, customerUsername);
	            ResultSet rs = pstmt.executeQuery();

	            while (rs.next()) {
	                Booking booking = new Booking();
	                booking.setId(rs.getInt("id"));
	                booking.setPickupLocation(rs.getString("Pickup_Location"));
	                booking.setDropOffLocation(rs.getString("Drop_off_location"));
	                booking.setCustomerUsername(rs.getString("customer_username"));
	                booking.setPrice(rs.getDouble("price"));
	                booking.setLengthOfRide(rs.getDouble("length_of_ride"));
	                booking.setRideStatus(rs.getString("ride_status"));
	                booking.setVehicleType(rs.getString("vehicleType"));
	                bookings.add(booking);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return bookings;
	    }
	 
	 
	  public boolean updateBookingStatus(int bookingId, String status) {
	        String query = "UPDATE bookings SET ride_status = ? WHERE id = ?";

	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query)) {

	            pstmt.setString(1, status);
	            pstmt.setInt(2, bookingId);

	            return pstmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }
	  
	  // Cancel Booking
	  public boolean cancelBooking(int bookingId) {
	        String query = "UPDATE bookings SET ride_status = 'CANCELLED' WHERE id = ?";

	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query)) {

	            pstmt.setInt(1, bookingId);
	            return pstmt.executeUpdate() > 0;

	        } catch (SQLException e) {
	            e.printStackTrace();
	            return false;
	        }
	    }

    // Fetch for Requested Booking for Admin  
	   public List<Booking> getRequestedBookings() {
	        List<Booking> bookings = new ArrayList<>();
	        String query = "SELECT * FROM bookings WHERE ride_status = 'REQUESTED'";

	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement pstmt = conn.prepareStatement(query);
	             ResultSet rs = pstmt.executeQuery()) {

	            while (rs.next()) {
	                Booking booking = new Booking();
	                booking.setId(rs.getInt("id"));
	                booking.setPickupLocation(rs.getString("Pickup_Location"));
	                booking.setDropOffLocation(rs.getString("Drop_off_location"));
	                booking.setCustomerUsername(rs.getString("customer_username"));
	                booking.setPrice(rs.getDouble("price"));
	                booking.setLengthOfRide(rs.getDouble("length_of_ride"));
	                booking.setVehicleType(rs.getString("vehicleType"));
	                booking.setMobile(rs.getString("mobile"));
	                bookings.add(booking);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return bookings;
	    }
}
