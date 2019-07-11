<%-- 
    Document   : change_password
    Created on : Oct 7, 2018, 10:11:59 PM
    Author     : pRaTiK
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.security.MessageDigest"%>
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
            String users_type = (String) session.getAttribute("users_type");
            String oldpwd = request.getParameter("oldpwd");
            String newpwd = request.getParameter("newpwd");
            String cnfpwd = request.getParameter("cnfpwd");

            if (newpwd.equals(cnfpwd)) {

                MessageDigest alg;
                if (users_type.equals("admin")) {
                    alg = MessageDigest.getInstance("SHA");
                } else {
                    alg = MessageDigest.getInstance("MD5");
                }

                alg.reset();

                alg.update(oldpwd.getBytes());

                byte[] digest = alg.digest();

                StringBuffer hashedpasswd = new StringBuffer();
                String hx;
                for (int i = 0; i < digest.length; i++) {
                    hx = Integer.toHexString(0xFF & digest[i]);
                    //0x03 is equal to 0x3, but we need 0x03 for our md5sum
                    if (hx.length() == 1) {
                        hx = "0" + hx;
                    }
                    hashedpasswd.append(hx);
                }

                String oldpwd1 = hashedpasswd.toString();

                MessageDigest alg1;
                if (users_type.equals("admin")) {
                    alg1 = MessageDigest.getInstance("SHA");
                } else {
                    alg1 = MessageDigest.getInstance("MD5");
                }

                alg1.reset();

                alg1.update(newpwd.getBytes());

                byte[] digest1 = alg1.digest();

                StringBuffer hashedpasswd1 = new StringBuffer();
                String hx1;
                for (int i = 0; i < digest1.length; i++) {
                    hx1 = Integer.toHexString(0xFF & digest1[i]);
                    //0x03 is equal to 0x3, but we need 0x03 for our md5sum
                    if (hx1.length() == 1) {
                        hx1 = "0" + hx1;
                    }
                    hashedpasswd1.append(hx1);
                }

                String newpwd1 = hashedpasswd1.toString();

                ResultSet rs = null;
                if (users_type.equals("admin")) {
                    rs = st.executeQuery("SELECT password FROM admin_details WHERE username='" + users_id + "'");
                    rs.next();
                    if (oldpwd1.equals(rs.getString("password"))) {
                        st.executeUpdate("UPDATE admin_details SET password='" + newpwd1 + "' WHERE username='" + users_id + "'");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('PASSWORD UPDATED SUCCESSFULLY');");
                        out.println("location='../admin_pages/admin_dashboard.jsp';");
                        out.println("</script>");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('INCORRECT PASSWORD...... PLEASE TRY AGAIN');");
                        out.println("location='../admin_pages/admin_dashboard.jsp';");
                        out.println("</script>");
                    }
                } else if (users_type.equals("faculty")) {
                    rs = st.executeQuery("SELECT password FROM faculty_details WHERE eid='" + users_id + "'");
                    rs.next();
                    if (oldpwd1.equals(rs.getString("password"))) {
                        st.executeUpdate("UPDATE faculty_details SET password='" + newpwd1 + "' WHERE eid='" + users_id + "'");
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('PASSWORD UPDATED SUCCESSFULLY');");
                        out.println("location='../faculty_pages/faculty_dashboard.jsp';");
                        out.println("</script>");
                    } else {

                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('INCORRECT PASSWORD...... PLEASE TRY AGAIN');");
                        out.println("location='../faculty_pages/faculty_dashboard.jsp';");
                        out.println("</script>");
                    }

                } else if (users_type.equals("student")) {

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('ERROR..... UNAUTHORIZED USER');");
                    out.println("location='../student_pages/student_dashboard.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('ERROR..... UNAUTHORIZED USER');");
                    out.println("location='../index.jsp';");
                    out.println("</script>");
                }
            } else {
                if (users_type.equals("faculty")) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('PASSWORDS DO NOT MATCH..... PLEASE ENTER CAREFULLY');");
                    out.println("location='../faculty_pages/faculty_dashboard.jsp';");
                    out.println("</script>");
                } else if (users_type.equals("admin")) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('PASSWORDS DO NOT MATCH..... PLEASE ENTER CAREFULLY');");
                    out.println("location='../admin_pages/admin_dashboard.jsp';");
                    out.println("</script>");
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
