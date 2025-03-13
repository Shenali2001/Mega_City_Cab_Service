package com.cabservice.controllers;

import com.cabservice.models.Booking;
import com.cabservice.services.BookingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin-bookings")
public class AdminBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    public void init() {
        bookingService = new BookingService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch requested bookings
        List<Booking> requestedBookings = bookingService.getRequestedBookings();

        // Pass the bookings to the JSP page
        request.setAttribute("requestedBookings", requestedBookings);
        request.getRequestDispatcher("/role/admin/jsp/manage-booking.jsp").forward(request, response);
    }
}