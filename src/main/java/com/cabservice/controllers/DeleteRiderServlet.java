package com.cabservice.controllers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cabservice.services.UserService;

import java.io.IOException;

@WebServlet("/delete-rider")
public class DeleteRiderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));

        UserService userService = new UserService();
        boolean isDeleted = userService.deleteDriver(userId);

        if (isDeleted) {
            response.sendRedirect(request.getContextPath() + "/riders?success=deleted");
        } else {
            response.sendRedirect(request.getContextPath() + "/riders?error=deleteFailed");
        }
    }
}