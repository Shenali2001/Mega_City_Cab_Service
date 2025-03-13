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
    <script>
        function confirmDelete(userId) {
            if (confirm("Are you sure you want to delete this Rider?")) {
                const form = document.createElement("form");
                form.method = "POST";
                form.action = "${pageContext.request.contextPath}/delete-rider";

                const input = document.createElement("input");
                input.type = "hidden";
                input.name = "userId";
                input.value = userId;

                form.appendChild(input);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>

<body>
  <div class="table-container">
        <h2>Rider Information</h2>
         <c:if test="${not empty param.success}">
            <div class="success-message">Driver deleted successfully!</div>
        </c:if>
        <c:if test="${not empty param.error}">
            <div class="error-message">Failed to delete driver. Please try again.</div>
        </c:if>
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
                         <td>
                            <button class="delete-btn" onclick="confirmDelete(${driver.userId})">Delete</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>