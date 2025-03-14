<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.cabservice.models.User" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession sessionObj = request.getSession(false);
    User loggedInUser = (sessionObj != null) ? (User) sessionObj.getAttribute("user") : null;
    String userName = (loggedInUser != null) ? loggedInUser.getFullName() : "Guest";
    String userRole = (loggedInUser != null) ? loggedInUser.getRole() : "Guest";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<c:url value='/role/customer/css/header.css'/>">
    <title>Booking System - <%= userRole %></title>

    <script>
        function toggleMenu() {
            var navLinks = document.querySelector(".nav-links");
            navLinks.classList.toggle("show");
        }
    </script>
</head>
<body>
    <header class="navbar">
        <div class="logo">
            <a href="index.jsp">Booking System - <%= userRole %></a>
        </div>
        <nav>
            <ul class="nav-links">
                <li><a href="<%= request.getContextPath() %>/role/customer/jsp/index.jsp">Home</a></li>
                <li><a href="<%= request.getContextPath() %>/role/customer/jsp/AddBooking.jsp">New Booking</a></li>
                <li><a href="<%= request.getContextPath() %>/role/customer/jsp/view-booking.jsp">View Bookings</a></li>
                

                <% if (loggedInUser != null) { %>
                    <li><a href="#" style="color: yellow;" ><%= userName %></a></li>
                    <li><a href="<%= request.getContextPath() %>/role/logout" class="login-btn">Logout</a></li>
                <% } else  { %>
                    <li><a href="<%= request.getContextPath() %>/role/login.jsp" class="login-btn">Login</a></li>
                <% } %>
                    <li><a href="<%= request.getContextPath() %>/role/register.jsp">Register</a></li>
            </ul>
            <div class="menu-toggle" onclick="toggleMenu()">☰</div>
        </nav>
    </header>
</body>
</html>
