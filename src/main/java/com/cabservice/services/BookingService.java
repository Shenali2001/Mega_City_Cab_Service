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
        return bookingDAO.updateBookingStatus(bookingId, "CANCELLED");
    }
}
