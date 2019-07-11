<%-- 
    Document   : manage_audit_course
    Created on : Oct 4, 2018, 6:26:23 PM
    Author     : Kaivalya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Audit Course</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="../images/c.png" />
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            try {
                String temp = (String) session.getAttribute("login");
                if (temp.equals("true")) {
        %>
        <script type="text/javascript">
            function checkdropdown() {
                if (document.getElementById('select').value != "") {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <div class="container-fluid">
            <h1 class="display-4">&nbsp;&nbsp;Result Analysis System</h1>
        </div>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">

            <a class="navbar-brand p-0" href="../index.jsp">
                <img src="../images/c.png" alt="logo" style="width:45px;">
            </a>

            <ul class="navbar-nav ">
                <li class="nav-item">
                    <a class="nav-link" href="../admin_pages/admin_dashboard.jsp">HOME</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../process_pages/logout.jsp">LOG OUT</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../about_us.jsp">ABOUT US</a>
                </li>
            </ul>
        </nav>  
        <br><br>
        <div class="container container-fluid">

            <div class="card-deck mx-auto w-75">

                <div class="card d-block shadow p-4 mb-4 bg-white">
                    <div class="card-body text-center">
                        <img class="card-img-top" src="../images/add.png" alt="Card image" style="width:30%"><br>
                        <p class="card-text">ADD NEW AUDIT COURSE</p>
                        <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal">
                            ADD
                        </button>
                        <!-- The Modal -->
                        <div class="modal fade" id="myModal">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title ">ENTER AUDIT COURSE DETAILS</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <form action="../process_pages/add_audit_course.jsp" method="post">
                                            <div class="form-group">
                                                <label class="lead float-left">Course Code:</label>
                                                <input type="text" class="form-control" name="code" required>
                                            </div>
                                            <div class="form-group">
                                                <label class="lead float-left">Course Name:</label>
                                                <input type="text" class="form-control" name="name" required>
                                            </div>
                                            <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                            <button type="submit" onClick='if (!checkdropdown()) {
                                                        alert("You need to select a value!");
                                                        return false;
                                                    }' class="btn btn-outline-success float-right m-3">ADD</button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card d-block shadow p-4 mb-4 bg-white">
                    <div class="card-body text-center">
                        <img class="card-img-top" src="../images/rm.png" alt="Card image" style="width:30%"><br>
                        <p class="card-text">REMOVE EXISTING AUDIT COURSE</p>
                        <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal1">
                            REMOVE
                        </button>
                        <!-- The Modal -->
                        <div class="modal fade" id="myModal1">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">

                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title ">ENTER AUDIT COURSE CODE CAREFULLY</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>

                                    <!-- Modal body -->
                                    <div class="modal-body">
                                        <form action="../process_pages/remove_audit_course.jsp" method="post">
                                            <div class="form-group">
                                                <label class="lead float-left">Course Code:</label>
                                                <input type="text" class="form-control" name="code" required>
                                            </div>
                                            <button type="button" class="btn btn-outline-danger mx-auto d-block float-right m-3" data-dismiss="modal">CLOSE</button>
                                            <button type="submit" onClick='if (!checkdropdown()) {
                                                        alert("You need to select a value!");
                                                        return false;
                                                    }' class="btn btn-outline-success float-right m-3">REMOVE</button>
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br><br>
        </div>
        <div class="container-fluid">
            <footer class="bg-dark">
                <br>
                <center>
                    <a href="../index.jsp">
                        <img src="../images/c.png" alt="ra" class="mx-auto p-4" width="9%">
                    </a>
                    <p class="lead" style="color:white;"><strong>R E S U L T &nbsp;&nbsp;&nbsp; A N A L Y S I S &nbsp;&nbsp;&nbsp; S Y S T E M</strong></p>
                </center>

                <center>
                    <div class="container">
                        <hr class="bg-white">
                    </div>
                    <a href="https://www.facebook.com/">
                        <img src="../images/fb.png" alt="fb" class="mx-auto p-4" width="7%">
                    </a>
                    <a href="https://plus.google.com/discover">
                        <img src="../images/gp.png" alt="fb" class="mx-auto p-4" width="7%">
                    </a>
                    <a href="https://www.linkedin.com/start/join">
                        <img src="../images/linkedin.png" alt="fb" class="mx-auto p-4" width="7%">
                    </a>
                    <a href="https://twitter.com/login?lang=en">
                        <img src="../images/twitter.png" alt="fb" class="mx-auto p-4" width="7%">
                    </a>

                </center>
                <br>
                <center>
                    <p class="lead" style="color:white;"><strong>&copy;CyberSpartans</strong></p>
                </center>
                <br>
            </footer>
        </div>
        <%
                }
            } catch (Exception e) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('SESSION EXPIRED PLEASE LOGIN AGAIN');");
                out.println("location='../login_2.jsp';");
                out.println("</script>");
            }

        %>
    </body>
</html>


