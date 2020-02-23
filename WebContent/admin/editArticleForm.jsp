<%@page import="main.Config"%>
<%@page import="main.Article"%>
<%@page import="main.Database"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Edit Article</title>
    <link rel="stylesheet" type="text/css" href="<%=Config.styleAdmin %>" />
  </head>
 <body>
    <div id="container">
      <a href=".."><img id="logo2" src="<%=Config.imageSrcAdmin %>" alt="My name here"></a>
      
      <%	
      		try{
				if(session.getAttribute("login").equals("no"))
					response.sendRedirect("../loginForm.jsp");
			}catch(Exception e){
				response.sendRedirect("../index.jsp");
		}
		%>
      
     <div id="adminHeader">
        <h2>Admin's place</h2>
        <p>You are logged in as <b>Prabhat</b>&nbsp&nbsp <a href="logout.jsp">Log out</a></p>
      </div>
	<%
		int id =0;
		//if editArticleId is null..
		try{
			String id2=request.getParameter("editArticleId").toString();
			id = Integer.parseInt(id2);
		}catch(Exception e){
			response.sendRedirect("../index.jsp");
		}
  		Article article = Database.getById(id);
	%>


      <h1><%=article.getTitle() %></h1>

      <form action="editArticle.jsp?editArticleId=<%=id%>" method="post">
        <input type="hidden" name="articleId"/>

        <ul>

          <li>
            <label for="title">Article Title</label>
            <input type="text" name="title" id="title" placeholder="Name of the article" required autofocus maxlength="255" value="<%=article.getTitle() %>" />
          </li>

          <li>
            <label for="summary">Article Summary</label>
            <textarea name="summary" id="summary" placeholder="Brief description of the article" required maxlength="1000" style="height: 5em;"><%=article.getSummary() %></textarea>
          </li>

          <li>
            <label for="content">Article Content</label>
            <textarea name="content" id="content" placeholder="The HTML content of the article" required maxlength="100000" style="height: 30em;"><%=article.getContent() %></textarea>
          </li>

         <!--  <li>
            <label for="publicationDate">Publication Date</label>
            <input type="date" name="publicationDate" id="publicationDate" placeholder="YYYY-MM-DD" required maxlength="10" value="<%=article.getPublicationDate() %>" />
          </li>-->


        </ul>

        <div class="buttons">
          <input type="submit" name="saveChanges" value="Save Changes" />
          <input type="submit" formnovalidate name="cancel" value="Cancel" />
        </div>

      </form>
      <p><a href="deleteArticle.jsp?deleteArticleId=<%=article.getId()%>">Delete This Article(Careful!)</a></p>
	<?php } ?>
	</div>
</body>
</html>