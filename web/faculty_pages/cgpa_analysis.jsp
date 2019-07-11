<%-- 
    Document   : cgpa_analysis
    Created on : Oct 8, 2018, 2:45:13 PM
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

        <title>CGPA Analysis</title>
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
        String y = request.getParameter("y");
        String exam_no = new String();
        int br = Integer.parseInt(branch);
        String b = new String();
        ResultSet r3 = st.executeQuery("SELECT * FROM resultanalysis.branch_details");

        while (r3.next()) {
            if (br == r3.getInt("code")) {
                b = r3.getString("name");
            }
        }
        if (y.equals("1")) {
            exam_no = "F123";
        } else if (y.equals("2")) {
            exam_no = "S123";
        } else if (y.equals("3")) {
            exam_no = "T123";
        } else if (y.equals("4")) {
            exam_no = "B123";
        }
        char a = exam_no.charAt(0);

    %>
    <div class="container mx-auto d-block w-50">
        <p class="lead ">
            <strong>YEAR: </strong><%=year%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>BRANCH: </strong><%=b%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        </p>
    </div>


    <br>
    <center>
        <h2><ins>DEPARTMENT CGPA ANALYSIS</ins></h2>
    </center>
    <br>
    <div id="chart" class="mx-auto d-block shadow-lg p-4 mb-4 bg-white w-50">
        <%
            ResultSet r4 = null;

            r4 = st1.executeQuery("select count(*) as c FROM resultanalysis.pointer_table where  year='" + year + "' and student_details_branch_details_code='" + br + "' and exam_seat_no LIKE '" + a + "%' and cgpa is not null");
            r4.next();
            int c = r4.getInt("c");

            Float cgpa[];
            cgpa = new Float[c + 1];
            int i = 0, j = 0;

            ResultSet r5 = st1.executeQuery("select cgpa FROM resultanalysis.pointer_table where  year='" + year + "' and student_details_branch_details_code='" + br + "' and exam_seat_no LIKE '" + a + "%' and cgpa is not null");

            while (r5.next()) {

                cgpa[i] = r5.getFloat("cgpa");
                
                i += 1;
            }

            int bfifty = 0, fivetosix = 0, sixtoeight = 0, eighttonine = 0, ninetoten = 0;
                        System.out.println("I="+i);

            for (int k = 0; k < i; k++) {
                if (cgpa[k] < 5.0) {
                    bfifty+=1;
                } else if (cgpa[k] >= 5.0 && cgpa[k] < 6.0) {
                    fivetosix+=1;
                    
                } else if (cgpa[k] >= 6.0 && cgpa[k] < 8.0) {
                    sixtoeight+=1;
                } else if (cgpa[k] >= 8.0 && cgpa[k] < 9.0) {
                    eighttonine+=1;
                } else if (cgpa[k] >= 9.0 && cgpa[k] < 10.0) {
                    ninetoten+=1;
                }

            }
            
            System.out.println(bfifty);
            System.out.println(fivetosix);
            System.out.println(sixtoeight);
            System.out.println(eighttonine);
            System.out.println(ninetoten);

            // store chart config name-config value pair
            Map<String, String> chartConfig = new HashMap<String, String>();
            chartConfig.put("caption", "CGPA ANALYSIS");
            chartConfig.put("subCaption", "CGPA RATIO SECURED BY STUDENTS");
            chartConfig.put("xAxisName", "CGPA");
            chartConfig.put("yAxisName", "NO. OF STUDENTS");
            chartConfig.put("numberSuffix", "");
            chartConfig.put("theme", "fusion");
            chartConfig.put("exportEnabled", "1");

            //store label-value pair
            Map<String, Integer> dataValuePair = new HashMap<String, Integer>();

            dataValuePair.put("Below Five", bfifty);
            dataValuePair.put(" Five to six", fivetosix);
            dataValuePair.put("Six to Eight", sixtoeight);
            dataValuePair.put("Eight to Nine", eighttonine);
            dataValuePair.put("Above Nine", ninetoten);
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
    <br>
    <br>
    <br>
    <center>
        <h2><ins>COLLEGE CGPA ANALYSIS</ins></h2>
    </center>
    <br>
    <div id="chart1" class="mx-auto d-block shadow-lg p-4 mb-4 bg-white w-50">
        <%
            ResultSet r6 = null;

            r6 = st1.executeQuery("select count(*) as c FROM resultanalysis.pointer_table where  year='" + year + "' and exam_seat_no LIKE '" + a + "%' and cgpa is not null");
            r6.next();
            int ca = r6.getInt("c");

            Float cgpa1[];
            cgpa1 = new Float[ca + 1];
            i = 0;
            j = 0;

            ResultSet r7 = st1.executeQuery("select cgpa FROM resultanalysis.pointer_table where  year='" + year + "' and  exam_seat_no LIKE '" + a + "%' and cgpa is not null");

            while (r7.next()) {

                cgpa1[i] = r7.getFloat("cgpa");
                out.println(cgpa1[i]);
                i += 1;
            }

            bfifty = 0;
            fivetosix = 0;
            sixtoeight = 0;
            eighttonine = 0;
            ninetoten = 0;
            for (int k = 0; k < i; k++) {
                if (cgpa1[k] < 5.0) {
                    bfifty++;
                } else if (cgpa1[k] >= 5.0 && cgpa1[k] < 6.0) {
                    fivetosix++;
                } else if (cgpa1[k] >= 6.0 && cgpa1[k] < 8.0) {
                    sixtoeight++;
                } else if (cgpa1[k] >= 8.0 && cgpa1[k] < 9.0) {
                    eighttonine++;
                } else if (cgpa1[k] >= 9.0 && cgpa1[k] < 10.0) {
                    ninetoten++;
                }

            }
            // store chart config name-config value pair
            Map<String, String> chartConfig1 = new HashMap<String, String>();
            chartConfig1.put("caption", "CGPA ANALYSIS");
            chartConfig1.put("subCaption", "CGPA RATIO SECURED BY STUDENTS");
            chartConfig1.put("xAxisName", "CGPA");
            chartConfig1.put("yAxisName", "NO. OF STUDENTS");
            chartConfig1.put("numberSuffix", "");
            chartConfig1.put("theme", "fusion");
            chartConfig1.put("exportEnabled", "1");

            //store label-value pair
            Map<String, Integer> dataValuePair1 = new HashMap<String, Integer>();

            dataValuePair1.put("Below Five", bfifty);
            dataValuePair1.put(" Five to six", fivetosix);
            dataValuePair1.put("Six to Eight", sixtoeight);
            dataValuePair1.put("Eight to Nine", eighttonine);
            dataValuePair1.put("Nine to Ten", ninetoten);
            StringBuilder jsonData1 = new StringBuilder();
            StringBuilder data1 = new StringBuilder();

            // json data to use as chart data source
            jsonData1.append("{'chart1':{");
            for (Map.Entry conf1 : chartConfig1.entrySet()) {
                jsonData1.append("'" + conf1.getKey() + "':'" + conf1.getValue() + "',");
            }

            jsonData1.replace(jsonData1.length() - 1, jsonData1.length(), "},");

            // build  data object from label-value pair
            data1.append("'data':[");

            for (Map.Entry pair1 : dataValuePair1.entrySet()) {
                data1.append("{'label':'" + pair1.getKey() + "','value':'" + pair1.getValue() + "'},");
            }
            data1.replace(data1.length() - 1, data1.length(), "]");

            jsonData1.append(data1.toString());
            jsonData1.append("}");

            // Create chart instance
            // charttype, chartID, width, height,containerid, data format, data
            FusionCharts firstChart1 = new FusionCharts(
                    "column3d",
                    "second_chart",
                    "650",
                    "500",
                    "chart1",
                    "json",
                    jsonData1.toString()
            );

        %>
        <%=firstChart1.render()%>

        <br><br>
    </div>
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