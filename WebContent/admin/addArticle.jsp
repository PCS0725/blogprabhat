<%@page import="main.Database"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="main.Article"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add article background</title>
</head>
<body>
<%
		//if the user is not logged in yet
		try{
			if(session.getAttribute("login").equals("no"))
				response.sendRedirect("../loginForm.jsp");
		}catch(Exception e){
			response.sendRedirect("../index.jsp");
		}
	%>
	<%
		String title = (String)request.getParameter("title");
		String content = (String)request.getParameter("content");
		String summary = (String)request.getParameter("summary");
		Date date = new Date();
		Article article = new Article(1,date,title,summary,content);
		System.out.println("Article gathered");
		int res = Database.insert(article);
		if(res==-1){
			System.out.println("Couldn't insert");
			response.sendRedirect("addArticleForm.jsp");
		}
		else
			response.sendRedirect("listArticles.jsp");
	%>
</body>
</html>