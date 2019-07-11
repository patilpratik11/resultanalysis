package org.apache.jsp.faculty_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class update_005fresult_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Manage Faculty</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"shortcut icon\" href=\"../images/c.png\" />\n");
      out.write("        <meta charset=\"UTF-8\">\n");
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
                    ResultSet rs1 = null;
                    ResultSet rs2 = null;
        
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <h1 class=\"display-4\">&nbsp;&nbsp;Result Analysis System</h1>\n");
      out.write("        </div>\n");
      out.write("        <nav class=\"navbar navbar-expand-sm bg-dark navbar-dark sticky-top\">\n");
      out.write("\n");
      out.write("            <a class=\"navbar-brand p-0\" href=\"../index.jsp\">\n");
      out.write("                <img src=\"../images/c.png\" alt=\"logo\" style=\"width:45px;\">\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("            <ul class=\"navbar-nav \">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"../admin_pages/admin_dashboard.jsp\">HOME</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"../process_pages/logout.jsp\">LOG OUT</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"#\">ABOUT US</a>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>  \n");
      out.write("        <br><br>\n");
      out.write("        <div class=\"container container-fluid\">\n");
      out.write("\n");
      out.write("            <div class=\"card\">\n");
      out.write("                <div class=\"card-header\">UPDATE STUDENT RESULT:</div>\n");
      out.write("                <div class=\"card-body\">\n");
      out.write("\n");
      out.write("                    <form action=\"../process_pages/register_faculty.jsp\" method=\"post\">\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Enter PRN:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"prn\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Exam Seat No:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"exam_no\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"sel1\" class=\"float-left\">Year:</label>\n");
      out.write("                            <select class=\"form-control\" name=\"year\" required>\n");
      out.write("                                <option value=''>please select an option</option>\n");
      out.write("                                ");

                                    rs1 = st.executeQuery("SELECT DISTINCT(year) FROM pointer_table ORDER BY year");
                                    while (rs1.next()) {
                                
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rs1.getString("year"));
      out.write('"');
      out.write('>');
      out.print(rs1.getString("year"));
      out.write("</option>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Semester No:</label>\n");
      out.write("                            <select class=\"form-control\" name=\"sem\" required>\n");
      out.write("                                <option value=''>Please Select an Option</option>\n");
      out.write("                                <option value=\"1\">1</option>\n");
      out.write("                                <option value=\"2\">2</option>\n");
      out.write("                                <option value=\"3\">3</option>\n");
      out.write("                                <option value=\"4\">4</option>\n");
      out.write("                                <option value=\"5\">5</option>\n");
      out.write("                                <option value=\"6\">6</option>\n");
      out.write("                                <option value=\"7\">7</option>\n");
      out.write("                                <option value=\"8\">8</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"sel1\" class=\"float-left\">Subject Code:</label>\n");
      out.write("                            <select class=\"form-control\" name=\"code\" required>\n");
      out.write("                                <option value=''>please select an option</option>\n");
      out.write("                                ");

                                    rs2 = st1.executeQuery("SELECT DISTINCT(subject_code) FROM subject_marks_details");
                                    while (rs2.next()) {
                                
      out.write("\n");
      out.write("                                <option value=\"");
      out.print(rs2.getString("subject_code"));
      out.write('"');
      out.write('>');
      out.print(rs2.getString("subject_code"));
      out.write("</option>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">TH:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"th\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">OE:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"oe\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">OR:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"or\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">PR:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"pr\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">TW:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"tw\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">TH Total:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"th_total\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Earned Credit:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"e_credit\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Credit Points:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"c_pts\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Grade Points:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"g_pts\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Grade:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"grade\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Total Percentage:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"t_per\" required>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Ordinance:</label>\n");
      out.write("                            <select class=\"form-control\" name=\"ord\" required>\n");
      out.write("                                <option value=''>Please Select an Option</option>\n");
      out.write("                                <option value=\"#\">#</option>\n");
      out.write("                                <option value=\"$\">$</option>\n");
      out.write("                                <option value=\"@\">@</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label class=\"lead float-left\">Status:</label>\n");
      out.write("                            <select class=\"form-control\" name=\"status\" required>\n");
      out.write("                                <option value=''>Please Select an Option</option>\n");
      out.write("                                <option value=\"P\">P</option>\n");
      out.write("                                <option value=\"F\">F</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-outline-success mx-auto m-3\">SUBMIT</button>\n");
      out.write("\n");
      out.write("                        <button type=\"button\" class=\"btn btn-outline-danger mx-auto d-block float-right m-3\">CLOSE</button>\n");
      out.write("\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("\n");
      out.write("                </div> \n");
      out.write("                <div class=\"card-footer\">Footer</div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <br><br>\n");
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
