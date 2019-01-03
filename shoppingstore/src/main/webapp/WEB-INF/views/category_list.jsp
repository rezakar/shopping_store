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
        <c:if test="${!empty listCategory}">
            <table class="table table-striped">
                <tr>
                    <th>ID</th>
                    <th>name</th>
                    <th>imageURL</th>
                    <th>active</th>
                    <th>Command</th>
                    <th>Command</th>
                </tr>
                <c:forEach items="${listCategory}" var="category">
                    <tr>
                        <td>${category.categoryid}</td>
                        <td>${category.name}</td>
                        <td>${category.imageURL}</td>
                        <td>${category.active}</td>
                        
                        <td><a href="<c:url value='/remove/${category.categoryid}' />" >Delete</a></td>
                        <td><a href="<c:url value='/category/${category.categoryid}' />" >Edit</a></td>
                    </tr>
                </c:forEach>
            </table>
            <br>
        </c:if>
</body>
</html>