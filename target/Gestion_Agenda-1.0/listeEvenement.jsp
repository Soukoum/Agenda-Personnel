<%-- 
    Document   : listeEvenement
    Created on : 14 janv. 2022, 05:59:52
    Author     : ADMIN
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.miage.beans.evenementBean"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="bootstrap/js/bootstrap.min.js"/>
        <!-- Slick -->
	<link type="text/css" rel="stylesheet" href="bootstrap/css/slick.css"/>
	<link type="text/css" rel="stylesheet" href="bootstrap/css/slick-theme.css"/>

		<!-- nouislider -->
	<link type="text/css" rel="stylesheet" href="bootstrap/css/nouislider.min.css"/>
        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="bootstrap/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="bootstrap/css/style.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="bootstrap/jquery-1.11.3.min.js"></script>
        <title>JSP Page</title>
        <style>
            body{
                  background-image: url("bootstrap/css/interieur-personnalise-standard-1030x518.jpg");
                  background-size: 100%;
                }
            table.table td a 
            {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
             }
            table.table td a.view 
            {
                color: #03A9F4;
            }
            table.table td a.edit 
            {
                color: #FFC107;
            }
            table.table td a.delete 
            {
                color: #E34724;
            }
            table.table td i 
            {
                font-size: 19px;
            }  
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="table-title">
                <div class="row">
                    <div class="col-3">
                        <h1 align="center" style="background-color: #1DDCB6;">Vos Evénements</h1>
                    </div>
                    <% if (request.getAttribute("msg")!=null){ %>
                        <h3><%=request.getAttribute("msg")%></h3>
                    <% } %>
                    <div class="navbar-btn">
                        <div class="container">
                            <div class="card text-center">
                                <div class="card-header">
                                  <ul class="nav nav-tabs card-header-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.jsp" style="background-color: #1DDCB6;">Accueil</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link active" style="background-color: #1DDCB6;">Evènements</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="listeEvenementMois.jsp" style="background-color: #1DDCB6;">Mois</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="listeEvenementSemaine.jsp" style="background-color: #1DDCB6;">Semaine</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link " href="listeEvenementJour.jsp" style="background-color: #1DDCB6;">Jour</a>
                                    </li>
                                    <li class="nav-item">
                                        <form method="post" action="listeEvenement.jsp">
                                            <input type="text" class="nav-link" required="required" name="nom"/> 
                                            <input type="submit" class="nav-link" value="Recherche un évènement" style="background-color: #1DDCB6;"/>
                                        </form>
                                        <%
                                            String nom = request.getParameter("nom");
                                            String requete = "Select * From evenement;";
                                            Class.forName("com.mysql.cj.jdbc.Driver");
                                            String url1 = "jdbc:mysql://localhost:3306/agenda";
                                            Connection connecter1 = DriverManager.getConnection(url1, "root", "root");
                                            Statement st = connecter1.createStatement();
                                            ResultSet rs1 = st.executeQuery(requete);
                                        %>
                                        <fieldset >	
                                            <%
                                                while(rs1.next()){
                                            %>
                                            <table align="center">
                                                <%
                                                    if (rs1.getString(11).equals(nom)){
                                                %>
                                                <tr>
                                                    <th><label for="id">Numéro</label></th>
                                                    <th><p style="background-color: #1DDCB6;"><%=rs1.getInt(1)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="nom">Nom</label></th>
                                                     <th><p style="background-color: #1DDCB6;"><%=rs1.getString(11)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="date_debut"> Date de début</label></th>
                                                    <th><p style="background-color: #1DDCB6;"><%=rs1.getDate(2)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="date_fin"> Date de fin</label></th>
                                                    <th><p style="background-color: #1DDCB6;"><%=rs1.getDate(3)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="heure_debut"> Heure de début </label></th>
                                                    <th><p style="background-color: #1DDCB6;"><%=rs1.getTime(4)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="heure_fin"> Heure de fin</label></th>
                                                    <th><p style="background-color: #1DDCB6;"><%=rs1.getTime(5)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="lieu">Lieu</label></th>
                                                    <th><p style="background-color: #1DDCB6;"><%=rs1.getString(6)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="categorie">Catégorie</label></th>
                                                    <th><p style="background-color: #1DDCB6;"><%=rs1.getString(7)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="priorite">Niveau de priorité</label></th>
                                                    <th><p style="background-color: #1DDCB6;"><%=rs1.getString(10)%></p></th>
                                                </tr>
                                                <tr>
                                                    <th><label for="participants">Participants</label></th>
                                                    <th>
                                                        <p style="background-color: #1DDCB6;"><%=rs1.getString(8)%></textarea>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th><label for="commentaires">Autres commentaires</label></th>
                                                    <th>
                                                        <p style="background-color: #1DDCB6;"><%=rs1.getString(9)%></textarea>
                                                    </th>
                                                </tr>
                                                <%
                                                    } 
                                                    else {
                                                %>
                                                <tr>
                                                    <th>0 Evènement recherché</th>
                                                </tr>
                                                <%
                                                    }
                                                %>
                                            </table>
                                            <%
                                            }
                                            rs1.close();
                                            %>
                                        </fieldset>
                                    </li>
                                  </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/agenda";
            Connection connecter = DriverManager.getConnection(url, "root", "root");
            Statement stmt = connecter.createStatement();
            ResultSet rs = stmt.executeQuery("Select * FROM evenement;");
         %>
        <div class="container-fluid">
            <div class="content">
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                        <tr>
                            <th style="background-color: #1DDCB6;">Evènement</i></th>
                            <th style="background-color: #1DDCB6;">Nom</i></th>
                            <th style="background-color: #1DDCB6;">Date</th>
                            <th style="background-color: #1DDCB6;">Heure</i></th>
                            <th style="background-color: #1DDCB6;">Lieu</th>
                            <th style="background-color: #1DDCB6;">Catégorie</th>
                            <th style="background-color: #1DDCB6;">Participants</th>
                            <th style="background-color: #1DDCB6;">Commentaires</th>
                            <th style="background-color: #1DDCB6;">Priorité</th>
                            <th style="background-color: #1DDCB6;">Actions</th>
                        </tr>
                        <% 
                            while(rs.next()){
                         %>
                    </thead>
                    <tbody class="result"> 
                        <tr>
                            <td><%=rs.getInt(1)%></td>
                            <td><%=rs.getString(11)%></td>
                            <td><%=rs.getDate(2)%> - <%=rs.getDate(3)%></td>
                            <td><%=rs.getTime(4)%> - <%=rs.getTime(5)%></td>
                            <td><%=rs.getString(6)%></td>
                            <td><%=rs.getString(7)%></td>
                            <td><%=rs.getString(8)%></td>
                            <td><%=rs.getString(9)%></td>
                            <td><%=rs.getInt(10)%></td>
                            <td>
                                <a href="AfficherEvenement.jsp?id=<%=rs.getString(1)%>" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                                <a href="ModifierEvenement.jsp?id=<%=rs.getString(1)%>" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                <a href="SupprimerEvenement?id=<%=rs.getString(1)%>" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                            <script>
                                $(document).ready(function(){
                                        $('[data-toggle="tooltip"]').tooltip();
                                });
                            </script>
                        </tr>
                        <%
                            }
                            rs.close();
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
