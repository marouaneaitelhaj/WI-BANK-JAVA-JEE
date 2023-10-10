<%@ page import="com.example.myapp.Entities.Person" %>
<%@ page import="com.example.myapp.Entities.Client" %><%--
  Created by IntelliJ IDEA.
  User: MAROUANE
  Date: 10/9/2023
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<jsp:include page="/Includes/header.jsp"/>
<% Client client = (Client) request.getAttribute("client"); %>
<form action="/updateclient?code=<%= client.getCode() %>" method="post">
    <div class="w-screen h-screen flex flex-col  items-center bg-amber-100 justify-around">
        <div class="flex flex-col justify-around  rounded py-10 bg-amber-500 w-1/3	 ">
            <div class="flex items-center w-full  mb-5 px-5">
                <label for="nom" class="block mb-2 text-sm font-medium w-40 text-gray-900 dark:text-white">Nom :</label>
                <input value="<%= client.getNom() %>" type="text" id="nom" name="nom"
                       class="bg-gray-50 border border-gray-300 ml-5 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="Montana" required>
            </div>
            <div class="flex items-center w-full  mb-5 px-5">
                <label for="prenom" class="block mb-2 text-sm font-medium w-40 text-gray-900 dark:text-white">Prenom
                    :</label>
                <input value="<%= client.getPrenom() %>" type="text" id="prenom" name="prenom"
                       class="bg-gray-50 border border-gray-300 ml-5 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="Max b" required>
            </div>
            <div class="flex items-center w-full  mb-5 px-5">
                <label for="dateDeNaissance" class="block mb-2 text-sm font-medium w-40 text-gray-900 dark:text-white">Date
                    De
                    Naissance :</label>
                <input value="<%= client.getDateDeNaissance() %>" type="date" id="dateDeNaissance" name="dateDeNaissance"
                       class="bg-gray-50 border border-gray-300 ml-5 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="John" required>
            </div>
            <div class="flex items-center w-full  mb-5 px-5">
                <label for="telephone" class="block mb-2 text-sm font-medium w-40 text-gray-900 dark:text-white">Numero
                    de
                    Telephone :</label>
                <input value="<%= client.getTelephone() %>" type="text" id="telephone" name="telephone"
                       class="bg-gray-50 border border-gray-300 ml-5 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="+2126485533" required>
            </div>
            <div class="flex items-center w-full  mb-5 px-5">
                <label for="adresse" class="block mb-2 text-sm font-medium w-40 text-gray-900 dark:text-white">Adresse
                    :</label>
                <input type="text" id="adresse" name="adresse" value="<%= client.getAdresse() %>"
                       class="bg-gray-50 border border-gray-300 ml-5 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-1/2 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
                       placeholder="Attaouia , Zitouna, 181" required>
            </div>
            <div class="flex items-center w-full justify-center    mb-5 px-5">
                <button class="bg-white py-1 px-10 w-48 rounded" type="submit">
                    Update
                </button>
            </div>
        </div>
    </div>
</form>
<%
    Boolean updated = (Boolean) request.getAttribute("updated");
%>

<% if (updated != null && updated) { %>
<script>
    Swal.fire({
        title: 'Hello!',
        text: 'Client Updated.....',
        icon: 'success',
        confirmButtonText: 'OK'
    });
</script>
<% } %>

<jsp:include page="/Includes/footer.jsp"/>
</body>
</html>
