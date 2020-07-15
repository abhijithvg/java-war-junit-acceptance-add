<%@ page import="com.abhi.Calculator" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

    <% Calculator calculator = new Calculator(); %>

    Addition of 20 + 10 =
    <%= calculator.add(20, 10) %>

    <br><br> Subtraction of 20 - 10 =
    <%= calculator.subtract(20, 10) %>

    <br><br> Multiplication of 20 * 10 =
    <%= calculator.multiply(20, 10) %>

    <br><br> Division of 20/10 =
    <%= calculator.divide(20, 10) %>

</body>
</html>
