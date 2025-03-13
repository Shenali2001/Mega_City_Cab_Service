<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cabservice.models.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ride Booking Form</title>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="<c:url value='/role/customer/css/addBooking.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Include the header -->
</head>
   <jsp:include page="/role/customer/jsp/header.jsp" />
<body>

 
    <div class="container">
      <form action="${pageContext.request.contextPath}/add-booking" method="post">
         <h2>Book a Ride</h2>
         
          <% String error = request.getParameter("error"); %>
        <% if ("invalid".equals(error)) { %>
            <p class="error">Invalid email or password. Try again.</p>
        <% } %>

        <% String success = request.getParameter("success"); %>
        <% if ("registered".equals(success)) { %>
            <p class="success">Registration successful! Please log in.</p>
        <% } %>
 
		   <%
			    User loggedInUser = (User) session.getAttribute("user");
			    if (loggedInUser != null) {
			%>
			  <label for="phone">Name:</label>
			    <p><%= loggedInUser.getFullName() %></p>
			<%
			    } else {
			%>
			    <p>User not logged in.</p>
			<%
			    }
			%>
			
	      
	        <label for="pickup">Pickup Location:</label>
	        <input type="text" id="pickup" name="pickup" required>
	
	        <label for="dropoff">Drop-off Location:</label>
	        <input type="text" id="dropoff" name="dropoff" required>
	        
	         <label for="dropoff">Mobile:</label>
	        <input type="text" id="mobile" name="mobile" required>
	        
	        <div class="form-group">
	            <label for="length_of_ride">Length of Ride (in km)</label>
	            <input type="number" step="0.01" id="length_of_ride" name="length_of_ride" required>
	        </div>
	
	        <div class="form-group">
	            <label>Select Vehicle Type:</label>
	            <div class="vehicle-cards">
	                <label class="card">
	                    <input type="radio" name="vehicleType" value="car" required>
	                    <i class="fas fa-car"></i> <span>Car</span>
	                </label>
	                <label class="card">
	                    <input type="radio" name="vehicleType" value="bike">
	                    <i class="fas fa-motorcycle"></i> <span>Bike</span>
	                </label>
	                <label class="card">
	                    <input type="radio" name="vehicleType" value="suv">
	                    <i class="fas fa-car-side"></i> <span>SUV</span>
	                </label>
	                <label class="card">
	                    <input type="radio" name="vehicleType" value="van">
	                    <i class="fas fa-shuttle-van"></i> <span>Van</span>
	                </label>
	            </div>
	        </div>
	
	        <div class="form-group">
	            <label for="price">Price (LKR)</label>
	            <input type="number" step="0.01" id="price" name="price" required readonly>
	        </div>
	
	        <button type="submit">Book Now</button>
    </form>
        <script>
        function calculatePrice() {
            var vehicleType = document.querySelector('input[name="vehicleType"]:checked');
            var lengthOfRide = parseFloat(document.getElementById('length_of_ride').value);
            var priceField = document.getElementById('price');

            if (vehicleType && !isNaN(lengthOfRide)) {
                var vehicleRates = {
                    "car": 100,
                    "bike": 50,
                    "suv": 150,
                    "van": 120
                };
                var rate = vehicleRates[vehicleType.value] || 0;
                var price = rate * lengthOfRide;
                priceField.value = price.toFixed(2);
            }
        }

        window.onload = function() {
            calculatePrice();
            var vehicleRadios = document.querySelectorAll('input[name="vehicleType"]');
            vehicleRadios.forEach(function(radio) {
                radio.addEventListener('change', calculatePrice);
            });
            document.getElementById('length_of_ride').addEventListener('input', calculatePrice);
        };
    </script>
</div>
</body>
</html>
