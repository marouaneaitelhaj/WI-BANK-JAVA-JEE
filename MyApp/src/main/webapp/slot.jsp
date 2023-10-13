<%--
  Created by IntelliJ IDEA.
  User: MAROUANE
  Date: 10/12/2023
  Time: 9:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="countiner">
    <div class="mini-countiner">
        <% String message = request.getAttribute("message").toString(); %>
        <h1><%= message%>
        </h1>
        <a href="./clientlist">
            <span style="color: var(--bgk);"><-Back</span></a>
    </div>
</div>
</body>
</html>
