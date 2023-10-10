<%@ page import="java.util.List" %>
<%@ page import="com.example.myapp.Entities.Client" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/Includes/header.jsp"/>
<table class="table-fixed  w-screen min-h-screen">
    <thead>
    <tr>
        <th class="text-left">Code</th>
        <th class="text-left">Nom</th>
        <th class="text-left">Prenom</th>
        <th class="text-left">Date De Naissance</th>
        <th class="text-left">Telephone</th>
        <th class="text-left">Adresse</th>
        <th class="text-left">Action</th>
    </tr>
    </thead>
    <tbody>
    <% List<Client> clientList = (List<Client>) request.getAttribute("clientList"); %>
    <% for (Client client : clientList) { %>
    <tr class="h-16">
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
            <button class="btn btn-yellow">
                Update
            </button>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<jsp:include page="/Includes/footer.jsp"/>
</body>
</html>
