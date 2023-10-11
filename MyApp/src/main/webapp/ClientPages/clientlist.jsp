<%@ page import="java.util.List" %>
<%@ page import="com.example.myapp.Entities.Client" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="countiner" style="flex-direction: column;justify-content: center">
    <form method="post" action="/clientlist">
        <input type="text" id="atr" name="atr"
               placeholder="marouane ait elhaj" required>
        <button type="submit" id="searchbtn">Search</button>
    </form>
    <table id="myTable" style="position: relative">
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
        <% List<Client> clientList = (List<Client>) request.getAttribute("clientList"); %>
        <% for (Client client : clientList) { %>
        <tr>
            <td><%= client.getCode() %>
            </td>
            <td><%= client.getNom() %>
            </td>
            <td><%= client.getPrenom() %>
            </td>
            <td><%= client.getDateDeNaissance() %>
            </td>
            <td><%= client.getTelephone() %>
            </td>
            <td><%= client.getAdresse() %>
            </td>
            <td>
                <a href="/updateclient?code=<%= client.getCode() %>">
                    <button>
                        Update
                    </button>
                </a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
