<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mega City Cab Service</title>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="<c:url value='/css/register.css'/>">
</head>
<body>

<form action="${pageContext.request.contextPath}/register" method="post">
   <h1>Registration Form</h1>
    <div class="form-row">
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="address">Address:</label>
            <input type="text" id="address" name="address">
        </div>
    </div>

    <div class="form-row">
        <div class="form-group">
            <label for="role">Select Role:</label>
            <select id="role" name="role" required>
                <option value="customer">Customer</option>
                <option value="driver">Driver</option>
            </select>
        </div>
    </div>

    <div id="driverFields" style="display: none;">
        <div class="form-row">
            <div class="form-group">
                <label for="license">License Number:</label>
                <input type="text" id="license" name="license">
            </div>
            <div class="form-group">
                <label for="vehicleType">Vehicle Type:</label>
                <input type="text" id="vehicleType" name="vehicleType">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="vehicleNumber">Vehicle Registration Number:</label>
                <input type="text" id="vehicleNumber" name="vehicleNumber">
            </div>
        </div>
    </div>

    <button type="submit">Register</button>
</form>

<script>
document.getElementById("role").addEventListener("change", function() {
    document.getElementById("driverFields").style.display = this.value === "driver" ? "block" : "none";
});
</script>
</body>
</html>