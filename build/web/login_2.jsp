<%-- 
    Document   : login_2
    Created on : Oct 1, 2018, 1:32:05 AM
    Author     : Kaivalya
--%>
<!DOCTYPE html>

<html>
    <head>
        <title>Student Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="./images/c.png" />
        <script src="https://www.google.com/recaptcha/api.js"></script>
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

        <br>

        <div class="container container-fluid">
            <div class="card-deck w-50 mx-auto d-block">
                <div class="card shadow-lg p-4 mb-4 bg-white">
                    <div class="card-body text-center">

                        <img src="images/lg.png" alt="login" width="20%"/><br>
                        <p class="lead">L O G I N</p>
                        <form action="./process_pages/login_verify.jsp" method="post">
                            <div class="form-group">
                                <select class="form-control" name="dd" hidden>
                                    <option value="student">STUDENT</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="usr" class="float-left">PRN:</label>
                                <input type="text" class="form-control" name="uid" required>
                            </div>
                            <div class="form-group">
                                <label  class="float-left">MOTHER'S NAME:</label>
                                <input type="text" class="form-control" name="pwd" required>
                            </div>

                            <center>
                                <div class="g-recaptcha form-group" data-sitekey="6LdATnQUAAAAAAZmVINs5T5fj4Rea6XSe75jM05b" >
                                </div>
                            </center>
                            <button type="submit" class="btn btn-primary">SUBMIT</button>
                        </form>
                    </div>
                </div>
            </div>      
            <br><br>
        </div>
        <div class="container-fluid">
            <footer class="bg-dark">
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
            </footer>
        </div>
    </body>
</html>