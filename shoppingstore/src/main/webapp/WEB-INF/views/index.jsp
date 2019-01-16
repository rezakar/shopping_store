<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html ng-app="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Shopping Store - ${title}</title>
<!-- <script type = "text/javascript" 
         src = "https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
      </script> -->
      <script type="text/javascript">
      window.menu = '${title}'
      window.contextRoot = '${contextRoot}'
      </script>
     
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/myapp.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dataTables.bootstrap.css">
	<%-- <script src="<c:url value="/resources/myapp.js" />"></script> --%>
</head>
<body>


	<!-- Navigation -->
	<%@include file="./shared/navbar.jsp" %>

	<!-- Page Content -->
	<!-- loading Home content here -->
	<c:if test="${userClickHome == true }">
	<%@include file="./home.jsp" %>
	</c:if>
	<!--Load when only user click about-->
	<c:if test="${userClickAbout == true}">
	<%@include file="./about.jsp" %>
	</c:if>
	<!--Load when only user click contact-->
	<c:if test="${userClickContact == true}">
	<%@include file="./contact.jsp" %>
	</c:if>
	<!--Load when only user click products-->
	<c:if test="${userClickProducts == true}">
	<%@include file="./products.jsp" %>
	</c:if>
	<!--Load when only user click products-->
	<c:if test="${userClickCategoryProducts == true}">
	<%@include file="./products.jsp" %>
	</c:if>
	<!--Load when only user click service-->
	<c:if test="${userClickService == true}">
	<%@include file="./service.jsp" %>
	</c:if>
	<%-- <!--Load when only user click service-->
	<c:if test="${userClickProducts == true or userClickCategoryProducts == true}">
	<%@include file="./products.jsp" %>
	</c:if> --%>
	<!--Load when only user click show product-->
	<c:if test="${userClickShowProduct == true}">
	<%@include file="./showsingleproduct.jsp" %>
	</c:if>
	<!--Load when only user click manage products-->
	<c:if test="${userClickManageProducts == true}">
	<%@include file="./products_form.jsp" %>
	</c:if>
	<!--Load when only user click manage products-->
	<c:if test="${userClickMP == true}">
	<%@include file="./manageProducts.jsp" %>
	</c:if>
	<!-- /.container -->

	<!-- Footer -->
	<%@include file="./shared/footer.jsp" %>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/jquery.js"></script>
	<!-- JQuery validate  -->
	<script src="${pageContext.request.contextPath}/resources/jquery.validate.js"></script>
	<!-- DataTable plugin -->
	<script src="${pageContext.request.contextPath}/resources/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/dataTables.bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>
		<script
		src="${pageContext.request.contextPath}/resources/bootbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/myapp.js"></script>
		
</body>
</html>
