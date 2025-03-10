<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
  <title>Insert title here</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
</head>
<body>
   
<div class="container">
        <h2>Login to Your Account</h2>
        
        <% String error = request.getParameter("error"); %>
        <% if ("invalid".equals(error)) { %>
            <p class="error">Invalid email or password. Try again.</p>
        <% } %>

        <% String success = request.getParameter("success"); %>
        <% if ("registered".equals(success)) { %>
            <p class="success">Registration successful! Please log in.</p>
        <% } %>

        <form action="${pageContext.request.contextPath}/login" method="post">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Login</button>
        </form>

        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
   
     
</body>
</html>