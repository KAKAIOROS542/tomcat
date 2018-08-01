<%-- 
    Document   : TestConec
    Created on : 29/11/2013, 07:39:51 AM
    Author     : SENA
--%>

<%@page import="modelo.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%= Conectar.getInstace()  %></h1>
    </body>
</html>
