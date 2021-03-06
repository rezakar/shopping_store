<div class="container">
	<!-- Breadcrumb -->
	<div class="row">
		<div class="col-xs-12">
			<ol class="breadcrumb">
				<li><a href="${contextRoot}/home">Home</a></li>
				<li><a href="${contextRoot}/show/all/products">Products</a></li>
				<li class="active">${product.name}</li>
			</ol>
		</div>
	</div>
	<div class="row">
		<!-- Display the product image -->
		<div class="col-xs-12 col-sm-4">
			<div class="thumbnail">
				<img src="${resources} ${product.code}" class="img img-reponsive" />
			</div>
		</div>
		<!-- Display the product description -->
		<div class="col-xs-12 col-sm-8">
			<h3>${product.name}</h3>
			<hr />
			<p>${product.brand}</p>
			<hr />
			<h4>
				price: <strong> &#36; ${product.unit_price} /-</strong>
			</h4>
			<hr />
			<%-- <h6>Quality Available: ${product.quantity}</h6> --%>
			<c:choose>
			<c:when test="${product.quantity < 1 }">
			<h6>Quality Available: <span style="color:red">Out of stock!</span></h6>
			</c:when>
			<c:otherwise>
			<h6>Quality Available: ${product.quantity}</h6>
			</c:otherwise>
			</c:choose>
			<c:choose>
			<c:when test="${product.quantity < 1 }">
			<a href="javascript:void(0)"
				class="btn btn-success disable"> <strike>
				<span class="glyphicon glyphicon-shopping-cart"></span>Add to cart
			</strike></a>
			</c:when>
			<c:otherwise>
			<a href="${contextRoot}/cart/add/${product.productsid}/product"
				class="btn btn-success"> <span
				class="glyphicon glyphicon-shopping-cart"></span>Add to cart
			</a>
			</c:otherwise>
			</c:choose>
			 <a href="${contextRoot}/products" class="btn btn-primary">
				Back</a>
		</div>
	</div>
</div>