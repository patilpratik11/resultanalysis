<%-- 
    Document   : remove_student
    Created on : Oct 7, 2018, 7:54:25 PM
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
            String prn = request.getParameter("prn");
            ResultSet count = st.executeQuery("SELECT count(*) AS c FROM student_details");
            boolean x = st1.execute("delete from student_details where prn='" + prn + "'");
            ResultSet count1 = st1.executeQuery("SELECT count(*) AS d FROM student_details");
            count.next();
            count1.next();
            int c = count.getInt("c");
            int d = count1.getInt("d");
            if (c > d) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('STUDENT REMOVED SUCCESSFULLY');");
                out.println("location='../admin_pages/manage_student.jsp';");
                out.println("</script>");
            } else {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('ERROR REMOVING STUDENT!!!!!.....PLEASE TRY AGAIN');");
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
