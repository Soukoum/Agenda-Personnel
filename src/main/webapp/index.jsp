<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!--
Author: Designmaz
Author URL: https://www.designmaz.net
License URL: https://www.designmaz.net/licence/
-->
<!DOCTYPE html>
<html lang="fr">
    <head>
    <title>Agenda Personnel</title>
    <!--Custom Theme files-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <!--End Calender-->
    <!---Google Analytics Designmaz.net-->
    <style>
        body{
                background-image: url("bootstrap/css/interieur-personnalise-standard-1030x518.jpg");
                background-size: 100%;
            }               
    </style>
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', 'UA-35751449-15', 'auto');ga('send', 'pageview');
            </script>
    </head>
    <body>
	<!--main-->
        <div class="container-fluid text-center">
            <div class="main">	
                <h1>Agenda Personnel</h1>
                <div class="calnder">
                    <div class="column_right_grid calender">
                        <div class="clndr-event">
                                <a href="#small-dialog" class="popup-with-zoom-anim" style="background-color: #1DDCB6;">Ajouter un Evènement</a>
                        </div>
                        <% if (request.getAttribute("msg")!=null){ %>
                        <h3><%=request.getAttribute("msg")%></h3>
                        <% } %>
                        <!-- pop-up-box -->
                        <script type="text/javascript" src="bootstrap/js/modernizr.custom.min.js"></script>    
                        <link href="bootstrap/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
                        <script src="bootstrap/js/jquery.magnific-popup.js" type="text/javascript"></script>
                        <!-- //pop-up-box -->
                        <div id="small-dialog" class="mfp-hide">
                                <div class="event-text">
                                    <form method="post" action="ServletEvenement">						
                                        <table align="center">
                                            <tr>
                                                <th><label for="nom">Nom</label></th>
                                                <th><input type="text" required="required" name="nom" class="form-control"></th>
                                            </tr>
                                            <tr>
                                                <th><label for="date_debut"> Date de début</label></th>
                                                <th><input class="form-control" required="required" type="Date" id="dDebut" name="date_debut"/></th>
                                            </tr>
                                            <tr>
                                                <th><label for="date_fin"> Date de fin</label></th>
                                                <th><input class="form-control" required="required" type="Date" id="dFin" name="date_fin"/></th>
                                            </tr>
                                            <tr>
                                                <th><label for="heure_debut"> Heure de début </label></th>
                                                <th><input class="form-control" required="required" placeholder ="heure" type="time" min="0" max="23" name="heure_debut"/></th>
                                            </tr>
                                            <tr>
                                                <th><label for=""heure_fin> Heure de fin</label></th>
                                                <th><input class="form-control" required="required" placeholder ="heure" type="time" min="0" max="23" name="heure_fin"/></th>
                                            </tr>
                                            <tr>
                                                <th><label for="lieu">Lieu</label></th>
                                                <th><input class="form-control" required="required" type="text" name="lieu"/></th>
                                            </tr>
                                            <tr>
                                                <th><label for="categorie">Catégorie</label></th>
                                                <th><input class="form-control" required="required" type="text" name="categorie"/></th>
                                            </tr>
                                            <tr>
                                                <th><label for="priorite" class="form-label">Niveau de priorité</label></th>
                                                <th>
                                                    <input type="range" min="1" max="100" id="priorite" required="required" name="priorite"/>
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
                                                    <textarea class="form-control" required="required" name="participants" style="height: 100px"></textarea>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th><label for="commentaires">Autres commentaires</label></th>
                                                <th>
                                                    <textarea class="form-control" required="required" name="commentaires" style="height: 100px"></textarea>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th><input type="submit" value="Enregistrer"/></th>
                                            </tr>
                                        </table>
                                    </form>
                                   
                                </div>
                        </div>
                        <script>
                                $(document).ready(function() {
                                $('.popup-with-zoom-anim').magnificPopup({
                                        type: 'inline',
                                        fixedContentPos: false,
                                        fixedBgPos: true,
                                        overflowY: 'auto',
                                        closeBtnInside: true,
                                        preloader: false,
                                        midClick: true,
                                        removalDelay: 300,
                                        mainClass: 'my-mfp-zoom-in'
                                });
                                 
                                             
                                                    if($("#dDebut").getYear() < getYear()){
                                                        $("#dDebut").next("error").show().text("Saisissez une date valide");
                                                    }
                                            
                                          
                                });
                        </script>	
                        <div class="cal1">
                              <div class="clndr">
                                <div class="clndr-controls">
                                    <div class="clndr-control-button">
                                        <p class="clndr-previous-button">previous</p>
                                    </div>
                                    <div class="month">SEPTEMBER 2015</div>
                                    <div class="clndr-control-button rightalign">
                                        <p class="clndr-next-button">next</p>
                                    </div>
                                </div>
                                <table class="clndr-table">
                                    <thead>
                                        <tr class="header-days">
                                            <td class="header-day">SUN</td>
                                            <td class="header-day">MON</td>
                                            <td class="header-day">TUE</td>
                                            <td class="header-day">WED</td>
                                            <td class="header-day">THU</td>
                                            <td class="header-day">FRI</td>
                                            <td class="header-day">SAT</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="day past adjacent-month last-month calendar-day-2015-04-26"><div class="day-contents">26</div></td>
                                            <td class="day past adjacent-month last-month calendar-day-2015-04-27"><div class="day-contents">27</div></td>
                                            <td class="day past adjacent-month last-month calendar-day-2015-04-28"><div class="day-contents">28</div></td>
                                            <td class="day past adjacent-month last-month calendar-day-2015-04-29"><div class="day-contents">29</div></td>
                                            <td class="day past adjacent-month last-month calendar-day-2015-04-30"><div class="day-contents">30</div></td>
                                            <td class="day past calendar-day-2015-05-01"><div class="day-contents">1</div></td>
                                            <td class="day past calendar-day-2015-05-02"><div class="day-contents">2</div></td>
                                        </tr>
                                        <tr>
                                            <td class="day past calendar-day-2015-05-03"><div class="day-contents">3</div></td>
                                            <td class="day past calendar-day-2015-05-04"><div class="day-contents">4</div></td>
                                            <td class="day past calendar-day-2015-05-05"><div class="day-contents">5</div></td>
                                            <td class="day past calendar-day-2015-05-06"><div class="day-contents">6</div></td>
                                            <td class="day past calendar-day-2015-05-07"><div class="day-contents">7</div></td>
                                            <td class="day past calendar-day-2015-05-08"><div class="day-contents">8</div></td>
                                            <td class="day past calendar-day-2015-05-09"><div class="day-contents">9</div></td>
                                        </tr>
                                        <tr>
                                            <td class="day past event calendar-day-2015-05-10"><div class="day-contents">10</div></td>
                                            <td class="day past event calendar-day-2015-05-11"><div class="day-contents">11</div></td>
                                            <td class="day past event calendar-day-2015-05-12"><div class="day-contents">12</div></td>
                                            <td class="day past event calendar-day-2015-05-13"><div class="day-contents">13</div></td>
                                            <td class="day today event calendar-day-2015-05-14"><div class="day-contents">14</div></td>
                                            <td class="day calendar-day-2015-05-15"><div class="day-contents">15</div></td>
                                            <td class="day calendar-day-2015-05-16"><div class="day-contents">16</div></td>
                                        </tr>
                                        <tr>
                                            <td class="day calendar-day-2015-05-17"><div class="day-contents">17</div></td>
                                            <td class="day calendar-day-2015-05-18"><div class="day-contents">18</div></td>
                                            <td class="day calendar-day-2015-05-19"><div class="day-contents">19</div></td>
                                            <td class="day calendar-day-2015-05-20"><div class="day-contents">20</div></td>
                                            <td class="day event calendar-day-2015-05-21"><div class="day-contents">21</div></td>
                                            <td class="day event calendar-day-2015-05-22"><div class="day-contents">22</div></td>
                                            <td class="day event calendar-day-2015-05-23"><div class="day-contents">23</div></td>
                                        </tr>
                                        <tr>
                                            <td class="day calendar-day-2015-05-24"><div class="day-contents">24</div></td>
                                            <td class="day calendar-day-2015-05-25"><div class="day-contents">25</div></td>
                                            <td class="day calendar-day-2015-05-26"><div class="day-contents">26</div></td>
                                            <td class="day calendar-day-2015-05-27"><div class="day-contents">27</div></td>
                                            <td class="day calendar-day-2015-05-28"><div class="day-contents">28</div></td>
                                            <td class="day calendar-day-2015-05-29"><div class="day-contents">29</div></td>
                                            <td class="day calendar-day-2015-05-30"><div class="day-contents">30</div></td>
                                        </tr>
                                        <tr>
                                            <td class="day calendar-day-2015-05-31"><div class="day-contents">31</div></td>
                                            <td class="day adjacent-month next-month calendar-day-2015-06-01"><div class="day-contents">1</div></td>
                                            <td class="day adjacent-month next-month calendar-day-2015-06-02"><div class="day-contents">2</div></td>
                                            <td class="day adjacent-month next-month calendar-day-2015-06-03"><div class="day-contents">3</div></td>
                                            <td class="day adjacent-month next-month calendar-day-2015-06-04"><div class="day-contents">4</div></td>
                                            <td class="day adjacent-month next-month calendar-day-2015-06-05"><div class="day-contents">5</div></td>
                                            <td class="day adjacent-month next-month calendar-day-2015-06-06"><div class="day-contents">6</div></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="copy-right">
                    <p style="background-color: #1DDCB6;"><a href="listeEvenement.jsp">Voir Liste des Evènements</a></p>
            </div>
            <div class="container-fluid">
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
                            <h3>Evènements prioritaires</h3>
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
                                </tr>
                                <% 
                                    while(rs.next()){
                                 %>
                            </thead>
                            <%
                                if (rs.getInt(10)>=50){
                            %>
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
            </div>
	<!--//main-->
        </div>
    </body>
</html>