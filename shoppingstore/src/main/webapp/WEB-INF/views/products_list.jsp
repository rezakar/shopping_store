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
<h1>List of Products</h1>
<c:if test="${!empty productslist }">
<%-- <select>
<c:forEach items="${productslist}" var="product" >
<option><c:url value="${product.category.name}"/></option>
</c:forEach>
</select> --%>
<table border="1">
<tr>
<th>ID</th>
<th>Category Name</th>
<th>User Name</th>
<th>Products Name</th>
<th>Brand</th>
<th>Code</th>
<th>Price</th>
<th>Quantity in stock</th>
<th>Is product Active</th>
<th>Command</th>
</tr>
<c:forEach items="${productslist}" var="products" >
<tr>
<td>${products.productsid}</td>
<td>${products.category.name}</td>
<td>${products.users.fname} ${products.users.lname}</td>
<td>${products.name}</td>
<td>${products.brand}</td>
<td>${products.code}</td>
<td>${products.unit_price}</td>
<td>${products.quantity}</td>
<td>${products.is_active}</td>
<td><a href="<c:url value='/products/remove/${products.productsid}' />" >Delete</a></td>
<td><a href="<c:url value='/products/products_form/${products.productsid}' />" >Edit</a></td>
</tr>
</c:forEach>
</table>
</c:if>
</body>
</html>