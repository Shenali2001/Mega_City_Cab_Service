package com.cabservice.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cabservice.dao.UserDAO;
import com.cabservice.models.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String fullName = request.getParameter("fullName");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String phone = request.getParameter("phone");
	    String address = request.getParameter("address");
	    String role = request.getParameter("role").toUpperCase();
	    String license = null;
	    String vehicleType = null;
	    String vehicleNumber = null;

	    if ("DRIVER".equals(role)) {
	        license = request.getParameter("license");
	        vehicleType = request.getParameter("vehicleType");
	        vehicleNumber = request.getParameter("vehicleNumber");
	    }

	    User user = new User();
	    user.setFullName(fullName);
	    user.setEmail(email);
	    user.setPassword(password);
	    user.setPhone(phone);
	    user.setAddress(address);
	    user.setRole(role);
	    user.setLicense(license);
	    user.setVehicleType(vehicleType);
	    user.setVehicleNumber(vehicleNumber);

	    UserDAO userDao = new UserDAO();
	    if (userDao.registerUser(user)) {
	        response.sendRedirect(request.getContextPath() + "/role/login.jsp?success=registered");
	    } else {
	        response.sendRedirect(request.getContextPath() + "/role/register.jsp?error=failed");
	    }
	}
}
