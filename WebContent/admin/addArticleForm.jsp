<%@page import="main.Config"%>
<%@page import="main.datalayer.Database"%>
<%@page import="main.model.Article"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Add Article</title>
    <link rel="stylesheet" type="text/css" href="<%=Config.styleAdmin %>" />
  </head>
  <body>
 	 <%	
 	 	//Do not allow anyone until there is no login
 	 	try{
			if(session.getAttribute("login").equals("no"))
				response.sendRedirect("../loginForm.jsp");
		}catch(Exception e){
			response.sendRedirect("../index.jsp");
		}
%>
    <div id="container">
      <a href=".."><img id="logo2" src="<%=Config.imageSrcAdmin %>" alt="My name here"></a>
      
       <div id="adminHeader">
        <h2>Admin's place</h2>
        <p>You are logged in as <b><%=Config.username %></b>. <a href="logout.jsp">Log out</a></p>
      </div>
      
       <form action="addArticle.jsp" method="post">
        <input type="hidden" name="articleId"/>
        <ul>

          <li>
            <label for="title">Article Title</label>
            <input type="text" name="title" id="title" placeholder="Name of the article" required autofocus maxlength="255" value=" " />
          </li>

          <li>
            <label for="summary">Article Summary</label>
            <textarea name="summary" id="summary" placeholder="Brief description of the article" required maxlength="1000" style="height: 5em;"></textarea>
          </li>

          <li>
            <label for="content">Article Content</label>
            <textarea name="content" id="content" placeholder="The HTML content of the article" required maxlength="100000" style="height: 30em;"></textarea>
          </li>

          <!--  <li>
            <label for="publicationDate">Publication Date</label>
            <input type="date" name="publicationDate" id="publicationDate" placeholder="YYYY-MM-DD" required maxlength="10"/>
          </li>-->


        </ul>

        <div class="buttons">
          <input type="submit" name="saveChanges" value="Save Changes" />
          <input type="submit" formnovalidate name="cancel" value="Cancel" />
        </div>

      </form>
      <div id="footer">
     	  Config.footer<a href="../loginForm.jsp">Site Admin</a>
         </div>
	</div>

</body>
</html>