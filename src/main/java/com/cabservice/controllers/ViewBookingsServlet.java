package com.cabservice.controllers;

import com.cabservice.models.Booking;
import com.cabservice.services.BookingService;
import com.cabservice.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/view-bookings")
public class ViewBookingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    public void init() {
        bookingService = new BookingService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("user");

        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/role/login.jsp?error=sessionExpired");
            return;
        }

        String customerUsername = loggedInUser.getFullName();
        List<Booking> bookings = bookingService.getBookingsByCustomerUsername(customerUsername);

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("/role/customer/jsp/view-booking.jsp").forward(request, response);
    }
}