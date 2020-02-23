<%@page import="main.Config"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="main.Database"%>
<%@page import = "main.Article" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Article Page</title>
    <link rel="stylesheet" type="text/css" href="<%=Config.style %>" />
  </head>
  <body>
  <%
  		int id = 0;
  		try{
	  		String id2=request.getParameter("viewArticleId").toString();  //get the parameter object and convert it to string
	  		id = Integer.parseInt(id2);
  		}catch(Exception e){
  			System.out.println("Article id null/not found");
  		}
		Article article = Database.getById(id);
		Date date = article.getPublicationDate();
		SimpleDateFormat sdf = new SimpleDateFormat("dd MMMM yyyy");
			String dte = sdf.format(date);
  %>
    <div id="container">

      <a href="."><img id="logo2" src="<%=Config.imageSrc %>" alt="My name here"></a>
	  
      <h1 style="width: 75%;"><%=article.getTitle() %></h1>
      <div style="width: 75%; font-style: italic;"><%=article.getSummary() %></div>
      <p class="pubDate">Published on <%=dte %></p><br>
      <div style="width: 75%;"><%=article.getContent() %></div>

      <p><a href="./">Return to Homepage</a></p><br>
      <p><a href="archive.jsp">Article Archive</a></p>
      
      </div>
 	<div id="footer">
     	<%=Config.footer %><a href="loginForm.jsp">Site Admin</a>
    </div>

</body>
</html>