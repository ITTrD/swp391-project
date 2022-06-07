<%-- 
    Document   : admin
    Created on : Jun 7, 2022, 7:15:01 PM
    Author     : Xqy
--%>

<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");           
        %>
        Welcome Admin: <h1> <%= loginUser.getFullName()%>  </h1>
        <form action="MainController">
            <input type="submit" name="action" value="Logout"/>
        </form>
    </body>
</html>
