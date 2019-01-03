<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<<title>Shopping Store - ${title}</title>
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
	<script src="<c:url value="/resources/myapp.js" />"></script>
</head>

<body> --%>
	<div class="container">
		<div class="row">
		<c:if test="${not empty message}">
		<div class="col-xs-12">
		<div class="alert alert-success alert-dismissible">
		<button type="button" class="close" data-dismiss="alert">&times;</button>
		${message}
		</div>
		</div>
		</c:if>
			<div class="col-md-offset-2 col-md-8">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h4>Product Management</h4>
					</div>
					<div class="panel-body">
						<form:form method="Post" action="${action}" commandName="products"
							class="form-horizontal" enctype="multipart/form-data">
							<div class="form-group">
								<label class="control-label col-md-4" for="categor">Select
									Categories:</label>
								<div class="col-md-8">
									<form:select path="category" class="form-control" id="categor"
										name="categor">
										<form:options items="${categorylist}" itemValue="categoryid"
											itemLabel="name" class="form-control" id="categor" />
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" for="user">Select
									User:</label>
								<div class="col-md-8">
									<form:select path="users" class="form-control" id="user"
										name="user">
										<form:options items="${userslist}" itemValue="userid"
											itemLabel="fname"  placeholder="Select One Category" class="form-control" id="user" />
									</form:select>
								</div>
							</div>
							<div class="form-group">
								<label for="code" class="control-label col-md-4">Enter
									the code:</label>
								<div class="col-md-8">
									<form:input path="code" type="text" class="form-control"
										id="code" placeholder="Product Code" />
								</div>
							</div>
							<div class="form-group">
								<label for="pname" class="control-label col-md-4">Enter
									Product Name:</label>
									<div class="col-md-8">
								<form:input path="name" type="text" class="form-control"
									id="pname" placeholder="Product Name" required="required"/>
									<form:errors path="name" cssClass="help-block" element="em"/>
							</div>
							</div>
							<div class="form-group">
								<label for="brand" class="control-label col-md-4">Enter
									the Brand:</label>
									<div class="col-md-8">
								<form:input path="brand" type="text" class="form-control"
									id="brand" placeholder="Brand Name" required="required"/>
								<form:errors path="brand" cssClass="text-warning" />
									
							</div>
							</div>
							<div class="form-group">
								<label for="quant" class="control-label col-md-4">Enter
									Quantity:</label>
									<div class="col-md-8">
								<form:input path="quantity" type="number" class="form-control"
									id="quant" placeholder="Quantity Available" />
							</div>
							</div>
							<div class="form-group">
								<label for="file" class="control-label col-md-4">Select a Image:</label>
									<div class="col-md-8">
								<form:input path="file" type="file" class="form-control"
									id="file"  />
							</div>
							</div>
							<div class="form-group">
								<label for="price" class="control-label col-md-4">Enter
									Unit Price:</label>
									<div class="col-md-8">
								<form:input path="unit_price" type="number" class="form-control"
									id="price" placeholder="Unit Price in &#36;" required="required"/>
								<form:errors path="unit_price" cssClass="text-warning" />
							</div>
							</div>
							<div class="form-group">
								<label for="education" class="control-label col-md-4">Is
									Product Active:</label>
									<div class="col-md-8">
								<form:checkbox path="is_active" 
									id="education" />
							</div>
							</div>
							<div class="form-group">
								<div class=" col-md-offset-4 col-md-8">

									<button type="submit" id="submit"
										value="<spring:message text="Add Products"/>"
										class="btn btn-default">Submit</button>
								</div>
							</div>

						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
//dismissing the alert after 3 seconds
$(document).ready(function(){
	var $alert= $('.alert');
	if($alert.length){
		setTimeout(function(){
		$alert.fadeOut('slow');
	} , 3000)
	}
	});
</script>
	<%-- <div id="section2">
<form:form method="Post" action="${action}" commandName="products">
<div class="form-group">
<label for="categor">Categories:</label>
<form:select path="category">
<form:options items="${categorylist}" itemValue="categoryid"
itemLabel="name" class="form-control" id="categor" />
</form:select>
</div>
<div class="form-group">
<label for="user">Users:</label>
<form:select path="users">
<form:options items="${userslist}" itemValue="userid" 
itemLabel="fname" class="form-control" id="user" />
</form:select>
</div>
<form:input type="hidden" path="productsid"/>
<div class="form-group">
<label for="code">code:</label>
<form:input path="code" type="text" class="form-control" id="code"/>
</div>
<div class="form-group">
<label for="pname">Product Name:</label>
<form:input path="name" type="text" class="form-control" id="pname"/>
</div>
<div class="form-group">
<label for="brand">Brand:</label>
<form:input path="brand" type="text" class="form-control" id="brand"/>
</div>
<div class="form-group">
<label for="price">Unit Price:</label>
<form:input path="unit_price" type="number" class="form-control" id="price"/>
</div>
<div class="form-group">
<label for="quant">Quantity:</label>
<form:input path="quantity" type="number" class="form-control" id="quant"/>
</div>
<div class="form-group">
    <label for="education">Is Product Active:</label>
    <form:checkbox path="is_active" class="form-control" id="education" />
  </div>
<button type="submit" value="<spring:message text="Add Products"/>" 
class="btn btn-default">Submit</button>
</form:form>
</div> --%>
<!-- Bootstrap core JavaScript -->
	<%-- <script src="${pageContext.request.contextPath}/resources/jquery.js"></script>
	<!-- DataTable plugin -->
	<script src="${pageContext.request.contextPath}/resources/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/dataTables.bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/myapp.js"></script>
</body>
</html> --%>