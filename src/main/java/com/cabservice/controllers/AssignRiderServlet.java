package com.cabservice.controllers;

import com.cabservice.services.BookingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/assign-rider")
public class AssignRiderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    public void init() {
        bookingService = new BookingService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String riderUsername = request.getParameter("riderUsername");
        String vehicleNumber = request.getParameter("vehicleNumber");

        boolean isAssigned = bookingService.assignRider(bookingId, riderUsername, vehicleNumber);

        if (isAssigned) {
            response.sendRedirect("admin-bookings?success=true");
        } else {
            response.sendRedirect("admin-bookings?error=true");
        }
    }
}