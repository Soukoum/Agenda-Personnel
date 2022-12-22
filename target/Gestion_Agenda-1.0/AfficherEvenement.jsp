<%-- 
    Document   : AfficherEvenement
    Created on : 10 févr. 2022, 13:29:50
    Author     : ADMIN
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Custom Theme files-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="applijewelleryion/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Custom Theme files -->
    <script async src="//www.google-analytics.com/analytics.js"></script>
    <link href="bootstrap/css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--web-fonts-->
    <link href='//fonts.googleapis.com/css?family=Romanesco' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Roboto:400,500,100,100italic,300,300italic,500italic,700,700italic,900,900italic,400italic' rel='stylesheet' type='text/css'>
    <!--//web-fonts-->
    <!--Calender-->
    <script src="bootstrap/js/jquery-1.11.1.min.js"></script>
    <link rel="stylesheet" href="bootstrap/css/clndr.css" type="text/css" />
    <script src="bootstrap/js/underscore-min.js"></script>
    <script src="bootstrap/js/moment-2.2.1.js"></script>
    <script src="bootstrap/js/clndr.js"></script>
    <script src="bootstrap/js/site.js"></script>
    <script src="jquery-1.11.3.min/js"></script>
        <title>JSP Page</title>
        <style>
        body{
                background-image: url("bootstrap/css/interieur-personnalise-standard-1030x518.jpg");
                background-size: 100%;
            }               
    </style>
    </head>
    <body>
        <h1 align="center" style="background-color: #1DDCB6;">Evènement</h1>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/agenda";
            Connection connecter = DriverManager.getConnection(url, "root", "root");
            Statement ps = connecter.createStatement();
            ResultSet rs = ps.executeQuery("Select * FROM evenement;");
        %>
        <%
            if(rs.next()){
        %>
        <div class="container-fluid">
            <fieldset >						
                <table align="center">
                    <tr>
                        <th><label for="id">Numéro</label></th>
                        <th><p style="background-color: #1DDCB6;"><%=rs.getInt(1)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="nom">Nom</label></th>
                         <th><p style="background-color: #1DDCB6;"><%=rs.getString(11)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="date_debut"> Date de début</label></th>
                        <th><p style="background-color: #1DDCB6;"><%=rs.getDate(2)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="date_fin"> Date de fin</label></th>
                        <th><p style="background-color: #1DDCB6;"><%=rs.getDate(3)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="heure_debut"> Heure de début </label></th>
                        <th><p style="background-color: #1DDCB6;"><%=rs.getTime(4)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="heure_fin"> Heure de fin</label></th>
                        <th><p style="background-color: #1DDCB6;"><%=rs.getTime(5)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="lieu">Lieu</label></th>
                        <th><p style="background-color: #1DDCB6;"><%=rs.getString(6)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="categorie">Catégorie</label></th>
                        <th><p style="background-color: #1DDCB6;"><%=rs.getString(7)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="priorite">Niveau de priorité</label></th>
                        <th><p style="background-color: #1DDCB6;"><%=rs.getString(10)%></p></th>
                    </tr>
                    <tr>
                        <th><label for="participants">Participants</label></th>
                        <th>
                            <p style="background-color: #1DDCB6;"><%=rs.getString(8)%></textarea>
                        </th>
                    </tr>
                    <tr>
                        <th><label for="commentaires">Autres commentaires</label></th>
                        <th>
                            <p style="background-color: #1DDCB6;"><%=rs.getString(9)%></textarea>
                        </th>
                    </tr>
                </table>
            </fieldset>
        </div>
        <%
            }
            rs.close();
        %>
        <div class="copy-right">
                    <p style="background-color: #1DDCB6;"><a href="listeEvenement.jsp">Retour</a></p>
        </div>
    </body>
</html>

