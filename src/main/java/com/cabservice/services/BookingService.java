package com.cabservice.services;

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
}
