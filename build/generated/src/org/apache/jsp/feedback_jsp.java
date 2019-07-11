package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import fusioncharts.FusionCharts;
import java.sql.*;

public final class feedback_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


            Connection con;
            Statement st, st1;

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
      response.setContentType("text/html; charset=ISO-8859-1");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Result Analysis System</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"./images/c.png\" />\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("\n");
      out.write("        ");

            try {
                String temp = (String) session.getAttribute("login");
                if (temp.equals("true")) {
                    
                ResultSet rs=null;
                    rs= st.executeQuery("SELECT AVG(rating) AS avg_rating FROM feedback_details");
                    rs.next();
                    Float rating=rs.getFloat("avg_rating");
                    out.println(rating);
                    
                
        
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <h1 class=\"display-4\">&nbsp;&nbsp;Result Analysis System</h1>\n");
      out.write("        </div>\n");
      out.write("        <nav class=\"navbar navbar-expand-sm bg-dark navbar-dark sticky-top\">\n");
      out.write("\n");
      out.write("            <a class=\"navbar-brand p-0\" href=\"index.jsp\">\n");
      out.write("                <img src=\"./images/c.png\" alt=\"logo\" style=\"width:45px;\">\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("            <ul class=\"navbar-nav \">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"index.jsp\">HOME</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item dropdown\">\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbardrop\" data-toggle=\"dropdown\">\n");
      out.write("                        LOGIN\n");
      out.write("                    </a>\n");
      out.write("                    <div class=\"dropdown-menu\">\n");
      out.write("                        <a class=\"dropdown-item\" href=\"login_2.jsp\">STUDENT</a>\n");
      out.write("                        <a class=\"dropdown-item\" href=\"login_1.jsp\">FACULTY</a>\n");
      out.write("                    </div>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"#\">ABOUT US</a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>       \n");
      out.write("\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        <div class=\"container container-fluid\">\n");
      out.write("            <br>\n");
      out.write("            <center>\n");
      out.write("                <h2><ins>OUR OVERALL RATINGS</ins></h2>\n");
      out.write("            </center>\n");
      out.write("            <br>\n");
      out.write("            <br>\n");
      out.write("            <center>\n");
      out.write("                <h2><ins>PLEASE PROVIDE YOUR VALUABLE FEEDBACK</ins></h2>\n");
      out.write("            </center>\n");
      out.write("            <br>\n");
      out.write("            <div class=\"card w-50 mx-auto\">\n");
      out.write("                <div class=\"card d-block shadow p-4 mb-4 bg-white\">\n");
      out.write("                    <div class=\"card-body text-center\">\n");
      out.write("                        <form action=\"../process_pages/feedback.jsp\" method=\"post\">\n");
      out.write("                            \n");
      out.write("                            <label for=\"customRange\" class=\"lead\">RATE US&nbsp;</label><br>\n");
      out.write("                            <strong>&nbsp;0</strong>\n");
      out.write("                            <input type=\"range\" class=\"custom-range w-75\" id=\"customRange\" name=\"points\">\n");
      out.write("                            <strong>&nbsp;10</strong>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("                            <br>\n");
      out.write("                            <label for=\"comment\" class=\"lead\">FEEDBACK/SUGGESTIONS etc</label>\n");
      out.write("                            <textarea class=\"form-control\" rows=\"5\" name=\"comment\"></textarea>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-outline-success m-3\">SUBMIT</button>\n");
      out.write("                            \n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");

                }
            } catch (Exception e) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('SESSION EXPIRED PLEASE LOGIN AGAIN');");
                out.println("location='../login_2.jsp';");
                out.println("</script>");
            }

        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
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
