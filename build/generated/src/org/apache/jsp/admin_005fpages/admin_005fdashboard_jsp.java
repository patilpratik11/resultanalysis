package org.apache.jsp.admin_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class admin_005fdashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Admin Dashboard</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        <div class=\"jumbotron jumbotron-fluid\">\n");
      out.write("            <div class=\"jumbotron jumbotron-fluid\">\n");
      out.write("                <div class=\"container container-fluid\">\n");
      out.write("                    <h1>Admin Dashboard</h1>\n");
      out.write("                    <a href=\"../process_pages/logout.jsp\" class=\"btn btn-info\" role=\"button\">LOG OUT</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <nav class=\"navbar navbar-expand-sm bg-dark navbar-dark sticky-top\">\n");
      out.write("\n");
      out.write("            <a class=\"navbar-brand p-0\" href=\"../index.jsp\">\n");
      out.write("                <img src=\"../images/c.png\" alt=\"logo\" style=\"width:45px;\">\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("            <ul class=\"navbar-nav \">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"../index.jsp\">HOME</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item dropdown\">\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbardrop\" data-toggle=\"dropdown\">\n");
      out.write("                        LOGIN\n");
      out.write("                    </a>\n");
      out.write("                    <div class=\"dropdown-menu\">\n");
      out.write("                        <a class=\"dropdown-item\" href=\"../login_2.jsp\">STUDENT</a>\n");
      out.write("                        <a class=\"dropdown-item\" href=\"../login_1.jsp\">FACULTY</a>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"#\">ABOUT US</a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>  \n");
      out.write("        <br><br>\n");
      out.write("        <div class=\"container container-fluid\">\n");
      out.write("\n");
      out.write("            <div class=\"card-deck\">\n");
      out.write("                <div class=\"card d-block shadow p-4 mb-4 bg-white\">\n");
      out.write("                    <div class=\"card-body text-center\">\n");
      out.write("                        <img class=\"card-img-top\" src=\"../images/e.png\" alt=\"Card image\" style=\"width:50%\"><br>\n");
      out.write("                        <p class=\"card-text\">ADD PDF FILE IN DATABASE</p>\n");
      out.write("                        <button type=\"button\" class=\"btn btn-outline-dark\" data-toggle=\"modal\" data-target=\"#myModal\">\n");
      out.write("                            CLICK TO ADD\n");
      out.write("                        </button>\n");
      out.write("                        <!-- The Modal -->\n");
      out.write("                        <div class=\"modal fade\" id=\"myModal\">\n");
      out.write("                            <div class=\"modal-dialog modal-dialog-centered\">\n");
      out.write("                                <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                                    <!-- Modal Header -->\n");
      out.write("                                    <div class=\"modal-header\">\n");
      out.write("                                        <h4 class=\"modal-title\">UPLOAD PDF</h4>\n");
      out.write("                                        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <!-- Modal body -->\n");
      out.write("                                    <div class=\"modal-body\">\n");
      out.write("                                        <form action=\"../process_pages/upload_pdf.jsp\" method=\"post\">\n");
      out.write("                                            <div class=\"custom-file\">\n");
      out.write("                                                <input type=\"file\" class=\"custom-file-input\" id=\"customFile\">\n");
      out.write("                                                <label class=\"custom-file-label\" for=\"customFile\">Choose file</label>\n");
      out.write("                                            </div><br><br>\n");
      out.write("                                            <button type=\"submit\" class=\"btn btn-outline-success\">SUBMIT</button>\n");
      out.write("                                        </form>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                    <!-- Modal footer -->\n");
      out.write("                                    <div class=\"modal-footer\">\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-outline-danger mx-auto d-block\" data-dismiss=\"modal\">CLOSE</button>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card d-block shadow p-4 mb-4 bg-white\">\n");
      out.write("                    <div class=\"card-body text-center\">\n");
      out.write("                        <img class=\"card-img-top\" src=\"../images/e.png\" alt=\"Card image\" style=\"width:50%\"><br>\n");
      out.write("                        <p class=\"card-text\">ADD/REGISTER NEW FACULTY</p>\n");
      out.write("                        <a href=\"../login_2.jsp\" class=\"btn btn-outline-dark\">CLICK TO ADD</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card d-block shadow p-4 mb-4 bg-white\">\n");
      out.write("                    <div class=\"card-body text-center\">\n");
      out.write("                        <img class=\"card-img-top\" src=\"../images/e.png\" alt=\"Card image\" style=\"width:50%\"><br>\n");
      out.write("                        <p class=\"card-text\">REMOVE EXISTING FACULTY</p>\n");
      out.write("                        <a href=\"../login_2.jsp\" class=\"btn btn-outline-dark\">REMOVE FACULTY</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card d-block shadow p-4 mb-4 bg-white\">\n");
      out.write("                    <div class=\"card-body text-center\">\n");
      out.write("                        <img class=\"card-img-top\" src=\"../images/e.png\" alt=\"Card image\" style=\"width:50%\"><br>\n");
      out.write("                        <p class=\"card-text\">ADD/REMOVE AUDIT COURSE</p>\n");
      out.write("                        <a href=\"../login_1.jsp\" class=\"btn btn-outline-dark\">CLICK TO PROCEED</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <br><br>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
