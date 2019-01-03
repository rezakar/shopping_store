<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="container">
	<div class="row">
	<c:if test="${not empty message}">
		<div class="col-xs-12">
		<div class="alert alert-success alert-dismissiable">
		<button class="close" type="button" data-dismiss="alert">&times;</button>
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
					<!-- Form elements -->
					<sf:form class="form-horizontal" modelAttribute="product"
						action="${contextRoot}/manage/manageProducts"
						method="POST">
						<sf:hidden path="productsid"/>
						<div class="form-group">
							<label class="control-label col-md-4" for="name">Enter
								Product Name:</label>
							<div class=" col-md-8">
								<sf:input type="text" path="name" id="name"
									placeholder="Product Name" class="form-control" />
								<em class="help-block">Please Enter Product Name!</em>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" for="brand">Enter
								brand Name:</label>
							<div class=" col-md-8">
								<sf:input type="text" path="brand" id="brand"
									placeholder="brand Name" class="form-control" />
								<em class="help-block">Please Enter brand Name!</em>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" for="code">Enter
								Code:</label>
							<div class=" col-md-8">
								<sf:input type="text" path="code" id="code" placeholder="code"
									class="form-control" />
								<em class="help-block">Please Enter The Code!</em>
							</div>
							<div class="form-group">
								<label class="control-label col-md-4" for="unit_Price">Enter
									Price:</label>
								<div class=" col-md-8">
									<sf:input type="text" path="unit_price" id="unitPrice"
										placeholder="UnitPrice" class="form-control" />
									<em class="help-block">Please Enter Price!</em>
								</div>
								<div class="form-group">
									<label class="control-label col-md-4" for="quantity">Enter
										quantity:</label>
									<div class=" col-md-8">
										<sf:input type="text" path="quantity" id="quantity"
											placeholder="quantity" class="form-control" />
										<em class="help-block">Please Enter quantity!</em>
									</div>
									<div class="form-group">
										<label class="control-label col-md-4" for="is_active">Is
											product active:</label>
										<div class=" col-md-8">
											<sf:input type="text" path="is_active" id="is_active"
												placeholder="is active" class="form-control" />
											<em class="help-block">Please Enter product is active or
												not!</em>
										</div>
									</div>
									<%-- <div class="form-group">
							<label class="control-label col-md-4" for="categor">select category :</label>
							<div class=" col-md-8">
								<sf:select class="form-control" id="categor" path="categoryid"
								items="${categories}"
								itemLabel="name"
								itemValue="categoryid"/>
								
							</div>
						</div> --%>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class=" col-md-offset-4 col-md-8">

								<input type="submit" name="submit" id="submit" value="Submit"
									class="btn btn-primary" />
							</div>
						</div>
					</sf:form>
				</div>
			</div>
		</div>
	</div>
</div>