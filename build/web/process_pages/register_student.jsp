<%-- 
    Document   : register_student
    Created on : Oct 7, 2018, 7:55:33 PM
    Author     : Kaivalya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../images/c.png" />
        <title>loading...</title>
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

        <%
            
            try {
                String temp = (String) session.getAttribute("login");
                if (temp.equals("true")) {
            String users_id = (String) session.getAttribute("users_id");
            ResultSet rs = st.executeQuery("select * from resultanalysis.admin_details where username='" + users_id + "'");
            rs.next();
            Integer cid = rs.getInt("college_details_id");
            //out.println(cid);
            try {
                PreparedStatement ps = con.prepareStatement("INSERT INTO student_details (`prn`, `name`, `mother_name`, `college_details_id`, `branch_details_code`) VALUES (?,?,?,?,?)");

                ps.setString(1, request.getParameter("prn"));
                ps.setString(2, request.getParameter("name"));
                ps.setString(3, request.getParameter("mname"));
                ps.setInt(4, cid);
                ps.setString(5, request.getParameter("branch"));

                ps.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('REGISTRATION SUCCESSFULL');");
                out.println("location='../admin_pages/admin_dashboard.jsp';");
                out.println("</script>");
            } catch (Exception e) {
                out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ERROR INSERTING DATA PLEASE TRY AGAIN');");
                out.println("location='../admin_pages/manage_student.jsp';");
                out.println("</script>");
            }

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
