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
    <link href="../style.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="/addclient" class="countiner" method="post">
    <div class="mini-countiner" style="position: relative">
        <a href="./"><span style="position: absolute;top: 20px;left: 20px;color: var(--bgk);"><-Back</span></a>
        <div style="position: absolute">
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="nom">Nom :</label>
                <input type="text" id="nom" name="nom"

                       placeholder="Montana" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="prenom">Prenom
                    :</label>
                <input type="text" id="prenom" name="prenom"

                       placeholder="Max b" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="dateDeNaissance">Date
                    De
                    Naissance :</label>
                <input type="date" id="dateDeNaissance" name="dateDeNaissance"

                       placeholder="John" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="telephone">Numero
                    de
                    Telephone :</label>
                <input type="text" id="telephone" name="telephone"

                       placeholder="+2126485533" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="code">Code
                    :</label>
                <input type="text" id="code" name="code"

                       placeholder="CXW765KJH789" required>
            </div>
            <div style="display: flex; margin-top: 1rem;margin-bottom: 1rem;align-items: center">
                <label for="adresse">Adresse
                    :</label>
                <input type="text" id="adresse" name="adresse"

                       placeholder="Attaouia , Zitouna, 181" required>
            </div>
            <div style="display: flex;justify-content: center;width: 100%">
                <button type="submit">
                    Create
                </button>
            </div>
        </div>
    </div>
</form>
<%
    Boolean created = (Boolean) request.getAttribute("created");
%>

<% if (created != null && created) { %>
<script>
    Swal.fire({
        title: 'Created!',
        text: 'Client Created.....',
        icon: 'success',
        confirmButtonText: 'OK'
    });
</script>
<% } %>
<% Boolean alert = (Boolean) request.getAttribute("alert");
    if (alert != null && alert) { %>
<script>
    Swal.fire({
        title: 'Fill all!',
        text: 'Please fill all inputs',
        icon: 'success',
        confirmButtonText: 'OK'
    });
</script>
<% } %>

</body>
</html>