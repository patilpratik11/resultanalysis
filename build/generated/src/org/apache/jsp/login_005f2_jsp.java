package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_005f2_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

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
      response.setContentType("text/html");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Student Login</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"jumbotron jumbotron-fluid\">\n");
      out.write("            <div class=\"container container-fluid\">\n");
      out.write("                <a href=\"index.html\">\n");
      out.write("                    <img src=\"./images/b.png\" class=\"img-fluid float-left\" alt=\"logo\" style=\"width:12%\">\n");
      out.write("                </a>\n");
      out.write("                <br><h1>RESULT ANALYSIS SYSTEM</h1>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <nav class=\"navbar navbar-expand-sm bg-dark navbar-dark sticky-top\">\n");
      out.write("          <a class=\"navbar-brand\" href=\"index.html\">\n");
      out.write("            <img src=\"./images/b.png\" alt=\"logo\" style=\"width:40px;\">\n");
      out.write("          </a>\n");
      out.write("\n");
      out.write("          <ul class=\"navbar-nav\">\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link\" href=\"index.html\">HOME</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("              <a class=\"nav-link\" href=\"#\">LOGIN</a>\n");
      out.write("            </li>\n");
      out.write("          </ul>\n");
      out.write("        </nav>       \n");
      out.write("        \n");
      out.write("        <br><br>\n");
      out.write("        \n");
      out.write("        <div class=\"container container-fluid\">\n");
      out.write("            <div class=\"card-deck w-50 mx-auto d-block shadow-lg p-4 mb-4 bg-white\">\n");
      out.write("                <div class=\"card text-black\">\n");
      out.write("                    <div class=\"card-body text-center\">\n");
      out.write("                        <p class=\"card-text lead\">L O G I N</p><br>\n");
      out.write("                        <form action=\"./process_pages/login_verify.jsp\" method=\"post\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <select class=\"form-control\" name=\"dd\" hidden>\n");
      out.write("                                    <option value=\"student\">STUDENT</option>\n");
      out.write("                                </select>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"usr\" class=\"float-left\">PRN:</label>\n");
      out.write("                              <input type=\"text\" class=\"form-control\" name=\"uid\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                              <label for=\"pwd\" class=\"float-left\">MOTHER'S NAME:</label>\n");
      out.write("                              <input type=\"password\" class=\"form-control\" name=\"pwd\">\n");
      out.write("                            </div>\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">SUBMIT</button>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>      \n");
      out.write("            <br><br>\n");
      out.write("        </div>\n");
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
