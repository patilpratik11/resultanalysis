<%-- 
    Document   : add_audit_course
    Created on : Oct 4, 2018, 6:37:54 PM
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

        <%try {
                String temp = (String) session.getAttribute("login");
                if (temp.equals("true")) {
            try {
                PreparedStatement ps = con.prepareStatement("INSERT INTO audit_course_details (`code`, `name`) VALUES (?,?)");

                ps.setString(1, request.getParameter("code"));
                ps.setString(2, request.getParameter("name"));

                ps.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('AUDIT COURSE ADDED SUCCESSFULLY');");
                out.println("location='../admin_pages/manage_audit_course.jsp';");
                out.println("</script>");
            } catch (Exception e) {
                out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ERROR INSERTING DATA PLEASE TRY AGAIN');");
                out.println("location='../admin_pages/manage_audit_course.jsp';");
                out.println("</script>");
            }

//            con.close();
//            st.close();
        %>

        <h1>PLEASE TRY AGAIN.</h1>
        <%            }
        }
        catch (Exception e) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('SESSION EXPIRED PLEASE LOGIN AGAIN');");
        out.println("location='../login_1.jsp';");
        out.println("</script>");
    }

        %>
    </body>
</html>
