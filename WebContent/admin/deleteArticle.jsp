<%@page import="main.Database"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete article background</title>
</head>
<body>
	<%
		try{
			if(session.getAttribute("login").equals("no"))
				response.sendRedirect("../loginForm.jsp");
			else
			{
				String id2=request.getParameter("deleteArticleId").toString();
				int id = Integer.parseInt(id2);
				int res = Database.delete(id);
				response.sendRedirect("listArticles.jsp");
			}
		}catch(Exception e){
			response.sendRedirect("../index.jsp");
		}
	%>
</body>
</html>