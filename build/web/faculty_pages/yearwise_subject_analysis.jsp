<%-- 
    Document   : yearwise_subject_analysis
    Created on : Oct 8, 2018, 2:52:41 PM
    Author     : Kaivalya
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="fusioncharts.FusionCharts" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" " http://www.w3.org/TR/html4/loose.dtd" >


<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="../images/c.png" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <!----------------chart script------------------->
        <script type="text/javascript" src="../fusioncharts/js/fusioncharts.js"></script> 
        <script src="../fusioncharts/js/themes/fusioncharts.theme.fusion.js"></script>

        <title>Yearwise Subject Analysis</title>
    </head>
    <body>
        <%!
            Connection con;
            Statement st, st1, st2;

            public void jspInit() {
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultanalysis?autoReconnect=true&useSSL=false", "root", "root");
                    st = con.createStatement();
                    st1 = con.createStatement();
                    st2 = con.createStatement();

                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        %>
        <%
            try {
                String temp = (String) session.getAttribute("login");
                if (temp.equals("true")) {
                    String users_id = (String) session.getAttribute("users_id");
                    ResultSet rs = st.executeQuery("SELECT * FROM resultanalysis.faculty_details WHERE eid='" + users_id + "'");
                    rs.next();
                    String name = rs.getString("name");
                    String eid = rs.getString("eid");
                    Integer cg_id = rs.getInt("college_details_id");
                    Integer br_id = rs.getInt("branch_details_code");
                    ResultSet rs1 = st.executeQuery("SELECT * FROM resultanalysis.branch_details where code='" + br_id + "'");
                    rs1.next();
                    String br_nm = rs1.getString("name");
                    ResultSet rs2 = st.executeQuery("SELECT * FROM resultanalysis.college_details where id='" + cg_id + "'");
                    rs2.next();
                    String cg_nm = rs2.getString("name");
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
                <a class="nav-link" href="../faculty_pages/faculty_dashboard.jsp">HOME</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../process_pages/logout.jsp">LOG OUT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../about_us.jsp">ABOUT US</a>
            </li>
        </ul>
    </nav>
    <hr>
    <div class="container">
        <p class="lead"><strong>ID: </strong><%=eid%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>NAME: </strong><%=name%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>BRANCH NAME: </strong><%=br_nm%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            <strong>COLLEGE NAME: </strong><%=cg_nm%>
        </p>
    </div>
    <hr>
    <br>

    <%

        String br = request.getParameter("code");
        String a = new String();
        ResultSet r2 = st.executeQuery("SELECT DISTINCT(year_attempting) AS year,COUNT(DISTINCT(year_attempting)) AS cnt  FROM result_main  WHERE subject_marks_details_subject_code="+br+" ");
        r2.next();
        ResultSet r3 = null;
        String yr = new String();
        int cnt = Integer.parseInt(r2.getString("cnt"));
        String year[];
        year = new String[cnt];
        Integer cnt1[];
        cnt1 = new Integer[cnt];
        for (int i = 0; i < cnt; i++) {
            year[i] = r2.getString("year");
            yr = year[i];
            r3 = st2.executeQuery("SELECT COUNT(*) AS cnt1 FROM result_main WHERE subject_marks_details_subject_code='" + br + "' AND year_attempting='" + yr + "' AND status='P'");
            while (r3.next()) {
                cnt1[i] = r3.getInt("cnt1");
            }
        }
    %>
    <br>
    <center>
        <h2><ins>PASSED STUDENTS COUNT YEARWISE(CGPA)</ins></h2>
    </center>
    <br>
    <div id="chart" class="mx-auto d-block shadow-lg p-4 mb-4 bg-white w-50">
        <%
            // store chart config name-config value pair
            Map<String, String> chartConfig = new HashMap<String, String>();
            chartConfig.put("caption", "SUBJECT ANALYSIS");
            chartConfig.put("subCaption", "Passed student count Yearwise");
            chartConfig.put("xAxisName", "YEAR");
            chartConfig.put("yAxisName", "NUMBER OF STUDENTS PASSED");
            chartConfig.put("numberSuffix", "");
            chartConfig.put("theme", "fusion");
            chartConfig.put("exportEnabled", "1");

            //store label-value pair
            Map<String, Integer> dataValuePair = new HashMap<String, Integer>();

            for (int k = 0; k < cnt; k++) {
                dataValuePair.put(year[k], cnt1[k]);
            }

            StringBuilder jsonData = new StringBuilder();
            StringBuilder data = new StringBuilder();

            // json data to use as chart data source
            jsonData.append("{'chart':{");
            for (Map.Entry conf : chartConfig.entrySet()) {
                jsonData.append("'" + conf.getKey() + "':'" + conf.getValue() + "',");
            }

            jsonData.replace(jsonData.length() - 1, jsonData.length(), "},");

            // build  data object from label-value pair
            data.append("'data':[");

            for (Map.Entry pair : dataValuePair.entrySet()) {
                data.append("{'label':'" + pair.getKey() + "','value':'" + pair.getValue() + "'},");
            }
            data.replace(data.length() - 1, data.length(), "]");

            jsonData.append(data.toString());
            jsonData.append("}");

            // Create chart instance
            // charttype, chartID, width, height,containerid, data format, data
            FusionCharts firstChart = new FusionCharts(
                    "column3d",
                    "first_chart",
                    "650",
                    "500",
                    "chart",
                    "json",
                    jsonData.toString()
            );
        %>

        <%= firstChart.render()%>
        <br><br>
    </div>
    <br><br>
    <div class="container w-50">

        <br>
        <center>
            <h2><ins>STATISTICS OF PASSED STUDENTS COUNT YEARWISE(CGPA)</ins></h2>
        </center>
        <br>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>YEAR</th>
                    <th>NO. OF STUDENTS PASS</th>

                </tr>
            </thead>
            <tbody>

                <%  for (int k = 0; k < cnt; k++) {
                %>
                <tr>    
                    <td><%=year[k]%></td>
                    <td><%=cnt1[k]%></td>
                </tr>
                <%}%>


            </tbody>
        </table>
    </div>>
    <br>

    <br>
    <br>
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
    <%

            }
        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('SESSION EXPIRED PLEASE LOGIN AGAIN');");
            out.println("location='../login_1.jsp';");
            out.println("</script>");
        }
    %>
</body>
</html>