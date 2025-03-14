package com.cabservice.services;

import java.util.List;

import com.cabservice.dao.BookingDAO;
import com.cabservice.models.Booking;

public class BookingService {
    private BookingDAO bookingDAO;

    public BookingService() {
        bookingDAO = new BookingDAO();
    }

    public boolean saveBooking(Booking booking) {
        return bookingDAO.insertBooking(booking);
    }
    
    public List<Booking> getBookingsByCustomerUsername(String customerUsername) {
        return bookingDAO.getBookingsByCustomerUsername(customerUsername);
    }


    public boolean cancelBooking(int bookingId) {
        return bookingDAO.cancelBooking(bookingId);
    }
    
    // Fetch for Requested Booking for Admin  
    public List<Booking> getRequestedBookings() {
        return bookingDAO.getRequestedBookings();
    }
    
   // View-Cancle Booking For Customer
    public List<Booking> getCancelledBookingsByCustomerUsername(String customerUsername) {
        return bookingDAO.getCancelledBookingsByCustomerUsername(customerUsername);
    }
    
    // View-Assgn Rider
    public boolean assignRider(int bookingId, String riderUsername, String vehicleNumber) {
        return bookingDAO.assignRider(bookingId, riderUsername, vehicleNumber);
    }
    
}
