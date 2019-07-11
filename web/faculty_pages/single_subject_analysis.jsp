<%-- 
    Document   : single_subject_analysis
    Created on : Oct 7, 2018, 10:01:02 PM
    Author     : pRaTiK
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

        <title>Single Subject Analysis</title>
    </head>
    <body>
        <%!
            Connection con;
            Statement st, st1, st2, st3;

            public void jspInit() {
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultanalysis?autoReconnect=true&useSSL=false", "root", "root");
                    st = con.createStatement();
                    st1 = con.createStatement();
                    st2 = con.createStatement();
                    st3 = con.createStatement();
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

        String year = request.getParameter("year");
        String branch = request.getParameter("branch");
        int scode = Integer.parseInt(request.getParameter("code"));
        String a = new String();
        int br = Integer.parseInt(branch);
        String b = new String();
        ResultSet r3 = st.executeQuery("SELECT * FROM resultanalysis.branch_details");

        while (r3.next()) {
            if (br == r3.getInt("code")) {
                b = r3.getString("name");
            }
        }
        ResultSet r2 = st.executeQuery("SELECT * FROM resultanalysis.subject_marks_details");

        while (r2.next()) {
            if (scode == r2.getInt("subject_code")) {
                a = r2.getString("subject_name");
            }
        }

    %>
    <div class="container mx-auto d-block w-50">
        <p class="lead ">
            <strong>YEAR: </strong><%=year%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>BRANCH: </strong><%=b%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>SUBJECT NAME: </strong><%=a%>
        </p>
    </div>
    <br>
    <center>
        <h2><ins>SUBJECT ANALYSIS FOR YEAR <%=year%> BASED ON MARKS</ins></h2>
    </center>
    <br>
    <div id="chart" class="mx-auto d-block shadow-lg p-4 mb-4 bg-white w-50">
        <%
            ResultSet r4 = null;

            r4 = st1.executeQuery("select count(*) as c FROM resultanalysis.result_log where subject_marks_details_subject_code='" + scode + "' and year_attempting='" + year + "' and student_details_branch_details_code='" + br + "'");
            r4.next();
            int c = r4.getInt("c");
            out.println(c);
            ResultSet r6 = st1.executeQuery("select result_marks_id, student_details_prn FROM resultanalysis.result_log where subject_marks_details_subject_code='" + scode + "' and year_attempting='" + year + "' and student_details_branch_details_code='" + br + "'");

            Integer cnt[];
            cnt = new Integer[c + 1];
            Integer prn[];
            prn = new Integer[c + 1];
            String nm[];
            nm = new String[c + 1];
            int i = 0, j = 0;

            ResultSet r5 = null;

            while (r6.next()) {

                r5 = st.executeQuery("SELECT * FROM resultanalysis.result_marks where id='" + r6.getInt("result_marks_id") + "' ORDER BY th_total");
                r5.next();
                cnt[i++] = r5.getInt("th_total");
            }

            int bforty = 0, fourtosix = 0, sixtoeight = 0, aeighty = 0;
            for (int k = 0; k < i; k++) {
                if (cnt[k] < 40) {
                    bforty++;
                } else if (cnt[k] >= 40 && cnt[k] < 60) {
                    fourtosix++;
                } else if (cnt[k] >= 60 && cnt[k] < 80) {
                    sixtoeight++;
                } else if (cnt[k] >= 80 && cnt[k] <= 100) {
                    aeighty++;
                }

            }
            // store chart config name-config value pair
            Map<String, String> chartConfig = new HashMap<String, String>();
            chartConfig.put("caption", "SUBJECT ANALYSIS");
            chartConfig.put("subCaption", "Passed student count Semester Wise");
            chartConfig.put("xAxisName", "");
            chartConfig.put("yAxisName", "");
            chartConfig.put("numberSuffix", "");
            chartConfig.put("theme", "fusion");
            chartConfig.put("exportEnabled", "1");

            //store label-value pair
            Map<String, Integer> dataValuePair = new HashMap<String, Integer>();

            dataValuePair.put("Below Fourty", bforty);
            dataValuePair.put(" Fourty to sixty", fourtosix);
            dataValuePair.put("Sixty to Eighty", sixtoeight);
            dataValuePair.put("Above Eighty", aeighty);

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
                    "pie3d",
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
            <h2><ins>TOP 10 STUDENTS</ins></h2>
        </center>
        <br>
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>STUDENT NAME</th>
                    <th>MARKS</th>

                </tr>
            </thead>
            <tbody>
                <%  ResultSet r9 = null;
                    ResultSet r8 = st2.executeQuery("SELECT r.th_total as mark,s.student_details_prn as prn_detail FROM resultanalysis.result_marks r,resultanalysis.result_log s where r.id=s.result_marks_id and s.subject_marks_details_subject_code='" + scode + "' and year_attempting='" + year + "' order by r.total_marks desc limit 10;");
                    while (r8.next()) {
                        r9 = st3.executeQuery("select name from resultanalysis.student_details where prn='" + r8.getString("prn_detail") + "'");
                        r9.next();

                %>
                <tr>
                    <td><%=r9.getString("name")%></td>
                    <td><%=r8.getInt("mark")%></td>
                </tr>
                <% }%>

            </tbody>
        </table>
    </div>
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



