<%@ page import="java.util.List" %>
<%@ page import="com.example.myapp.Entities.Client" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="countiner" style="flex-direction: column;justify-content: center">
    <form method="get" action="/clientlist">
        <input type="text" id="atr" name="atr"
               placeholder="marouane ait elhaj" required>
        <button type="submit" id="searchbtn">Search</button>
    </form>
    <div id="tableCountiner" style="position: relative">
        <a href="./"><span style="position: absolute;top: 20px;left: 20px;color: var(--bgk);z-index: 99"><-Back</span></a>
        <table id="myTable" style="position: relative;width: 100%">
            <thead>
            <tr>
                <th>Code</th>
                <th>Nom</th>
                <th>Prenom</th>
                <th>Date De Naissance</th>
                <th>Telephone</th>
                <th>Adresse</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="client" items="${clientList}">
                <tr>
                    <td>
                            ${client.code}
                    </td>
                    <td>
                            ${client.nom}
                    </td>
                    <td>
                            ${client.prenom}
                    </td>
                    <td>
                            ${client.dateDeNaissance}
                    </td>
                    <td>
                            ${client.telephone}
                    </td>
                    <td>
                            ${client.adresse}
                    </td>
                    <td>
                        <div>
                            <a href="/updateclient?code=${client.code}">
                                <button>
                                    Update
                                </button>
                            </a>
                            <a href="/deleteclient?code=${client.code}">
                                <button>
                                    Delete
                                </button>
                            </a>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
