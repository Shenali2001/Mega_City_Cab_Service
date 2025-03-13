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

@WebServlet("/riders")
public class RiderServlet extends HttpServlet {
	   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {

	        UserService userService = new UserService();
	        List<User> drivers = userService.getAllDrivers();

	        request.setAttribute("drivers", drivers);
	        request.getRequestDispatcher("/role/admin/jsp/manage-riders.jsp").forward(request, response);
	    }
}
