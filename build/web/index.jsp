<%-- 
    Document   : index
    Created on : Oct 1, 2018, 1:46:19 AM
    Author     : Kaivalya
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Result Analysis System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="./images/c.png" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container-fluid">
            <h1 class="display-4">&nbsp;&nbsp;Result Analysis System</h1>
        </div>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark sticky-top">

            <a class="navbar-brand p-0" href="index.jsp">
                <img src="./images/c.png" alt="logo" style="width:45px;">
            </a>

            <ul class="navbar-nav ">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">HOME</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        LOGIN
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="login_2.jsp">STUDENT</a>
                        <a class="dropdown-item" href="login_1.jsp">FACULTY</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about_us.jsp">ABOUT US</a>
                </li>
            </ul>
        </nav>       

        <br><br>

        <div class="container container-fluid">

            <div class="card-deck">
                <div class="card d-block shadow p-4 mb-4 bg-white">
                    <div class="card-body text-center">
                        <img class="card-img-top" src="images/s.png" alt="Card image" style="width:50%"><br>
                        <p class="card-text">STUDENT LOGIN PAGE</p>
                        <a href="login_2.jsp" class="btn btn-outline-dark">CLICK TO LOGIN</a>
                    </div>
                </div>
                <div class="card d-block shadow p-4 mb-4 bg-white">
                    <div class="card-body text-center">
                        <img class="card-img-top" src="images/f.png" alt="Card image" style="width:50%"><br>
                        <p class="card-text">FACULTY LOGIN PAGE</p>
                        <a href="login_1.jsp" class="btn btn-outline-dark">CLICK TO LOGIN</a>
                    </div>
                </div>
            </div>

            <br><br>

        </div>
        <div class="container-fluid bg-dark">
            <br>
            <center>
                <a href="./index.jsp">
                    <img src="./images/c.png" alt="ra" class="mx-auto p-4" width="9%">
                </a>
                <p class="lead" style="color:white;"><strong>R E S U L T &nbsp;&nbsp;&nbsp; A N A L Y S I S &nbsp;&nbsp;&nbsp; S Y S T E M</strong></p>
            </center>

            <center>
                <div class="container">
                    <hr class="bg-white">
                </div>
                <a href="https://www.facebook.com/">
                    <img src="./images/fb.png" alt="fb" class="mx-auto p-4" width="7%">
                </a>
                <a href="https://plus.google.com/discover">
                    <img src="./images/gp.png" alt="fb" class="mx-auto p-4" width="7%">
                </a>
                <a href="https://www.linkedin.com/start/join">
                    <img src="./images/linkedin.png" alt="fb" class="mx-auto p-4" width="7%">
                </a>
                <a href="https://twitter.com/login?lang=en">
                    <img src="./images/twitter.png" alt="fb" class="mx-auto p-4" width="7%">
                </a>

            </center>
            <br>
            <center>
                <p class="lead" style="color:white;"><strong>&copy;CyberSpartans</strong></p>
            </center>
            <br>
        </div>
    </body>
</html>