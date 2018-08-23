<h1 class="lead">Categories</h1>
<div class="list-group">
<c:forEach items="${categories}" var="category">
		<%-- <a href=" ${contextRoot}./category/${category.categoryid}/showall" class="list-group-item">${category.name}</a>  --%>
	<a href=" #" class="list-group-item">${category.name}</a>  
	</c:forEach>
</div>