<%-- 
    Document   : upload_pdf
    Created on : Oct 2, 2018, 6:04:53 AM
    Author     : pRaTiK
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
            String uid = (String) session.getAttribute("users_id");
            
            ResultSet rs = null;

            try {

                    rs = st.executeQuery("select * from resultanalysis.admin_details where username='" + uid + "'");

            } catch (Exception e) {
                out.println(e);
            }

            if (rs == null) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('UNDEFINED ERROR');");
                out.println("location='../admin_pages/admin_dashboard.jsp';");
                out.println("</script>");

            } else {

                if (rs.next()) {
Integer college_id=rs.getInt("college_details_id");
                }
       
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
