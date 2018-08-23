<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>List Student</h1>
        <c:if test="${!empty userslist}">
            <table class="table table-striped">
                <tr>
                    <th>ID</th>
                    <th>Firstname</th>
                    <th>Lastname</th>
                    <th>Role</th>
                    <!-- <th>Enabled</th> -->
                    <th>Email</th>
                    <th>Password</th>
                    <th>Contact</th>
                </tr>
                <c:forEach items="${userslist}" var="users">
                    <tr>
                        <td>${users.userid}</td>
                        <td>${users.fname}</td>
                        <td>${users.lname}</td>
                        <td>${users.role}</td>
                        <%-- <td>${users.enabled}</td> --%>
                        <td>${users.email}</td>
                        <td>${users.password}</td>
                        <td>${users.contact}</td>
                        <%-- <td>${category.active}</td> --%>
                        
                        <td><a href="<c:url value='/users/remove/${users.userid}' />" >Delete</a></td>
                        <td><a href="<c:url value='/users/users/${users.userid}' />" >Edit</a></td>
                    </tr>
                </c:forEach>
            </table>
            <br>
        </c:if>
</body>
</html>