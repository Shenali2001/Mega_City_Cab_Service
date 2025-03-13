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
                <c:forEach var="driver" items="${drivers}">
                    <tr>
                        <td>${driver.fullName}</td>
                        <td>${driver.email}</td>
                        <td>${driver.phone}</td>
                        <td>${driver.address}</td>
                        <td>${driver.license}</td>
                        <td>${driver.vehicleType}</td>
                        <td>${driver.vehicleNumber}</td>
                        <td> <button class="delete-btn">Delete</button></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>