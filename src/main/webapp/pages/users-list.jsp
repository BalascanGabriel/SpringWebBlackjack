<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="ro.gabe.blackjack.model.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
		Iterable<User> userii = (Iterable<User>)request.getAttribute("USERII");
		%>
	<h2>Userii here</h2>
	<ul>
		<%
			for(User u: userii){
				out.println("<li>" + u.getName() + "</li>");
			}
		%>
	</ul>
</body>
</html>