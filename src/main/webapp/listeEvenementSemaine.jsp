<%-- 
    Document   : listeEvenementSemaine
    Created on : 19 janv. 2022, 14:20:11
    Author     : ADMIN
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
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
        </style>
        <style>
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
                    <div class="navbar-btn">
                        <div class="container">
                            <div class="card text-center">
                                <div class="card-header">
                                  <ul class="nav nav-tabs card-header-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.jsp" style="background-color: #1DDCB6;">Accueil</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="listeEvenement.jsp" style="background-color: #1DDCB6;">Evènements</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="listeEvenementMois.jsp" style="background-color: #1DDCB6;">Mois</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link active"  style="background-color: #1DDCB6;">Semaine</a>
                                    </li>
                                    <li class="nav-item">
                                      <a class="nav-link" href="listeEvenementJour.jsp" style="background-color: #1DDCB6;">Jour</a>
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
                            <th style="background-color: #1DDCB6;">Evènement</th>
                            <th style="background-color: #1DDCB6;">Nom</th>
                            <th style="background-color: #1DDCB6;">Date</th>
                            <th style="background-color: #1DDCB6;">Heure</th>
                            <th style="background-color: #1DDCB6;">Lieu</th>
                            <th style="background-color: #1DDCB6;">Catégorie</th>
                            <th style="background-color: #1DDCB6;">Participants</th>
                            <th style="background-color: #1DDCB6;">Commentaires</th>
                            <th style="background-color: #1DDCB6;">Priorité</th>
                        </tr>
                        <% 
                            while(rs.next()){
                            Calendar c = Calendar.getInstance();
                            String s1 = rs.getString(2);
                            String s2 = rs.getString(3);
                            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                            
                            Date d1 = df.parse(s1);
                            Date d2 = df.parse(s2);
                            
                            Calendar c1 = Calendar.getInstance();
                            c1.setTime(d1);
                            Calendar c2 = Calendar.getInstance();
                            c2.setTime(d2);
                            if(c1.get(c1.WEEK_OF_MONTH) == c.get(c.WEEK_OF_MONTH)){
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
                            <script>
                                $(document).ready(function(){
                                        $('[data-toggle="tooltip"]').tooltip();
                                });
                            </script>
                        </tr>
                        <%
                            }
                            }
                            rs.close();
                         %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

