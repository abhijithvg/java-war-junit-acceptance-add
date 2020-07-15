<html>
    <head>
        <title>Enter two numbers to subtract</title>
    </head>

    <body>
      <% Calculator calculator = new Calculator(); %>

      The difference is =
      <%= calculator.subtract(Integer.parseInt(request.getParameter("t1"), Integer.parseInt(request.getParameter("t2")) %>

    // <%= "<h1> The difference is "+(Integer.parseInt(request.getParameter("t1"))-Integer.parseInt(request.getParameter("t2")))+"</h1>"%>
    </body>
</html>
