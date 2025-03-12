package com.cabservice.controllers;

import com.cabservice.services.BookingService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/cancel-booking")
public class CancelBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    public void init() {
        bookingService = new BookingService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        boolean isCancelled = bookingService.cancelBooking(bookingId);

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        if (isCancelled) {
            out.print("success");
        } else {
            out.print("error");
        }
        out.flush();
    }
}