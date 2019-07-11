<%-- 
    Document   : update_result
    Created on : Oct 13, 2018, 3:16:19 PM
    Author     : Kaivalya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Student Result</title>
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
                    ResultSet rs1 = null;
                    ResultSet rs2 = null;
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

            <div class="card w-50 mx-auto">
                <div class="card-header">UPDATE STUDENT RESULT:</div>
                <div class="card-body">

                    <form action="../process_pages/verify_result.jsp" method="post">
                        <p class="lead" style="color:red; font-size:80%;">* Please insert 0 where no data is to be filled</p>
                        <div class="form-group">
                            <label class="lead float-left">Enter PRN:</label>
                            <input type="text" class="form-control" name="prn" required>
                        </div>

                        <div class="form-group">
                            <label class="lead float-left">Exam Seat No:</label>
                            <input type="text" class="form-control" name="exam_no" required>
                        </div>
                        <hr>

                        <div class="form-group">
                            <label for="sel1" class="lead float-left">Year:</label>
                            <select class="form-control" name="year" required>
                                <option value=''>Please Select an Option</option>
                                <%
                                    rs1 = st.executeQuery("SELECT DISTINCT(year) FROM pointer_table ORDER BY year");
                                    while (rs1.next()) {
                                %>
                                <option value="<%=rs1.getString("year")%>"><%=rs1.getString("year")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="lead float-left">Semester No:</label>
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
                        <hr>

                        <div class="form-group">
                            <label for="sel1" class="lead float-left">Subject Code:</label>
                            <select class="form-control" name="code" required>
                                <option value=''>Please Select an Option</option>
                                <%
                                    rs2 = st1.executeQuery("SELECT DISTINCT(subject_code) FROM subject_marks_details");
                                    while (rs2.next()) {
                                %>
                                <option value="<%=rs2.getString("subject_code")%>"><%=rs2.getString("subject_code")%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>

                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">TH:&nbsp;</label>
                                <input type="text" class="form-control" name="th" required>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="lead float-left">OE:&nbsp;</label>
                                <input type="text" class="form-control" name="oe" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">IN:&nbsp;</label>
                                <input type="text" class="form-control" name="in" required>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="lead float-left">OR:&nbsp;&nbsp;</label>
                                <input type="text" class="form-control" name="or" required>


                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">PR:&nbsp;</label>
                                <input type="text" class="form-control" name="pr" required>&nbsp;&nbsp;&nbsp;&nbsp;
                                <label class="lead float-left">TW:&nbsp;</label>
                                <input type="text" class="form-control" name="tw" required>
                            </div>
                        </div>
                        <hr>

                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">Total Marks:&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <input type="text" class="form-control" name="total_marks" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">TH Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <input type="text" class="form-control" name="th_total" required>
                            </div>
                        </div>
                        <hr>

                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">Earned Credit:&nbsp;</label>
                                <input type="text" class="form-control" name="e_credit" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">Credit Points:&nbsp;&nbsp;</label>
                                <input type="text" class="form-control" name="c_pts" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">Grade Points:&nbsp;&nbsp;</label>
                                <input type="text" class="form-control" name="g_pts" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-inline">
                                <label class="lead float-left">Grade:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <input type="text" class="form-control" name="grade" required>
                            </div>
                        </div>
                        <hr>

                        <div class="form-group">
                            <label class="lead float-left">Total Percentage:</label>
                            <input type="text" class="form-control" name="t_per" required>
                        </div>
                        <hr>

                        <div class="form-group">
                            <label class="lead float-left">Ordinance:</label>
                            <select class="form-control" name="ord">
                                <option value=''>Please Select an Option</option>
                                <option value="#">#</option>
                                <option value="$">$</option>
                                <option value="@">@</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label class="lead float-left">Status:</label>
                            <select class="form-control" name="status" required>
                                <option value=''>Please Select an Option</option>
                                <option value="P">P</option>
                                <option value="F">F</option>
                            </select>
                        </div>
                        <center>
                            <button type="submit" class="btn btn-outline-success m-3">SUBMIT</button>

                            <button type="button" class="btn btn-outline-danger m-3">CLOSE</button>
                        </center>
                    </form>


                </div>
            </div>
        </div>

        <br><br>
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