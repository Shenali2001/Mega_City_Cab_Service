package com.cabservice.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cabservice.dao.UserDAO;
import com.cabservice.models.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UserDAO userDao = new UserDAO();
        User user = userDao.loginUser(email, password);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            
            // Redirect based on user role
            switch (user.getRole()) {
                case "ADMIN":
                    response.sendRedirect(request.getContextPath() + "/role/admin/jsp/header.jsp");
                    break;
                case "DRIVER":
                    response.sendRedirect(request.getContextPath() + "/role/driver/jsp/header.jsp");
                    break;
                default: // CUSTOMER
                    response.sendRedirect(request.getContextPath() + "/role/customer/jsp/header.jsp");
                    break;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/role/login.jsp?error=invalid");
        }
    }
}
