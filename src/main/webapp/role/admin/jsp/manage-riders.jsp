<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="<c:url value='/role/admin/css/manage.css'/>">
</head>
<jsp:include page="/role/admin/jsp/header.jsp" />
<body>
  <div class="table-container">
        <h2>Rider Information</h2>
        <table>
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Vehicle-Type</th>
                    <th>Vehicle-Number</th>
                    <th>license</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>John Doe</td>
                    <td>john@example.com</td>
                    <td>+1234567890</td>
                    <td>123 Main Street, NY</td>
                    <td>john@example.com</td>
                    <td>+1234567890</td>
                    <td>123 Main Street, NY</td>
                     <td>
                            <button class="delete-btn">Detete</button> <br><br>
                        </td>
                </tr>
                <tr>
                    <td>Jane Smith</td>
                    <td>jane@example.com</td>
                    <td>+9876543210</td>
                    <td>456 Park Avenue, CA</td>
                    <td>john@example.com</td>
                    <td>+1234567890</td>
                    <td>123 Main Street, NY</td>
                     <td>
                            <button class="delete-btn">Detete</button> <br><br>
                        </td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>