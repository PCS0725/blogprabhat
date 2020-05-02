<%@page import="main.Config"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="main.datalayer.Database"%>
<%@page import = "main.model.Article" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Welcome Page</title>
    <link rel="stylesheet" type="text/css" href="<%=Config.style %>" />
  </head>
  <body>
    <div id="container">

      <a href="."><img id="logo2" src="<%=Config.imageSrc %>" alt="My name here"></a>
	   <ul id="headlines">
	  <%
	 		ArrayList<Article> articles = Database.getList(Config.numRows); //number of articles to show on homepage
			int i = 0;
			for(i=0; i<articles.size();++i)                     //parse all articles and diplay in a format
			{
				int id = articles.get(i).getId();
				Date date = articles.get(i).getPublicationDate();
				java.text.SimpleDateFormat sdf = 
					     new java.text.SimpleDateFormat("dd MMMM ");
				String dte = sdf.format(date);
				//passing a paramter(viewArticleId) to viewArticle.jsp to specify the article
		%>
				<li>
	          		<h2>
	            		<span class="pubDate"><%=dte %></span><a href="viewArticle.jsp?viewArticleId=<%=id%>"><%=articles.get(i).getTitle()%></a>
	          		</h2>
	        		<p class="summary"><%=articles.get(i).getSummary() %></p>
	        </li>
	        <%
	        }
	        %>
	     </ul>
		
      	<p><a href="archive.jsp">Article Archive</a></p>
 		<div id="footer" style = "text-align : center">
     	  <%=Config.footer %><a href="loginForm.jsp">Site Admin</a>
         </div>

    </div>
  </body>
</html>