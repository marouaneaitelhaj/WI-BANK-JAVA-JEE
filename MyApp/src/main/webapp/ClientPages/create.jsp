<%--
  Created by IntelliJ IDEA.
  User: MAROUANE
  Date: 10/9/2023
  Time: 10:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/Includes/header.jsp" />
<div class="w-screen h-screen flex flex-col  items-center bg-amber-100 justify-around">
    <div class="flex flex-col justify-around  rounded py-10 bg-amber-500 w-1/3	 ">
        <div class="w-full flex justify-around">
            <label for="nom" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Nom</label>
            <input type="text" id="nom" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="John" required>
        </div>
        <div class="w-full flex justify-around">
            <label for="prenom" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Prenom</label>
            <input type="text" id="prenom" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="John" required>
        </div>
        <div class="w-full flex justify-around">
            <label for="dateDeNaissance" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Date De Naissance</label>
            <input type="date" id="dateDeNaissance" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="John" required>
        </div>
        <div class="w-full flex justify-around">
            <label for="telephone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Numero de telephone</label>
            <input type="text" id="telephone" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="John" required>
        </div>
        <div class="w-full flex justify-around">
            <label for="code" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Code</label>
            <input type="text" id="code" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="John" required>
        </div>
        <div class="w-full flex justify-around">
            <label for="adresse" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Adresse</label>
            <input type="text" id="adresse" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="John" required>
        </div>
    </div>
</div>
<jsp:include page="/Includes/footer.jsp" />
</body>
</html>
