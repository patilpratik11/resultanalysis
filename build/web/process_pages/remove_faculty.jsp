<%-- 
    Document   : remove_faculty
    Created on : Oct 4, 2018, 7:48:50 PM
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
            Statement st1;
            public void jspInit() {
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultanalysis?autoReconnect=true&useSSL=false", "root", "root");
                    st = con.createStatement();
                    st1= con.createStatement();
                } catch (Exception e) {
                    System.out.println(e);
                }
            }
        %>

        <%
            
            try {
                String temp = (String) session.getAttribute("login");
                if (temp.equals("true")) {
            String eid = request.getParameter("eid");
            ResultSet count= st.executeQuery("SELECT count(*) AS c FROM faculty_details");
            boolean x = st1.execute("delete from faculty_details where eid='" + eid + "'");
            ResultSet count1= st1.executeQuery("SELECT count(*) AS d FROM faculty_details");
            count.next();
            count1.next();
            int c=count.getInt("c");
            int d=count1.getInt("d");
            if (c > d) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('FACULTY REMOVED SUCCESSFULLY');");
                out.println("location='../admin_pages/manage_faculty.jsp';");
                out.println("</script>");
            } else {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('ERROR REMOVING FACULTY!!!!!.....PLEASE TRY AGAIN');");
                out.println("location='../admin_pages/manage_faculty.jsp';");
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
