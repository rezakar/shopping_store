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
        <form:form method = "Post" action="${action}" commandName="users">
            <form:input type="hidden" path="userid" />
            <div class="form-group">
    <label for="fname">First Name :</label>
    <form:input type="text" path="fname" class="form-control" id="fname" />
  </div>
  <div class="form-group">
    <label for="lname">Last Name :</label>
    <form:input type="text" path="lname" class="form-control" id="lname" />
  </div>
  <div class="form-group">
    <label for="role">Role :</label>
    <form:input type="text" path="role" class="form-control" id="role" />
  </div>
  <%-- <div class="form-group">
    <label for="enabled">Enabled :</label>
    <form:input type="text" path="enabled" class="form-control" id="enabled" />
  </div> --%>
  <div class="form-group">
    <label for="email">Email:</label>
    <form:input type="text" path="email" class="form-control" id="email" />
  </div>
  <div class="form-group">
    <label for="password">Image URL :</label>
    <form:input type="text" path="password" class="form-control" id="password" />
  </div>
  <div class="form-group">
    <label for="contact">contact :</label>
    <form:input type="text" path="contact" class="form-control" id="contact" />
  </div>
  
  
  <button type="submit" value="Save" class="btn btn-default">Submit</button>
        
       </form:form>    
      </div>        
</body>
</html>