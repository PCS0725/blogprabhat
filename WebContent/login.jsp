<%@page import="main.Config"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Admin Login</title>
    </head>
   <body>
      <%
      		//This is a hidden layer behind the loginForm: security reasons
      		//It receives username and password and sets the login session attribute.
      		String user = request.getParameter("user");
      		String pass = request.getParameter("pass");
      		session.setAttribute("isError", "no");
      		session.setAttribute("login","no");
      		if(user.equals(Config.username)&&pass.equals(Config.password)){
      			session.setAttribute("login","yes");
      			response.sendRedirect("admin/listArticles.jsp");
      		}
      		else{
      			session.setAttribute("isError","yes");
      			response.sendRedirect("loginForm.jsp");
      		}
      %>
</body>
</html>