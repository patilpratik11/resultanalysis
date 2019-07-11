<%-- 
    Document   : view_student_result
    Created on : Oct 4, 2018, 5:07:58 PM
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
        <title>Student Backlog Result</title>
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
        <title>JSP Page</title>
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
                <a class="nav-link" href="../process_pages/logout.jsp">LOG OUT</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../about_us.jsp">ABOUT US</a>
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

    <%
        String s = request.getParameter("sem");
        int sem = Integer.parseInt(s);
        ResultSet rs3 = st.executeQuery("SELECT * FROM resultanalysis.result_log where student_details_prn='" + prn + "' and sem_no='" + sem + "'");
        rs3.next();
        Integer rno = rs3.getInt("result_marks_id");
        String eno = rs3.getString("exam_seat_no");
        String year = rs3.getString("year_attempting");

        //                ResultSet rs4 = st.executeQuery("SELECT * FROM resultanalysis.result_marks where id='" + rno + "' and sem_no='" + sem + "'");
        //                rs4.next();
        ResultSet rs5 = st.executeQuery("SELECT * FROM resultanalysis.result_log where student_details_prn='" + prn + "' and sem_no='" + sem + "'");

    %> 

    <div class="container">
        <center>
            <h2><ins>RESULT WITHOUT BACKLOGS</ins></h2>
        </center>
        <br>
        <center>
            <h6>Exam seat no: <%=eno%>  &nbsp  Sem no:<%=rno%>  &nbsp Year:<%=year%></h6>
        </center>
        <br>         
        <table class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>Subject Code</th>
                    <th>Subject Name</th>
                    <th>IN</th>
                    <th>OE</th>
                    <th>TH</th>
                    <th>(IN or OE) + TH</th>
                    <th>TW</th>
                    <th>PR</th>
                    <th>OR</th>
                    <th>Total %</th>
                    <th>Crd</th>
                    <th>Crd Pts</th>
                    <th>Grade</th>
                    <th>Grd Pts</th>
                </tr>
            </thead>
            <tbody>
                <% String scode;
                    String status;
                    ResultSet rs6, rs7;
                    while (rs5.next()) {
                        status = rs5.getString("status");
                        if (status.equalsIgnoreCase("F")) {
                %>
                <tr>
                    <td><%=rs5.getString("subject_marks_details_subject_code")%></td>
                    <% scode = rs5.getString("subject_marks_details_subject_code");
                        rs6 = st1.executeQuery("SELECT subject_name FROM resultanalysis.subject_marks_details where subject_code='" + scode + "'");
                        rs6.next();
                    %>
                    <td><%=rs6.getString("subject_name")%></td>
                    <%
                        Integer mr = rs5.getInt("result_marks_id");
                        rs7 = st2.executeQuery("SELECT * FROM resultanalysis.result_marks where id='" + mr + "'");
                        rs7.next();
                    %>
                    <td><%=rs7.getInt("in")%></td>
                    <td><%=rs7.getInt("oe")%></td>
                    <td><%=rs7.getInt("th")%></td>
                    <td><%=rs7.getInt("th_total")%></td>
                    <td><%=rs7.getInt("tw")%></td>
                    <td><%=rs7.getInt("pr")%></td>
                    <td><%=rs7.getInt("or")%></td>
                    <td><%=rs5.getInt("total_percentage")%></td>
                    <td><%=rs5.getInt("earned_credit")%></td>
                    <td><%=rs5.getInt("credit_points")%></td>
                    <td><%=rs5.getString("grade")%></td>
                    <td><%=rs5.getInt("grade_points")%></td>
                    <% }
                        }%>
                </tr>
            </tbody>
        </table>
        <br>
        <br>
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
            out.println("location='../login_2.jsp';");
            out.println("</script>");
        }

    %>
</body>
</html>
