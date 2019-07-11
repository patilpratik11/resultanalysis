<%-- 
    Document   : md5_1
    Created on : Oct 3, 2018, 12:18:55 AM
    Author     : pRaTiK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>MD5</h1>
        <form action="md5.jsp" method="post">
            <div class="form-group">
                <label for="pwd" class="float-left">ENTER PASSWORD:</label>
                <input type="password" class="form-control" name="pwd" required>
            </div>
            <div class="form-group">
                <label for="pwd" class="float-left">COPY PASTE:</label>
                <input type="text" class="form-control" name="pwd1" required>
            </div>
            <button type="submit" class="btn btn-primary">SUBMIT</button>
        </form>
    </body>
</html>
