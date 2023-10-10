<%@ page import="java.util.List" %>
<%@ page import="com.example.myapp.Entities.Client" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/Includes/header.jsp"/>
<div class="w-screen flex flex-col items-center">
    <form method="post" action="/clientlist" class="mt-12 w-full flex justify-center">
        <input type="text" id="atr" name="atr"
                                     class="bg-gray-50 border border-gray-300 ml-5 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                                     placeholder="marouane ait elhaj" required>
        <button class="btn px-6 py-1 rounded bg-yellow-400 hover:bg-amber-300 border-2 border-white" type="submit">Search</button>
    </form>
    <table class="table-fixed w-11/12 my-12">
        <thead class="">
        <tr class="h-12">
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
        <tr class="h-12">
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
                <a href="/updateclient?code=<%= client.getCode() %>" class="">
                    <button class="btn px-6 py-1 rounded bg-yellow-400 hover:bg-amber-300 border-2 border-white">
                        Update
                    </button>
                </a>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>
<jsp:include page="/Includes/footer.jsp"/>
</body>
</html>
