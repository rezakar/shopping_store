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
<div id="section2"> 
        <form:form method = "Post" action="${action}" commandName="category">
            <form:input type="hidden" path="categoryid" />
            <div class="form-group">
    <label for="fname">Name :</label>
    <form:input type="text" path="name" class="form-control" id="fname" />
  </div>
  <div class="form-group">
    <label for="lname">Image URL :</label>
    <form:input type="text" path="imageURL" class="form-control" id="lname" />
  </div>
  <div class="form-group">
    <label for="education">Is Active :</label>
    <form:checkbox path="active" class="form-control" id="education" />
  </div>
  
  
  <button type="submit" value="Save" class="btn btn-default">Submit</button>
        
       </form:form>    
      </div>        
</body>
</html>