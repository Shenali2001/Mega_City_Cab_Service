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

@WebServlet("/add-booking")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingService bookingService;

    public void init() {
        bookingService = new BookingService();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Get user from session - based on your JSP, you're storing a User object
        User loggedInUser = (User) session.getAttribute("user");
        
        if (loggedInUser == null) {
            response.sendRedirect(request.getContextPath() + "/role/login.jsp?error=sessionExpired");
            return;
        }
        
        // Use username from the user object
        String customerUsername = loggedInUser.getFullName(); // or whatever field stores the username

        try {
            String pickupLocation = request.getParameter("pickup");
            String dropOffLocation = request.getParameter("dropoff");
            String mobile = request.getParameter("mobile");
            double lengthOfRide = Double.parseDouble(request.getParameter("length_of_ride"));
            
            // Convert vehicleType to uppercase to match ENUM values
            String vehicleType = request.getParameter("vehicleType").toUpperCase();
            
            double price = Double.parseDouble(request.getParameter("price"));

            Booking booking = new Booking();
            booking.setCustomerUsername(customerUsername);
            booking.setPickupLocation(pickupLocation);
            booking.setMobile(mobile);
            booking.setDropOffLocation(dropOffLocation);
            booking.setLengthOfRide(lengthOfRide);
            booking.setVehicleType(vehicleType);
            booking.setPrice(price);
            booking.setRideStatus("REQUESTED");

            boolean isSaved = bookingService.saveBooking(booking);

            if (isSaved) {
                response.sendRedirect(request.getContextPath() + "/role/customer/jsp/home.jsp?success=bookingAdded");
            } else {
                // Changed the error redirect to a more appropriate page
                response.sendRedirect(request.getContextPath() + "/role/customer/addBooking.jsp?error=failed");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Add this for debugging
            response.sendRedirect(request.getContextPath() + "/role/customer/addBooking.jsp?error=invalidInput");
        } catch (Exception e) {
            e.printStackTrace(); // Add this for debugging
            response.sendRedirect(request.getContextPath() + "/role/customer/addBooking.jsp?error=serverError");
        }
    }
}
