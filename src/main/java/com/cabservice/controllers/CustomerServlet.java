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

@WebServlet("/customers")
public class CustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        UserService userService = new UserService();
        List<User> customers = userService.getAllCustomers();

        request.setAttribute("customers", customers);
        request.getRequestDispatcher("role/admin/jsp/manage-customer.jsp").forward(request, response);
    }
}