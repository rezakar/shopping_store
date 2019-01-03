<div class="container">
	<div class="row">
		<!-- would be to display sidebar -->
		<div class="col-md-3">
			<%@include file="./shared/sidebar.jsp"%>
		</div>
		<!-- would be to display products -->
		<div class="col-md-9">
			<div class="row">

				<div class="col-lg-12">
					<c:if test="${userClickProducts == true}">
					<script>
					window.categoryid='';
					</script>
						<ol class="breadcrumb">
							<li><a href="${contextRoot}/home">Home</a></li>
							<li class="active">Products</li>

						</ol>
					</c:if>
					<c:if test="${userClickCategoryProducts == true}">
					<script>
					window.categoryid='${categoryid}';
					</script>
						<ol class="breadcrumb">
							<licalss"breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
      		<li class="calss"breadcrumb-item active">Category</li>
      		<li class="calss"breadcrumb-item active">${category.name}</li>
      		
      		</ol>
					</c:if>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<table id="productListTable"
							class="table table-striped table-borderd">
							<thead>

								<tr>
								
									<th>code</th>
									<th>Name</th>
									<th>Brand</th>
									<th>Unit Price</th>
									<th>quantity</th>
									<th>Is Active</th>
									<th></th>
								</tr>
							</thead>
							<tfoot>

								<tr>
								
									<th>code</th>
									<th>Name</th>
									<th>Brand</th>
									<th>Unit Price</th>
									<th>quantity</th>
									<th>Is Active</th>
									<th></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>

	</div>


</div>
