<%-- 
    Document   : college_top
    Created on : Oct 8, 2018, 1:56:10 PM
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
        <link rel="shortcut icon" href="../images/c.png" />
        <title>College Top 10</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                    st2 = con.createStatement();
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
                    ResultSet rs20=null;
                    String temp1;
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
    %>
    <div class="container-fluid">
        <center>
            <h2><ins>COLLEGE TOP 10 STUDENTS FOR YEAR <%=year%></ins></h2>
        </center>
        <hr>
        <br>


        <center>
            <h4>FIRST YEAR</h4>
        </center>
        <table class="table table-bordered table-hover table-striped w-50 mx-auto">
            <thead>
                <tr>
                    <th>RANK</th>
                    <th>PRN</th>
                    <th>NAME</th>
                    <th>CGPA</th>
                    <th>BRANCH</th>
                </tr>
            </thead>
            <tbody>
                <%

                    int i = 1;
                    ResultSet rs4 = st.executeQuery("SELECT * FROM resultanalysis.pointer_table where year='" + year + "' and exam_seat_no LIKE 'F%' and student_details_college_details_id='" + cg_id + "' order by cgpa desc limit 10");
                    while (rs4.next()) {

                        ResultSet rs5 = st1.executeQuery("SELECT name,branch_details_code FROM resultanalysis.student_details WHERE prn='" + rs4.getString("student_details_prn") + "'");
                        
                        temp1 = rs4.getString("branch_details_code");
                        rs20 = st2.executeQuery("SELECT name from branch_details WHERE code='" + temp1 + "' ");
                        rs20.next();
                        rs5.next();


                %>

                <tr>
                    <td><%=i++%></td>
                    <td><%=rs4.getString("student_details_prn")%></td>
                    <td><%=rs5.getString("name")%></td>
                    <td><%=rs4.getFloat("cgpa")%></td>
                    <td><%=rs20.getString("name")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <br>
        <br>
        <hr>
        <center>
            <h4>SECOND YEAR</h4>
        </center>
        <table class="table table-bordered table-hover table-striped w-50 mx-auto">
            <thead>
                <tr>
                    <th>RANK</th>
                    <th>PRN</th>
                    <th>NAME</th>
                    <th>CGPA</th>
                    <th>BRANCH</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int j = 1;
                    ResultSet rs6 = st.executeQuery("SELECT * FROM resultanalysis.pointer_table where year='" + year + "' and exam_seat_no LIKE 'S%' and student_details_college_details_id='" + cg_id + "' order by cgpa desc limit 10");
                    while (rs6.next()) {

                        ResultSet rs7 = st1.executeQuery("SELECT name,branch_details_code FROM resultanalysis.student_details WHERE prn='" + rs6.getString("student_details_prn") + "'");
                        rs7.next();
                        temp1 = rs7.getString("branch_details_code");
                        rs20 = st2.executeQuery("SELECT name from branch_details WHERE code='" + temp1 + "' ");
                        rs20.next();

                %>

                <tr>
                    <td><%=j++%></td>
                    <td><%=rs6.getString("student_details_prn")%></td>
                    <td><%=rs7.getString("name")%></td>
                    <td><%=rs6.getFloat("cgpa")%></td>
                    <td><%=rs20.getString("name")%></td>
                </tr>
                <%}%>
            </tbody>
        </table>



    </div>
    <br>
    <br>
    <hr>
    <center>
        <h4>THIRD YEAR</h4>
    </center>
    <table class="table table-bordered table-hover table-striped w-50 mx-auto">
        <thead>
            <tr>
                <th>RANK</th>
                <th>PRN</th>
                <th>NAME</th>
                <th>CGPA</th>
                <th>BRANCH</th>
            </tr>
        </thead>
        <tbody>
            <%
                int k = 1;
                ResultSet rs8 = st.executeQuery("SELECT * FROM resultanalysis.pointer_table where year='" + year + "' and exam_seat_no LIKE 'T%' and student_details_college_details_id='" + cg_id + "' order by cgpa desc limit 10");
                while (rs8.next()) {

                    ResultSet rs9 = st1.executeQuery("SELECT name,branch_details_code FROM resultanalysis.student_details WHERE prn='" + rs8.getString("student_details_prn") + "'");
                    rs9.next();
                    temp1 = rs9.getString("branch_details_code");
                    rs20 = st2.executeQuery("SELECT name from branch_details WHERE code='" + temp1 + "' ");
                    rs20.next();
            %>

            <tr>
                <td><%=k++%></td>
                <td><%=rs8.getString("student_details_prn")%></td>
                <td><%=rs9.getString("name")%></td>
                <td><%=rs8.getFloat("cgpa")%></td>
                <td><%=rs20.getString("name")%></td>
            </tr>
            <%}%>
        </tbody>
    </table>
</div>
<br>
<br>
<hr>
<center>
    <h4>FOURTH YEAR</h4>
</center>
<table class="table table-bordered table-hover table-striped w-50 mx-auto">
    <thead>
        <tr>
            <th>RANK</th>
            <th>PRN</th>
            <th>NAME</th>
            <th>CGPA</th>
            <th>BRANCH</th>
        </tr>
    </thead>
    <tbody>
        <%
            int l = 1;
            ResultSet rs10 = st.executeQuery("SELECT * FROM resultanalysis.pointer_table where year='" + year + "' and exam_seat_no LIKE 'B%' and student_details_college_details_id='" + cg_id + "' order by cgpa desc limit 10");
            while (rs10.next()) {

                ResultSet rs11 = st1.executeQuery("SELECT name,branch_details_code FROM resultanalysis.student_details WHERE prn='" + rs10.getString("student_details_prn") + "'");
                rs11.next();
                temp1 = rs11.getString("branch_details_code");
                rs20 = st2.executeQuery("SELECT name from branch_details WHERE code='" + temp1 + "' ");
                rs20.next();
        %>

        <tr>
            <td><%=l++%></td>
            <td><%=rs10.getString("student_details_prn")%></td>
            <td><%=rs11.getString("name")%></td>
            <td><%=rs10.getFloat("cgpa")%></td>
            <td><%=rs20.getString("name")%></td>
        </tr>
        <%}%>
    </tbody>
</table>


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
        //out.println("location='../login_1.jsp';");
        out.println("</script>");
    }
%>
</body>
</html>