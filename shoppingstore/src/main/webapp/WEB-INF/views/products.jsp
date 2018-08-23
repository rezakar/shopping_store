<div class="container">
      <div class="row">
      <!-- would be to display sidebar -->
      <div class="col-md-3">
      <%@include file="./shared/sidebar.jsp" %>
      </div>
      <!-- would be to display products -->
      <div class="col-md-9">
      	<div class="row">
      		<div class="col-lg-12">
      		<c:if test="${userClickProducts == true}">
      		<ol class="breadcrumb">
      		<li><a href="${contextRoot}/home">Home</a></li>
      		<li class="active">Products</li>
      		
      		</ol>
      		</c:if>
      		<c:if test="${userClickCategoryProducts == true}">
      		<ol class="breadcrumb">
      		<li calss"breadcrumb-item"><a href="${contextRoot}/home">Home</a></li>
      		<li class="calss"breadcrumb-item active">Category</li>
      		<li class="calss"breadcrumb-item active">${category.name}</li>
      		
      		</ol>
      		</c:if>
      		</div>
      	</div>
      </div>
      <h1>products</h1>
      <hr/>
      <p>This is our product page</p>
      </div>
      
      </div>