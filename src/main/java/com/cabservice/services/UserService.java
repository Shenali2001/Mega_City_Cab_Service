package com.cabservice.services;

import java.util.List;

import com.cabservice.dao.UserDAO;
import com.cabservice.models.User;

public class UserService {

	   private UserDAO userDAO = new UserDAO();

	    public boolean registerUser(User user) {
	        return userDAO.registerUser(user);
	    }

	    public User loginUser(String email, String password) {
	        return userDAO.loginUser(email, password);
	    }
	    
	    //Get all customer display for admin
	    public List<User> getAllCustomers() {
	        return userDAO.getAllCustomers();
	    }
	    
	    //Get all riders display for admin
	    public List<User> getAllDrivers() {
	        return userDAO.getAllDrivers();
	    }
	    
	    //Delete Rider
	    public boolean deleteDriver(int userId) {
	        return userDAO.deleteDriver(userId);
	    }
	    
	    // get Riders By Vehicle-Type
	    public List<User> getRidersByVehicleType(String vehicleType) {
	        return userDAO.getRidersByVehicleType(vehicleType);
	    }
}
