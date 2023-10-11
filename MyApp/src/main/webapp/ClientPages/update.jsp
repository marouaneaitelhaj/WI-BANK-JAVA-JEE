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
    <link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
<% Client client = (Client) request.getAttribute("client"); %>
<form class="countiner" action="/updateclient?code=<%= client.getCode() %>" method="post">
    <div class="mini-countiner" style="position: relative">
        <a href="./clientlist"><span style="position: absolute;top: 20px;left: 20px;color: var(--bgk);"><-Back</span></a>
        <div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="nom">Nom :</label>
                <input class="inputOfCreateUpdate" value="<%= client.getNom() %>" type="text" id="nom" name="nom"
                       placeholder="Montana" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="prenom">Prenom
                    :</label>
                <input class="inputOfCreateUpdate" value="<%= client.getPrenom() %>" type="text" id="prenom" name="prenom"

                       placeholder="Max b" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="dateDeNaissance">Date
                    De
                    Naissance :</label>
                <input class="inputOfCreateUpdate" value="<%= client.getDateDeNaissance() %>" type="date" id="dateDeNaissance"
                       name="dateDeNaissance"

                       placeholder="John" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="telephone">Numero
                    de
                    Telephone :</label>
                <input class="inputOfCreateUpdate" value="<%= client.getTelephone() %>" type="text" id="telephone" name="telephone"

                       placeholder="+2126485533" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="adresse">Adresse
                    :</label>
                <input type="text" id="adresse" name="adresse" value="<%= client.getAdresse() %>"

                       placeholder="Attaouia , Zitouna, 181" required>
            </div>
            <div style="display: flex;justify-content: center;width: 100%">
                <button type="submit">
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

</body>
</html>
