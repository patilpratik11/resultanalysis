<%-- 
    Document   : open_pdf
    Created on : Oct 29, 2018, 12:38:45 AM
    Author     : pRaTiK
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    Connection con;
    Statement st, st1;

    public void jspInit() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultanalysis?autoReconnect=true&useSSL=false", "root", "root");
            st = con.createStatement();

        } catch (Exception e) {
        }
    }
%>  
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SHOW PDF</title>
    </head>
    <body>

    </body>
</html>
<%
    String name = request.getParameter("name");
    ResultSet rs = st.executeQuery("SELECT pdf FROM pdf_details WHERE name='"+name+"' ");
    Blob file = null;
    byte[] fileData = null;

    if (rs.next()) {
        file = rs.getBlob("pdf");
        if (file == null) {
            out.println("file not found!");
            return;
        }
        fileData = file.getBytes(1, (int) file.length());
    } else {
        out.println("file not found!");
        return;
    }

    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", "inline");
    response.setContentLength(fileData.length);

    OutputStream output = response.getOutputStream();
    output.write(fileData);

    output.flush();
%>


