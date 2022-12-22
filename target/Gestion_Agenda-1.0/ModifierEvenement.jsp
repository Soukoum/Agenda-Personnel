<%-- 
    Document   : ModifierEvenement
    Created on : 9 févr. 2022, 22:18:22
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
        <h1 align="center" style="background-color: #1DDCB6;">Mise à jour évènement</h1>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/agenda";
            Connection connecter = DriverManager.getConnection(url, "root", "root");
            PreparedStatement ps = connecter.prepareStatement("Select * FROM evenement where id=?;");
            int id = Integer.parseInt(request.getParameter("id"));
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
        %>
        <%
            if (rs.next()){
        %>
        <form method="post" action="ModifEvenement">						
            <table align="center">
                <tr>
                    <th><label for="id">ID</label></th>
                    <th><input type="nubmer" name="id" value="<%=rs.getInt(1)%>" class="form-control"></th>
                </tr>
                <tr>
                    <th><label for="nom">Nom</label></th>
                    <th><input type="text" required="required" name="nom" value="<%=rs.getString(11)%>" class="form-control"></th>
                </tr>
                <tr>
                    <th><label for="date_debut"> Date de début</label></th>
                    <th><input class="form-control" required="required" type="Date" value="<%=rs.getString(2)%>" id="dDebut" name="date_debut"/></th>
                </tr>
                <tr>
                    <th><label for="date_fin"> Date de fin</label></th>
                    <th><input class="form-control" required="required" type="Date" value="<%=rs.getString(3)%>" id="dFin" name="date_fin"/></th>
                </tr>
                <tr>
                    <th><label for="heure_debut"> Heure de début </label></th>
                    <th><input class="form-control" required="required" value="<%=rs.getString(4)%>" placeholder ="heure" type="time" min="0" max="23" name="heure_debut"/></th>
                </tr>
                <tr>
                    <th><label for=""heure_fin> Heure de fin</label></th>
                    <th><input class="form-control" required="required" value="<%=rs.getString(5)%>" placeholder ="heure" type="time" min="0" max="23" name="heure_fin"/></th>
                </tr>
                <tr>
                    <th><label for="lieu">Lieu</label></th>
                    <th><input class="form-control" required="required" type="text" value="<%=rs.getString(6)%>" name="lieu"/></th>
                </tr>
                <tr>
                    <th><label for="categorie">Catégorie</label></th>
                    <th><input class="form-control" required="required" type="text" value="<%=rs.getString(7)%>" name="categorie"/></th>
                </tr>
                <tr>
                    <th><label for="priorite" class="form-label">Niveau de priorité</label></th>
                    <th>
                        <input type="range" min="1" max="100" id="priorite" required="required" value="<%=rs.getString(10)%>" name="priorite"/>
                        <script>
                                $(document).ready(function(){
                                $("#priorite").click(function(){
                                        $(".valeur").val($("#priorite").val());
                                        });
                                });
                        </script>
                        <span><input type="number" min="1" max="100" class="valeur"/></span>
                        <script>
                                $(document).ready(function(){
                                $("#priorite").click(function(){
                                $(".valeur").val($("#priorite").val());
                                });
                                });
                        </script></th>
                </tr>
                <tr>
                    <th><label for="participants">Participants</label></th>
                    <th>
                        <textarea class="form-control" required="required" value="<%=rs.getString(8)%>" name="participants" style="height: 100px"></textarea>
                    </th>
                </tr>
                <tr>
                    <th><label for="commentaires">Autres commentaires</label></th>
                    <th>
                        <textarea class="form-control" required="required" value="<%=rs.getString(9)%>" name="commentaires" style="height: 100px"></textarea>
                    </th>
                </tr>
                <tr>
                    <th><input type="submit" value="Enregistrer"/></th>
                </tr>
            </table>
        </form>
        <%
            }
            rs.close();
        %>
        <div class="copy-right">
                    <p style="background-color: #1DDCB6;"><a href="listeEvenement.jsp">Retour</a></p>
        </div>
    </body>
</html>
