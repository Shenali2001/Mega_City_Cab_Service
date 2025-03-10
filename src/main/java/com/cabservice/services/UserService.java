package com.cabservice.services;

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
}
