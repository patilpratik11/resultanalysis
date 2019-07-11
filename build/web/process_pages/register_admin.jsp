<%-- 
    Document   : register_admin
    Created on : Oct 13, 2018, 2:20:24 PM
    Author     : Kaivalya
--%>


<%@page import="java.sql.*"%>
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
                    String password = request.getParameter("pwd");
                    String password1 = request.getParameter("cnfpwd");
                    if (password.equals(password1)) {

                        MessageDigest alg;

                        alg = MessageDigest.getInstance("SHA");

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

                        String pwd = hashedpasswd.toString();

                        try {
                            PreparedStatement ps = con.prepareStatement("INSERT INTO admin_details (`username`, `password` , `college_details_id`) VALUES (?,?,?)");

                            ps.setString(1, request.getParameter("name"));
                            ps.setString(2, pwd);
                            ps.setString(3, request.getParameter("cid"));

                            ps.executeUpdate();
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('REGISTRATION SUCCESSFULL');");
                            out.println("location='../superadmin_pages/superadmin_dashboard.jsp';");
                            out.println("</script>");
                        } catch (Exception e) {
                            out.println(e);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('ERROR INSERTING DATA PLEASE TRY AGAIN');");
                            out.println("location='../superadmin_pages/superadmin_dashboard.jsp';");
                            out.println("</script>");
                        }

                    } else {
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('PASSWORDS DO NOT MATCH..... PLEASE TRY AGAIN');");
                        out.println("location='../superadmin_pages/superadmin_dashboard.jsp';");
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

