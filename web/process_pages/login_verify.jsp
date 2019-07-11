<%-- 
    Document   : login_verify
    Created on : Mar 23, 2018, 9:47:26 AM
    Author     : pRaTiK
--%>
<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.security.MessageDigest"%>
<%@page import="java.sql.*"%>
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
            String uid = request.getParameter("uid");
            String password = request.getParameter("pwd");
            String dd = request.getParameter("dd");
            String pwd;
            MessageDigest alg;

            if (dd.equals("student")) {
                pwd = password;
            } else {
                if (dd.equals("faculty")) {
                    alg = MessageDigest.getInstance("MD5");
                } else {
                    alg = MessageDigest.getInstance("SHA");
                }

                alg.reset();

                alg.update(password.getBytes());

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

                pwd = hashedpasswd.toString();
            }
            ResultSet rs = null;

            try {
                if (uid.equalsIgnoreCase("superadmin")) {
                    if (pwd.equals("8451ba8a14d79753d34cb33b51ba46b4b025eb81")) {
                        rs = st.executeQuery("select * from resultanalysis.superadmin_details where username='" + uid + "'");
                        rs.next();
                        session.setAttribute("users_id", rs.getString("username"));
                        session.setAttribute("users_type", "superadmin");
                        session.setAttribute("login", "true");
                        response.sendRedirect("../superadmin_pages/superadmin_dashboard.jsp");
                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('INCORRECT PASSWORD..... CHECK CAPSLOCK AS WELL');");
                        out.println("location='../login_1.jsp';");
                        out.println("</script>");
                    }
                } else if (dd.equals("faculty")) {
                    rs = st.executeQuery("select * from resultanalysis.faculty_details where eid='" + uid + "'");
                } else if (dd.equals("admin")) {
                    rs = st.executeQuery("select * from resultanalysis.admin_details where username='" + uid + "'");
                } else if (dd.equals("student")) {
                    rs = st.executeQuery("select * from resultanalysis.student_details where prn='" + uid + "'");
                }

            } catch (Exception e) {
                out.println(e);
            }

            if (rs == null) {

                out.println("<script type=\"text/javascript\">");
                out.println("alert('INVALID CREDENTIALS');");
                out.println("location='../index.jsp';");
                out.println("</script>");

            } else {

                if (rs.next()) {

                    if (dd.equals("faculty")) {

                        if (pwd.equals(rs.getString("password"))) {
                            session.setAttribute("users_id", rs.getString("eid"));
                            session.setAttribute("users_type", "faculty");
                            session.setAttribute("login", "true");
                            response.sendRedirect("../faculty_pages/faculty_dashboard.jsp");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('INCORRECT PASSWORD..... CHECK CAPSLOCK AS WELL');");
                            out.println("location='../login_1.jsp';");
                            out.println("</script>");
                        }

                    } else if (dd.equals("admin")) {

                        if (pwd.equals(rs.getString("password"))) {
                            session.setAttribute("users_id", rs.getString("username"));
                            session.setAttribute("users_type", "admin");
                            session.setAttribute("login", "true");
                            response.sendRedirect("../admin_pages/admin_dashboard.jsp");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('INCORRECT PASSWORD..... CHECK CAPSLOCK AS WELL');");
                            out.println("location='../login_1.jsp';");
                            out.println("</script>");
                        }

                    } else if (dd.equals("student")) {
                            String mname=pwd.toUpperCase();
                        if (mname.equals(rs.getString("mother_name"))) {
                            session.setAttribute("users_id", rs.getString("prn"));
                            session.setAttribute("users_type", "student");
                            session.setAttribute("login", "true");
                            response.sendRedirect("../student_pages/student_dashboard.jsp");
                        } else {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('INCORRECT PASSWORD..... CHECK CAPSLOCK AS WELL');");
                            out.println("location='../login_2.jsp';");
                            out.println("</script>");
                        }

                    }

                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('INVALID CREDENTIALS');");
                    out.println("location='../index.jsp';");
                    out.println("</script>");
                }
            }
//            con.close();
//            st.close();
        %>

        <h1>PLEASE TRY AGAIN.</h1>
    </body>
</html>