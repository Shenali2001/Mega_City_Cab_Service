package com.cabservice.controllers;

import com.cabservice.services.BookingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/cancel-booking")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    public void init() {
        bookingService = new BookingService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the booking ID from the request
        String bookingId = request.getParameter("bookingId");

        if (bookingId == null || bookingId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/role/customer/jsp/view-booking.jsp?error=invalidBookingId");
            return;
        }

        try {
            // Call the service to cancel the booking
            boolean isCancelled = bookingService.cancelBooking(Integer.parseInt(bookingId));

            if (isCancelled) {
                response.sendRedirect(request.getContextPath() + "/role/customer/jsp/view-booking.jsp?success=bookingCancelled");
            } else {
                response.sendRedirect(request.getContextPath() + "/role/customer/jsp/view-booking.jsp?error=cancellationFailed");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/role/customer/jsp/view-booking.jsp?error=invalidBookingId");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/role/customer/jsp/view-booking.jsp?error=serverError");
        }
    }
}