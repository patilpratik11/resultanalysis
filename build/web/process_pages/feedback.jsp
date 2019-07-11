<%-- 
    Document   : feedback
    Created on : Oct 13, 2018, 5:10:00 PM
    Author     : Kaivalya
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

                    Float rate = Float.parseFloat(request.getParameter("points"));
                    rate = rate / 10;
                    try {
                        PreparedStatement ps = con.prepareStatement("INSERT INTO feedback_details (`rating`, `comment`) VALUES (?,?)");

                        ps.setFloat(1, rate);
                        ps.setString(2, request.getParameter("comment"));

                        ps.executeUpdate();
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('FEEDBACK INSERTED SUCCESSFULLY');");
                        out.println("location='../faculty_pages/faculty_dashboard.jsp';");
                        out.println("</script>");
                    } catch (Exception e) {
                        out.println(e);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('ERROR INSERTING DATA PLEASE TRY AGAIN');");
                        out.println("location='../faculty_pages/faculty_student.jsp';");
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
