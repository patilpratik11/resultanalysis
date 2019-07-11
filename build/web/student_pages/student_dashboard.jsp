
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="fusioncharts.FusionCharts" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" " http://www.w3.org/TR/html4/loose.dtd" >

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dashboard</title>
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
                    String users_id = (String) session.getAttribute("users_id");
                    ResultSet rs = st.executeQuery("SELECT * FROM resultanalysis.student_details WHERE prn='" + users_id + "'");
                    rs.next();
                    String name = rs.getString("name");
                    String prn = rs.getString("prn");
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
                <a class="nav-link" href="../student_pages/student_dashboard.jsp">HOME</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="../about_us.jsp">ABOUT US</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../process_pages/logout.jsp">LOG OUT</a>
            </li>
        </ul>
    </nav>
    <hr>
    <div class="container">
        <p class="lead"><strong>PRN: </strong><%=prn%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>NAME: </strong><%=name%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <strong>BRANCH NAME: </strong><%=br_nm%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
            <strong>COLLEGE NAME: </strong><%=cg_nm%>
        </p>
    </div>
    <hr>
    <br>

    <center>
        <h4>STUDENT'S CGPA ANALYSIS</h4>
    </center>
    <div id="chart" class="mx-auto d-block shadow-lg p-4 mb-4 bg-white w-50">


        <%
            try {
                ResultSet rs3 = null;
                rs3 = st.executeQuery("select count(*) as cnt from resultanalysis.pointer_table where student_details_prn='" + prn + "'");
                rs3.next();
                int c = rs3.getInt("cnt");
                rs3 = st.executeQuery("select * from resultanalysis.pointer_table where student_details_prn='" + prn + "'");

                out.println(c);
                Integer year[];
                year = new Integer[5];
                Float cgpa[];
                cgpa = new Float[5];
                for (int i = 0; i < c; i++) {
                    rs3.next();
                    year[i] = rs3.getInt("year");
                    cgpa[i] = rs3.getFloat("cgpa");

                }

                // store chart config name-config value pair
                Map<String, String> chartConfig = new HashMap<String, String>();
                chartConfig.put("caption", "CGPA ANALYSIS");
                chartConfig.put("subCaption", "YearWise");
                chartConfig.put("xAxisName", "YEAR");
                chartConfig.put("yAxisName", "CGPA");
                chartConfig.put("numberSuffix", "cgpa");
                chartConfig.put("theme", "fusion");
                chartConfig.put("exportEnabled", "1");

                //store label-value pair
                Map<Integer, Float> dataValuePair = new HashMap<Integer, Float>();

                //  rs3.next();
                for (int i = 0; i < c; i++) {
                    dataValuePair.put(year[i], cgpa[i]);
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
                        "line",
                        "first_chart",
                        "600",
                        "400",
                        "chart",
                        "json",
                        jsonData.toString()
                );
        %>

        <%= firstChart.render()%>
        <%
            } catch (Exception e) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('WAIT FOR A YEAR KID');");
                out.println("location='../login_2.jsp';");
                out.println("</script>");
            }
        %>
    </div>
    <br>
    <br>
    <div class="container container-fluid">
        <div class="card-deck">
            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/wob.png" alt="Card image" style="width:60%"><br>
                    <p class="card-text">VIEW RESULT WITHOUT BACKLOG</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal">
                        VIEW
                    </button>

                    <!-- The Modal -->
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">SELECT SEMESTER </h4>

                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="view_student_result.jsp" method="post" >
                                        <div class="form-group">
                                            <label for="sel1" class="float-left">Please Select:</label>
                                            <select class="form-control" name="sem">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                            </select>
                                        </div>
                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                        <button type="submit" class="btn btn-outline-success float-right m-3">SUBMIT</button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/rwb.png" alt="Card image" style="width:60%"><br>
                    <p class="card-text">VIEW BACKLOG RESULT</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal1">
                        VIEW
                    </button>

                    <!-- The Modal -->
                    <div class="modal fade" id="myModal1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">SELECT SEMESTER </h4>

                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="student_result_backlogs.jsp" method="post" >
                                        <div class="form-group">
                                            <label for="sel1" class="float-left">Please Select:</label>
                                            <select class="form-control" name="sem">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                            </select>
                                        </div>
                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                        <button type="submit" class="btn btn-outline-success float-right m-3">SUBMIT</button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/p1.png" alt="Card image" style="width:60%"><br>
                    <p class="card-text">VIEW DEPARTMENTAL RANK</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal2">
                        VIEW
                    </button>

                    <!-- The Modal -->
                    <div class="modal fade" id="myModal2">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">YOUR YEARLY DEPARTMENTAL RANKINGS(CGPA)</h4>

                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
                                                <th>YEAR</th>
                                                <th>RANK</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                ResultSet rs4 = st.executeQuery("SELECT exam_seat_no,year FROM pointer_table WHERE student_details_prn='" + prn + "' ORDER BY year");
                                                String sno, year;
                                                char c;
                                                int count = 0, i = 0;
                                                String yr[];
                                                yr = new String[4];
                                                Integer r[];
                                                r = new Integer[4];
                                                while (rs4.next()) {
                                                    count = 1;
                                                    sno = rs4.getString("exam_seat_no");
                                                    c = sno.charAt(0);
                                                    year = rs4.getString("year");
                                                    yr[i] = year;
                                                    ResultSet rs5 = st1.executeQuery("SELECT * FROM pointer_table WHERE year='" + year + "' AND exam_seat_no LIKE '" + c + "%' ORDER BY cgpa DESC");
                                                    while (rs5.next()) {
                                                        if (prn.equals(rs5.getString("student_details_prn"))) {
                                                            r[i] = count;
                                                            count = 0;

                                                        } else {
                                                            count += 1;
                                                        }

                                                    }
                                                    i += 1;
                                                }
                                            %>
                                            <% for (int j = 0; j < i; j++) {
                                            %>
                                            <tr>
                                                <td><%=yr[j]%></td>
                                                <td><%=r[j]%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </tbody>
                                    </table>
                                    <button type="button" class="btn btn-outline-danger mx-auto d-block  m-3" data-dismiss="modal">CLOSE</button>

                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/p.png" alt="Card image" style="width:60%"><br>
                    <p class="card-text">VIEW SUBJECTWISE RANK</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal3">
                        VIEW
                    </button>

                    <!-- The Modal -->
                    <div class="modal fade" id="myModal3">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title">SELECT SUBJECT</h4>

                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="subjectwise_rank.jsp" method="post" >
                                        <div class="form-group">
                                            <label for="sel1" class="float-left">Subject:</label>
                                            <select class="form-control" name="code" required>
                                                <option value=''>please select an option</option>
                                                <%
                                                    ResultSet rs3 = st.executeQuery("SELECT * FROM subject_marks_details");
                                                    while (rs3.next()) {
                                                %>
                                                <option value="<%=rs3.getString("subject_code")%>"><%=rs3.getString("subject_name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="sel1" class="float-left">Year:</label>
                                            <select class="form-control" name="year" required>
                                                <option value=''>please select an option</option>
                                                <%
                                                    rs4 = st.executeQuery("SELECT DISTINCT(year) FROM pointer_table WHERE student_details_prn='" + prn + "' ORDER BY year");
                                                    while (rs4.next()) {
                                                %>
                                                <option value="<%=rs4.getString("year")%>"><%=rs4.getString("year")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                        <button type="submit" class="btn btn-outline-success float-right m-3">SUBMIT</button>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
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
            out.println("location='../login_2.jsp';");
            out.println("</script>");
        }

    %>
</body>
</html>