<%-- 
    Document   : feedback
    Created on : Oct 13, 2018, 4:57:55 PM
    Author     : Kaivalya
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="fusioncharts.FusionCharts" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Feedback/Suggestions</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="../images/c.png" />
        <script type="text/javascript" src="../fusioncharts/js/fusioncharts.js"></script> 
        <script src="../fusioncharts/js/themes/fusioncharts.theme.fusion.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%!
            Connection con;
            Statement st, st1;

            public void jspInit() {
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultanalysis?autoReconnect=true&useSSL=false", "root", "root");
                    st = con.createStatement();
                    st1 = con.createStatement();

                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        %>
        <%
            try {
                String temp = (String) session.getAttribute("login");
                if (temp.equals("true")) {

                    ResultSet rs = null;
                    rs = st.executeQuery("SELECT AVG(rating) AS avg_rating FROM feedback_details");
                    rs.next();
                    Float rating = rs.getFloat("avg_rating");


        %>

        <div class="container-fluid">
            <h1 class="display-4">&nbsp;&nbsp;Result Analysis System</h1>
        </div>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">

            <a class="navbar-brand p-0" href="../index.jsp">
                <img src="../images/c.png" alt="logo" style="width:45px;">
            </a>

            <ul class="navbar-nav ">
                <li class="nav-item">
                    <a class="nav-link" href="../index.jsp">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../process_pages/logout.jsp">LOG OUT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../about_us.jsp">ABOUT US</a>
                </li>
            </ul>
        </nav>       

        <br><br>

        <div class="container container-fluid">
            <br>
            <center>
                <h2><ins>OUR OVERALL RATINGS</ins></h2>
            </center>
            <center>
                <div id="gauge" class="mx-auto"></div>
            </center>
            <br>
            <%            String jsonData;
                jsonData = "{        \"chart\": {            \"lowerLimit\": \"0\",            \"upperLimit\": \"10\",            \"showValue\": \"1\",            \"numberSuffix\": \" stars\",            \"theme\": \"fusion\",            \"showToolTip\": \"0\"         },        \"colorRange\": {            \"color\": [{                \"minValue\": \"0\",                \"maxValue\": \"3\",                \"code\": \"#F2726F\"            }, {                \"minValue\": \"3\",                \"maxValue\": \"7\",                \"code\": \"#FFC533\"            }, {                \"minValue\": \"7\",                \"maxValue\": \"10\",                \"code\": \"#62B58F\"            }]        },        \"dials\": {            \"dial\": [{                \"value\": \"" + rating + "\"            }]        }    }";

                FusionCharts gauge = new FusionCharts(
                        "angulargauge",
                        "angular_gauge",
                        "500",
                        "300",
                        "gauge",
                        "json",
                        jsonData
                );
            %>

            <%=gauge.render()%>

            <br>
            <center>
                <h2><ins>PLEASE PROVIDE YOUR VALUABLE FEEDBACK</ins></h2>
            </center>
            <br>
            <div class="card w-50 mx-auto shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <form action="../process_pages/feedback.jsp" method="post">

                        <label for="customRange" class="lead">RATE US&nbsp;</label><br>
                        <strong>&nbsp;0</strong>
                        <input type="range" class="custom-range w-75" id="customRange" name="points" required>
                        <strong>&nbsp;10</strong>
                        <br>
                        <br>
                        <br>
                        <label for="comment" class="lead">FEEDBACK/SUGGESTIONS etc</label>
                        <textarea class="form-control" rows="5" name="comment" required></textarea>
                        <button type="submit" class="btn btn-outline-success m-3">SUBMIT</button>

                    </form>
                </div>
            </div>
        </div>
        <br><br>
        <div class="container container-fluid">

            <table class="table table-striped table-hover table-bordered w-75 mx-auto">
                <thead>
                    <tr>
                        <th><center>TOP 10 FEEDBACKS</center></th>
                </tr>
                </thead>
                <tbody>

                    <%
                        rs = st.executeQuery("SELECT * FROM feedback_details order by rating desc LIMIT 10");
                        String comment = new String();
                        while (rs.next()) {
                            comment = rs.getString("comment");

                    %>
                    <tr>
                        <td><%=comment%></td>
                    </tr>
                    <%
                        }
                    %>

                </tbody>
            </table>

        </div>
        <div class="container-fluid">
            <footer class="bg-dark">
                <br>
                <center>
                    <a href="../index.jsp">
                        <img src="../images/c.png" alt="ra" class="mx-auto p-4" width="9%">
                    </a>
                    <p class="lead" style="color:white;"><strong>R E S U L T &nbsp;&nbsp;&nbsp; A N A L Y S I S &nbsp;&nbsp;&nbsp; S Y S T E M</strong></p>
                </center>

                <center>
                    <div class="container">
                        <hr class="bg-white">
                    </div>
                    <a href="https://www.facebook.com/">
                        <img src="../images/fb.png" alt="fb" class="mx-auto p-4" width="7%">
                    </a>
                    <a href="https://plus.google.com/discover">
                        <img src="../images/gp.png" alt="fb" class="mx-auto p-4" width="7%">
                    </a>
                    <a href="https://www.linkedin.com/start/join">
                        <img src="../images/linkedin.png" alt="fb" class="mx-auto p-4" width="7%">
                    </a>
                    <a href="https://twitter.com/login?lang=en">
                        <img src="../images/twitter.png" alt="fb" class="mx-auto p-4" width="7%">
                    </a>

                </center>
                <br>
                <center>
                    <p class="lead" style="color:white;"><strong>&copy;CyberSpartans</strong></p>
                </center>
                <br>
            </footer>
        </div>
        <%                }
            } catch (Exception e) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('SESSION EXPIRED PLEASE LOGIN AGAIN');");
                out.println("location='../login_2.jsp';");
                out.println("</script>");
            }

        %>
    </body>
</html>