<%-- 
    Document   : admin_dashboard
    Created on : Sep 29, 2018, 1:15:32 PM
    Author     : pRaTiK
	 

--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="../images/c.png" />
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%!
            Connection con;
            Statement st;

            public void jspInit() {
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultanalysis?autoReconnect=true&useSSL=false", "root", "root");
                    st = con.createStatement();
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        %>
        <%try {
                String temp = (String) session.getAttribute("login");
                if (temp.equals("true")) {
                    String temp1 = (String) session.getAttribute("users_id");
                    ResultSet rs = null;
                    rs = st.executeQuery("SELECT * FROM admin_details WHERE username='" + temp1 + "'");
                    rs.next();
                    String college = rs.getString("college_details_id");
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
                    <a class="nav-link" href="../admin_pages/admin_dashboard.jsp">HOME</a>
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

            <div class="card-deck">
                <div class="card d-block shadow p-4 mb-4 bg-white">
                    <div class="card-body text-center">
                        <img class="card-img-top" src="../images/pdf.png" alt="Card image" style="width:50%"><br>
                        <p class="card-text">ADD PDF FILE IN DATABASE</p>
                        <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal">
                            CLICK TO ADD
                        </button>
                        <!-- The Modal -->
                        <div class="modal fade" id="myModal">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title ">UPLOAD PDF</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <form action="../upload" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label class="lead float-left">SPECIFY A NAME FOR THIS FILE:</label>
                                                <input type="text" class="form-control" name="name" required>
                                            </div>
                                            <div class="form-group">
                                                <select class="form-control" name="college" hidden>
                                                    <% rs = st.executeQuery("SELECT * FROM admin_details WHERE username='" + temp1 + "'");

                                                        while (rs.next()) {
                                                    %>
                                                    <option value="<%=rs.getString("college_details_id")%>"></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <input type="file" name="file" class="form-control-file border">
                                            </div>
                                            <div class="form-group">
                                                <select class="form-control" name="username" hidden>
                                                    <%
                                                        rs = st.executeQuery("SELECT * FROM admin_details WHERE username='" + temp1 + "'");

                                                        while (rs.next()) {
                                                    %>
                                                    <option value="<%=rs.getString("username")%>"></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </div>
                                            <br>
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
                        <img class="card-img-top" src="../images/ms.png" alt="Card image" style="width:50%"><br>
                        <p class="card-text">MANAGE STUDENTS</p>
                        <a href="manage_student.jsp" class="btn btn-outline-dark">CLICK TO MANAGE</a>
                    </div>
                </div>

                <div class="card d-block shadow p-4 mb-4 bg-white">
                    <div class="card-body text-center">
                        <img class="card-img-top" src="../images/mf.png" alt="Card image" style="width:50%"><br>
                        <p class="card-text">MANAGE FACULTY</p>
                        <a href="manage_faculty.jsp" class="btn btn-outline-dark">CLICK TO MANAGE</a>
                    </div>
                </div>

            </div>                  
            <div class="card-deck">
                <div class="card d-block shadow p-4 mb-4 bg-white">
                    <div class="card-body text-center">
                        <img class="card-img-top" src="../images/ac.png" alt="Card image" style="width:50%"><br>
                        <p class="card-text">MANAGE AUDIT COURSES</p>
                        <a href="manage_audit_course.jsp" class="btn btn-outline-dark">CLICK TO MANAGE</a>
                    </div>
                </div>


                <div class="card d-block shadow p-4 mb-4 bg-white">
                    <div class="card-body text-center">
                        <img class="card-img-top" src="../images/cp.png" alt="Card image" style="width:50%"><br>
                        <p class="card-text">CHANGE PASSWORD</p>
                        <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal1">
                            CLICK TO CHANGE
                        </button>
                        <!-- The Modal -->
                        <div class="modal fade" id="myModal1">
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
                                                <input type="password" class="form-control" name="newpwd" required>
                                            </div>
                                            <div class="form-group">
                                                <label class="lead float-left"> Confirm Password:</label>
                                                <input type="password" class="form-control" name="cnfpwd" required>
                                            </div>

                                            <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
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
                        <img class="card-img-top" src="../images/pdf1.png" alt="Card image" style="width:50%"><br>
                        <p class="card-text">VIEW PDFS</p>
                        <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal2">
                            CLICK TO VIEW
                        </button>
                        <!-- The Modal -->
                        <div class="modal fade" id="myModal2">
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
                                                        rs = st.executeQuery("SELECT * FROM pdf_details WHERE admin_details_college_details_id='" + college + "' ORDER BY name");
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
            <br><br>
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

