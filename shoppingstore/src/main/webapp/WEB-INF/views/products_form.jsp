<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>

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
							<label class="control-label col-md-4" for="user">Select
								User:</label>
							<div class="col-md-8">
								<form:select path="users" class="form-control" id="user"
									name="user">
									<form:options items="${userslist}" itemValue="userid"
										itemLabel="fname" placeholder="Select One Category"
										class="form-control" id="user" />
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
									id="pname" placeholder="Product Name" required="required" />
								<form:errors path="name" cssClass="help-block" element="em" />
							</div>
						</div>
						<div class="form-group">
							<label for="brand" class="control-label col-md-4">Enter
								the Brand:</label>
							<div class="col-md-8">
								<form:input path="brand" type="text" class="form-control"
									id="brand" placeholder="Brand Name" required="required" />
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
							<label for="file" class="control-label col-md-4">Select a
								Image:</label>
							<div class="col-md-8">
								<form:input path="file" type="file" class="form-control"
									id="file" />
								<form:errors path="file" cssClass="help-block" elements="em" />
							</div>
						</div>
						<div class="form-group">
							<label for="price" class="control-label col-md-4">Enter
								Unit Price:</label>
							<div class="col-md-8">
								<form:input path="unit_price" type="number" class="form-control"
									id="price" placeholder="Unit Price in &#36;"
									required="required" />
								<form:errors path="unit_price" cssClass="text-warning" />
							</div>
						</div>
						<div class="form-group">
							<label for="education" class="control-label col-md-4">Is
								Product Active:</label>
							<div class="col-md-8">
								<form:checkbox path="is_active" id="education" />
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-4" for="categor">Select
								Categories:</label>
							<div class="col-md-8">
								<form:select path="category" class="form-control" id="categor"
									name="categor">
									<form:options items="${categorylist}" itemValue="categoryid"
										itemLabel="name" class="form-control" id="categor" />
								</form:select>
								<c:if test="${products.productsid == 0}">
							<div class="text-right">
								<br />
								<button type="button" data-toggle="modal"
									data-target="#myCategoryModal" class="btn btn-warning btn-xs">
									Add Category</button>
							</div>
						</c:if>
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
	<!--  Jason data controller-->
	<div class="row">
		<div class="col-xs-12">
			<h3>Available Products</h3>
			<hr />
		</div>
		<div class="col-xs-12">
			<div style="overflow: auto">
				<table id="adminProductsTable"
					class="table table-striped table-bordered">
					<thead>
						<tr>
							<!-- <th>Category</th>
		<th>User</th> -->
							<th>Id</th>
							<th>Code</th>
							<th>Product Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Situation Of Product</th>
							<th></th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<!-- <th>Category</th>
		<th>User</th> -->
							<th>Id</th>
							<th>Code</th>
							<th>Product Name</th>
							<th>Brand</th>
							<th>Quantity</th>
							<th>Price</th>
							<th>Situation Of Product</th>
							<th></th>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myCategoryModal" role="dialog"
		tabindex="-1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span>&times;</span>
					</button>
					<h4 class="modal-title">Add new Category</h4>
				</div>
				<div class="modal-body">
					<form:form id="categoryForm" modelAttribute="category"
						action="${contextRoot}/products/category" method="POST"
						class="form-horizontal">
						<%-- <form:input type="hidden" path="categoryid" /> --%>
						<div class="form-group">
							<label for="category_name" class="control-label col-md-4">Category
								Name</label>
								<div class="col-md-8">
							<form:input type="text" path="name" class="form-control"
								id="category_name" />
								</div>
						</div>
						<div class="form-group">
							<label for="image" class="control-label col-md-4">Image URL :</label>
							<div class="col-md-8">
							<form:input type="text" path="imageURL" class="form-control"
								id="image" />
							</div>
						</div>
						<div class="form-group">
							<label for="active" class="control-label col-md-4">Is Active :</label>
							<div class="col-md-8">
							<form:checkbox path="active" class="form-control" id="active" />
							</div>
						</div>
						<div class="form-group">
						<div class="col-md-offset-4 col-md-8">
						<button type="submit" value="Add Category" class="btn btn-default">Submit</button>
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
	$(document)
			.ready(
					function() {
						var $alert = $('.alert');
						if ($alert.length) {
							setTimeout(function() {
								$alert.fadeOut('slow');
							}, 3000)
						}
						/****************Begin Data set Json format for the table*******************/
						var $adminProductsTable = $('#adminProductsTable');

						//execute the below code only where have this table
						if ($adminProductsTable.length) {
							//Jason data controller
							var jsonUrl = window.contextRoot
									+ '/jason/data/admin/all/products';
							$adminProductsTable
									.DataTable({
										lengthMenu : [
												[ 10, 30, 50, -1 ],
												[ '10 Records', '30 Records',
														'50 Records', 'All' ] ],
										pageLength : 30,
										ajax : {
											url : jsonUrl,
											dataSrc : ''
										},
										columns : [
												{
													data : 'productsid'
												},
												{
													data : 'code'
												/* bSortable: false,
												mRender: function(data, type, row){
												return '<img src="'+window.contextRoot+'/resources/'+data+'.jpg" class="adminImageDataTable"/>'; 
												} */
												},
												{
													data : 'name'
												},
												{
													data : 'brand'
												},
												{
													data : 'unit_price',
													mRender : function(data,
															type, row) {
														return '&#36;' + data
													}
												},
												{
													data : 'quantity',
													mRender : function(data,
															type, row) {
														if (data < 1) {
															return '<span style="color:red">Out of stock!</span>';
														}

														return data;
													}
												},
												{
													data : 'is_active',
													bSortable : false,
													mRender : function(data,
															type, row) {
														var str = '';
														str += '<label class="switch">';
														if (data) {
															str += '<input type="chechbox" checked = "checked" value="'+row.productsid+'"/>';
														} else {
															str += '<input type="checkbox" value="'+row.productsid+'"/>';
														}
														str += '<div class="slider"></div></label>';
														return str;
													}
												},
												{
													data : 'productsid',
													bSortable : false,
													mRender : function(data,
															type, row) {
														var str = '';
														//managementController
														str += '<a href="'+window.contextRoot+'/products/'+data+'/product" class="btn btn-warning">';
														str += '<span class="glyphicon glyphicon-pencil"></span></a>';
														return str;
													}
												} ],
										initComplete : function() {
											var api = this.api();
											/****************Begin toggle switch***********/
											api
													.$(
															'.switch input[type="checkbox"]')
													.on(
															'change',
															function() {
																var checkbox = $(this);
																var checked = checkbox
																		.prop('checked');
																var dMsg = (checked) ? 'You want to active the product?'
																		: 'You want to deactive the product?';
																var value = checkbox
																		.prop('value');
																bootbox
																		.confirm({
																			size : 'medium',
																			title : 'Product Activation & Deactivation',
																			message : dMsg,
																			callback : function(
																					confirmed) {
																				if (confirmed) {
																					console
																							.log(value);
																					var activationUrl = window.contextRoot
																							+ '/manage/product/'
																							+ value
																							+ '/activation';
																					$
																							.post(
																									activationUrl,
																									function(
																											data) {
																										bootbox
																												.alert({
																													size : 'medium',
																													title : 'Information',
																													message : data
																												});
																									});

																				} else {
																					checkbox
																							.prop(
																									'checked',
																									!checked);
																				}
																			}
																			
																		});
															});
											/****************End toggle switch***********/

										}
									});
						}
						/****************End Data set Json format for the table*******************/
						//validation code for category modal
																			var $categoryForm = $('#categoryForm');
																			if($categoryForm.length){
																			$categoryForm.validate({
																			rules: {
																				name: {
																				required: true,
																				minlength:2
																				},
																				imageURL: {
																				required: true
																				}
																			},
																			messages : {
																			name : {
																			required: 'please add the category name!',
																			minlength:'The category name should not be less than 2 characters'
																			},
																			imageURL: {
																			required: 'please add the image URL name!'
																			}
																			},
																			errorElement: 'em',
																			errorPlacement: function(error, element){
																			//add the class of help-block
																			error.addClass('help-block');
																			//add the error element after the input element
																			error.insertAfter(element);
																			}
																			});
																			}
					});
</script>
