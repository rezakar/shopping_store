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

<div class="wraper">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="${contextRoot}/home">Home</a>
			</div>
			
		</div>
	</nav>
	<div class="content">
	<div class="container">
	<div class="row">
	<div class="col-xs-12">
	<div class="jumbotron">
	<h1>${errorTitle}</h1>
	<hr/>
	<blockquote>
	${errorDescription}
	</blockquote>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/jquery.js"></script>
	<!-- DataTable plugin -->
	<script src="${pageContext.request.contextPath}/resources/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/dataTables.bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/myapp.js"></script>
		
</body>
</html>
