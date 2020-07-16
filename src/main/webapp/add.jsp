<%@ page import="com.abhi.Calculator" %>
<html>
    <head>
        <title>Enter two numbers to add up</title>
    </head>

    <body>

      <% Calculator calculator = new Calculator(); %>
      <%= "<h1> The sum is "+(calculator.add(Integer.parseInt(request.getParameter("t1")),Integer.parseInt(request.getParameter("t2"))))+"</h1>"%>

    <%-- <%= "<h1> The sum is "+(Integer.parseInt(request.getParameter("t1"))+Integer.parseInt(request.getParameter("t2")))+"</h1>"%> --%>
    </body>
</html>
