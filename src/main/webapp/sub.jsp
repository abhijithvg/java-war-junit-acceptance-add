<%@ page import="com.abhi.Calculator" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1">
    <title>Subtraction Page</title>
  </head>

    <body>
      <% Calculator calculator = new Calculator(); %>
      <%= "<h1> The difference is "+(calculator.subtract(Integer.parseInt(request.getParameter("t1")),Integer.parseInt(request.getParameter("t2"))))+"</h1>"%>

      <%-- <%= "<h1> The difference is "+(Integer.parseInt(request.getParameter("t1"))-Integer.parseInt(request.getParameter("t2")))+"</h1>"%> --%>
    </body>
</html>
