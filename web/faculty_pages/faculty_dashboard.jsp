<%-- 
    Document   : faculty_dashboard
    Created on : Sep 30, 2018, 2:03:19 PM
    Author     : pRaTiK
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import="fusioncharts.FusionCharts" %>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" " http://www.w3.org/TR/html4/loose.dtd" >

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Faculty Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="../images/c.png" />
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <!----------------chart script------------------->
        <script type="text/javascript" src="../fusioncharts/js/fusioncharts.js"></script> 
        <script src="../fusioncharts/js/themes/fusioncharts.theme.fusion.js"></script>
    </head>
    <body>
        <script type="text/javascript">

            function checkdropdown() {
                if (document.getElementById('select').value != "") {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
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
                    ResultSet rs4 = null;
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



    <div class="container container-fluid">

        <div class="card-deck">

            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/semsub.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">SEMESTERWISE SUBJECT ANALYSIS</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal">
                        VIEW
                    </button>
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ">Select Details</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="../faculty_pages/subject_analysis.jsp" method="post">
                                        <div class="form-group">
                                            <label class="lead float-left">Year:</label>
                                            <select class="form-control" name="year" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    rs4 = st2.executeQuery("SELECT DISTINCT(year) FROM pointer_table ORDER BY year");
                                                    while (rs4.next()) {
                                                %>
                                                <option value="<%=rs4.getString("year")%>"><%=rs4.getString("year")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left">Branch:</label>
                                            <select class="form-control" name="branch" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    ResultSet r2 = st1.executeQuery("SELECT * FROM resultanalysis.branch_details");

                                                    while (r2.next()) {%>
                                                <option value="<%=r2.getString("code")%>"><%=r2.getString("name")%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left">Sem No:</label>
                                            <select class="form-control" name="sem" required>
                                                <option value=''>Please Select an Option</option>
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
                                        <button type="submit" onClick='if (!checkdropdown()) {
                                                    alert("You need to select a value!");
                                                    return false;
                                                }' class="btn btn-outline-success float-right m-3">Submit</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/dept.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text"> DEPARTMENT TOP 10</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal2">
                        VIEW
                    </button>
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal2">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ">Select Details</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="../faculty_pages/department_top.jsp" method="post">
                                        <div class="form-group">
                                            <label class="lead float-left">Year:</label>
                                            <select class="form-control" name="year" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    rs4 = st2.executeQuery("SELECT DISTINCT(year) FROM pointer_table ORDER BY year");
                                                    while (rs4.next()) {
                                                %>
                                                <option value="<%=rs4.getString("year")%>"><%=rs4.getString("year")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left">Branch:</label>
                                            <select class="form-control" name="branch" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    ResultSet r3 = st1.executeQuery("SELECT * FROM resultanalysis.branch_details");

                                                    while (r3.next()) {%>
                                                <option value="<%=r3.getString("code")%>"><%=r3.getString("name")%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                        <button type="submit" onClick='if (!checkdropdown()) {
                                                    alert("You need to select a value!");
                                                    return false;
                                                }' class="btn btn-outline-success float-right m-3">Submit</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/sinsub.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">SINGLE SUBJECT ANALYSIS</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal1">
                        VIEW
                    </button>
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal1">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ">Select Details</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="../faculty_pages/single_subject_analysis.jsp" method="post">
                                        <div class="form-group">
                                            <label class="lead float-left">Year:</label>
                                            <select class="form-control" name="year" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    rs4 = st2.executeQuery("SELECT DISTINCT(year) FROM pointer_table ORDER BY year");
                                                    while (rs4.next()) {
                                                %>
                                                <option value="<%=rs4.getString("year")%>"><%=rs4.getString("year")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left">Branch:</label>
                                            <select class="form-control" name="branch" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    ResultSet r1 = st1.executeQuery("SELECT * FROM resultanalysis.branch_details");

                                                    while (r1.next()) {%>
                                                <option value="<%=r1.getString("code")%>"><%=r1.getString("name")%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left">Subject:</label>
                                            <select class="form-control" name="code" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    ResultSet r = st1.executeQuery("SELECT * FROM resultanalysis.subject_marks_details");

                                                    while (r.next()) {%>
                                                <option value="<%=r.getInt("subject_code")%>"><%=r.getString("subject_name")%></option>
                                                <% }%>

                                            </select>
                                        </div>



                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                        <button type="submit" onClick='if (!checkdropdown()) {
                                                    alert("You need to select a value!");
                                                    return false;
                                                }' class="btn btn-outline-success float-right m-3">Submit</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="card-deck">



            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/yearsub.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">YEARWISE SUBJECT PASSING</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal4">
                        VIEW
                    </button>
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal4">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ">SELECT SUBJECT</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="../faculty_pages/yearwise_subject_analysis.jsp" method="post">
                                        <div class="form-group">
                                            <label class="lead float-left">Subject:</label>
                                            <select class="form-control" name="code" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    r3 = st1.executeQuery("SELECT * FROM resultanalysis.subject_marks_details");

                                                    while (r3.next()) {%>
                                                <option value="<%=r3.getString("subject_code")%>"><%=r3.getString("subject_name")%></option>
                                                <%}%>
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
                    <img class="card-img-top" src="../images/clg.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">COLLEGE TOP 10</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal3">
                        VIEW
                    </button>
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal3">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ">Select Details</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="../faculty_pages/college_top.jsp" method="post">
                                        <div class="form-group">
                                            <label class="lead float-left">Year:</label>
                                            <select class="form-control" name="year" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    rs4 = st2.executeQuery("SELECT DISTINCT(year) FROM pointer_table ORDER BY year");
                                                    while (rs4.next()) {
                                                %>
                                                <option value="<%=rs4.getString("year")%>"><%=rs4.getString("year")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>

                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                        <button type="submit" onClick='if (!checkdropdown()) {
                                                    alert("You need to select a value!");
                                                    return false;
                                                }' class="btn btn-outline-success float-right m-3">Submit</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/cgpa.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">CGPA ANALYSIS</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal5">
                        VIEW
                    </button>
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal5">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ">Select Details</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="../faculty_pages/cgpa_analysis.jsp" method="post">
                                        <div class="form-group">
                                            <label class="lead float-left">Year:</label>
                                            <select class="form-control" name="year" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    rs4 = st2.executeQuery("SELECT DISTINCT(year) FROM pointer_table ORDER BY year");
                                                    while (rs4.next()) {
                                                %>
                                                <option value="<%=rs4.getString("year")%>"><%=rs4.getString("year")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left">Branch:</label>
                                            <select class="form-control" name="branch" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    ResultSet r5 = st1.executeQuery("SELECT * FROM resultanalysis.branch_details");

                                                    while (r5.next()) {%>
                                                <option value="<%=r5.getString("code")%>"><%=r5.getString("name")%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left">YEAR OF ENGINEERING:</label>
                                            <select class="form-control" name="y" required>
                                                <option value=''>Please Select an Option</option>
                                                <option value="1">FIRST YEAR</option>
                                                <option value="2">SECOND YEAR</option>
                                                <option value="3">THIRD YEAR</option>
                                                <option value="4">FOURTH YEAR</option>
                                            </select>
                                        </div>
                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                        <button type="submit" onClick='if (!checkdropdown()) {
                                                    alert("You need to select a value!");
                                                    return false;
                                                }' class="btn btn-outline-success float-right m-3">Submit</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-deck">
            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/ur.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">UPDATE RESULT</p>
                    <a href="update_result.jsp" class="btn btn-outline-dark">CLICK TO UPDATE</a>
                </div>
            </div>
            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/cp.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">CHANGE PASSWORD</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal6">
                        CLICK TO CHANGE
                    </button>
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal6">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ">ENTER THE DETAILS</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="../process_pages/change_password.jsp" method="post">
                                        <div class="form-group">
                                            <label class="lead float-left">Old Password:</label>
                                            <input type="password" class="form-control" name="oldpwd" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left">New Password:</label>
                                            <input type="password" class="form-control" name="newpwd" id="newpwd" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="lead float-left"> Confirm Password:</label>
                                            <input type="password" class="form-control" name="cnfpwd" id="cnfpwd" required>
                                        </div>

                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal" >CLOSE</button>
                                        <button type="submit" class="btn btn-outline-success float-right m-3">CHANGE</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/feedback.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">GIVE FEEDBACK</p>
                    <a href="feedback.jsp" class="btn btn-outline-dark">CLICK TO GIVE</a>
                </div>
            </div>
        </div>
        <div class="card-deck mx-auto" style="width:34%;">

            <div class="card d-block shadow p-4 mb-4 bg-white">
                <div class="card-body text-center">
                    <img class="card-img-top" src="../images/pdf1.png" alt="Card image" style="width:50%"><br>
                    <p class="card-text">VIEW PDFS</p>
                    <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal7">
                        CLICK TO VIEW
                    </button>
                    <!-- The Modal -->
                    <div class="modal fade" id="myModal7">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">

                                <!-- Modal Header -->
                                <div class="modal-header">
                                    <h4 class="modal-title ">PLEASE SELECT</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>

                                <!-- Modal body -->
                                <div class="modal-body">
                                    <form action="../process_pages/open_pdf.jsp" method="post">
                                        <div class="form-group">
                                            <label class="lead float-left">Year:</label>
                                            <select class="form-control" name="name" required>
                                                <option value=''>Please Select an Option</option>
                                                <%
                                                    rs = st.executeQuery("SELECT * FROM pdf_details WHERE admin_details_college_details_id='"+cg_id+"' ORDER BY name");
                                                    while (rs.next()) {
                                                %>
                                                <option value="<%=rs.getString("name")%>"><%=rs.getString("name")%></option>
                                                <%
                                                    }
                                                %>
                                            </select>
                                        </div>

                                        <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                        <button type="submit" class="btn btn-outline-success float-right m-3">VIEW</button>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

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
