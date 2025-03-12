<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cabservice.models.Booking" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="<c:url value='/role/customer/css/view-booking.css'/>">
</head>
<body>
 <!-- Include the header -->
    <jsp:include page="/role/customer/jsp/header.jsp" />
    <div class="sidebar">
        <h2>Status Menu</h2>
        <ul>
            <li class="menu-item" data-status="REQUESTED">Requested</li>
            <li class="menu-item" data-status="ASSIGNED">Assigned</li>
            <li class="menu-item" data-status="ACCEPTED">Accepted</li>
            <li class="menu-item" data-status="IN_PROGRESS">In Progress</li>
            <li class="menu-item" data-status="COMPLETED">Completed</li>
            <li class="menu-item" data-status="CANCELLED">Cancelled</li>
        </ul>
    </div>

    <div class="content">
        <h2>Status Details</h2>
        <p id="REQUESTED" class="status-description">📌 **Requested Booking:** Your booking request has been received and is awaiting confirmation.</p>      <form action="${pageContext.request.contextPath}/view-bookings" method="get">
		    <button type="submit">View Bookings</button>
		</form>
        <p id="ASSIGNED" class="status-description">📝 **Assigned:** A staff member has been assigned to handle your booking request.</p>
        <p id="ACCEPTED" class="status-description">✅ **Accepted:** Your booking has been accepted, and further processing is in progress.</p>
        <p id="IN_PROGRESS" class="status-description">⏳ **In Progress:** Your request is currently being handled. Please wait for updates.</p>
        <p id="COMPLETED" class="status-description">🎉 **Completed:** Your booking has been successfully processed. Enjoy your stay!</p>
        <p id="CANCELLED" class="status-description">❌ **Cancelled:** Your booking has been cancelled as per request or due to other reasons.</p>

        <!-- Table for Requested Bookings -->
       
        <table id="requestedTable" class="status-table">
   
            <thead>
                <tr>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Price</th>
                    <th>Vehicle Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.pickupLocation}</td>
                        <td>${booking.dropOffLocation}</td>
                        <td>${booking.price}</td>
                        <td>${booking.vehicleType}</td>
                        <td><button class="action-btn">Cancel</button></td>
                    </tr>
                </c:forEach>

            </tbody>
        </table>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const menuItems = document.querySelectorAll(".menu-item");
            const descriptions = document.querySelectorAll(".status-description");
            const requestedTable = document.getElementById("requestedTable");

            menuItems.forEach(item => {
                item.addEventListener("click", function () {
                    // Remove active class from all items
                    menuItems.forEach(i => i.classList.remove("active"));
                    
                    // Add active class to clicked item
                    this.classList.add("active");

                    // Hide all descriptions and table
                    descriptions.forEach(desc => desc.style.display = "none");
                    requestedTable.style.display = "none";

                    // Show the relevant description
                    let selectedStatus = this.getAttribute("data-status");
                    document.getElementById(selectedStatus).style.display = "block";

                    // Show the table if "Requested" is clicked
                    if (selectedStatus === "REQUESTED") {
                        requestedTable.style.display = "table";
                    }
                });
            });
        });
    </script>
</body>
</html>