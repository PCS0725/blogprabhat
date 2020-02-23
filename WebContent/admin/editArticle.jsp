<%@page import="main.Database"%>
<%@page import="main.Article"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Article background</title>
</head>
<body>
<%
		try{
			if(session.getAttribute("login").equals("no"))
				response.sendRedirect("../loginForm.jsp");
		}catch(Exception e){
			response.sendRedirect("/index.jsp");
		}
%>
	<% 
		String id2=request.getParameter("editArticleId").toString();
		int id = Integer.parseInt(id2);
		String title = (String)request.getParameter("title");
		String content = (String)request.getParameter("content");
		String summary = (String)request.getParameter("summary");
		//String date =  (String)  request.getParameter("publicationDate");
		//Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		Article article = new Article(id,new Date(),title,summary,content);
		System.out.println("Article gathered");
		int res = Database.update(article);
		if(res==-1){
			System.out.println("Couldn't insert");
			response.sendRedirect("editArticleForm.jsp?editArticleId="+id);
		}
		else
			response.sendRedirect("listArticles.jsp");
		%>
</body>
</html>