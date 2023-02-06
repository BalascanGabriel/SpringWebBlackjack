<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	

<form method="post" action="/save-login" >
	<label>Username:</label>
	<input type="text" name="name" ><br/>
	<label>Password:</label>
	<input type="password" name="password"><br/>
	<input type="hidden" name="action" value="loginSubmit"> 
	<input type="submit" value="Submit">
</form>

<c:if test="${loginFailed != null}">

  <script>
    alert("Login failed. Please try again.");
    console.log("Code");
  </script>
</c:if>

</body>
</html>