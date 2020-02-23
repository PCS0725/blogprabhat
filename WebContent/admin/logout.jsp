<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout background</title>
</head>
<body>
<%
	session.setAttribute("login","no");
	response.sendRedirect("../index.jsp");
%>
</body>
</html>