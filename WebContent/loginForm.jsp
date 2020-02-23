<%@page import="main.Config"%>
<%@page import="main.Article"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Login form</title>
    <link rel="stylesheet" type="text/css" href="<%=Config.style %>" />
  </head>
  <body>
    <div id="container">

      <a href="."><img id="logo2" src="<%=Config.imageSrc %>" alt="My name here"></a>
      <% 
      try{
    	  	// if the user has already logged in current session.
			if(session.getAttribute("login").equals("yes"))
				response.sendRedirect("admin/listArticles.jsp");
			}catch(Exception e){
			}
      %>
      
      <form action="login.jsp" method="post" style="width: 50%;">
        <input type="hidden" name="login" value="true" />
		<%//figure out a way to display error message. In original, some initial script is handling all : admin.php 
		  //what I did with 'if' will not work as session will not be having any isError attribute until login.jsp is hit.%>
			<%//if(session.getAttribute("isError").equals("yes")) { %>
		        <!--  <div class="errorMessage">The user name or password does not match!</div>-->
				<% //} %>
        <ul>
          <li>
            <label for="username">Username</label>
            <input type="text" name="user" id="user" placeholder="Hey Admin.." required autofocus maxlength="20" />
          </li>

          <li>
            <label for="password">Password</label>
            <input type="password" name="pass" id="pass" placeholder="Keep it a secret.." required maxlength="20" />
          </li>
        </ul>

        <div class="buttons">
          <input type="submit" name="login" value="Login" />
        </div>

      </form>
      	<div id="footer">
      	<%=Config.footer %><a href="loginForm.jsp">Site Admin</a>
         </div>
	</div>
</body>
</html>