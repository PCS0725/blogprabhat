<%@page import="main.Config"%>
<%@page import="main.model.Article"%>
<%@page import="main.datalayer.Database"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Archive Page</title>
    <link rel="stylesheet" type="text/css" href="<%=Config.style%>" />
  </head>
  <body>
    <div id="container">

      <a href="."><img id="logo2" src="<%=Config.imageSrc%>" alt="My name here"></a>
       <ul id="headlines" class="archive">
      <%
    	 	ArrayList<Article> articles = Database.getList(100000);// get all articles
			int i = 0;
			for(i=0; i<articles.size();++i)
			{
				int id = articles.get(i).getId();
			%>
			<li>
        		<h2>
          		<a href="viewArticle.jsp?viewArticleId=<%=id%>"><%=articles.get(i).getTitle()%></a>
        		</h2>
      			<p class="summary"><%=articles.get(i).getSummary()%></p>
     		</li>
      <%
      }
      %>
   </ul>
 	<div id="footer">
     	  <%=Config.footer %><a href="loginForm.jsp">Site Admin</a>
         </div>
	</div>
</body>
</html>