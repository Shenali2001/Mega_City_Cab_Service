package com.cabservice.controllers;

import com.cabservice.services.UserService;
import com.cabservice.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/getRidersByVehicleType")
public class GetRidersByVehicleTypeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String vehicleType = request.getParameter("vehicleType");

        UserService userService = new UserService();
        List<User> riders = userService.getRidersByVehicleType(vehicleType);

        // Manually construct JSON
        StringBuilder json = new StringBuilder("[");
        for (User rider : riders) {
            json.append("{")
                .append("\"username\":\"").append(rider.getFullName()).append("\",")
                .append("\"vehicleType\":\"").append(rider.getVehicleType()).append("\",")
                .append("\"plateNumber\":\"").append(rider.getVehicleNumber()).append("\",")
                .append("\"mobile\":\"").append(rider.getPhone()).append("\"")
                .append("},");
        }
        if (riders.size() > 0) {
            json.deleteCharAt(json.length() - 1); // Remove the last comma
        }
        json.append("]");

        // Set response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json.toString());
    }
}