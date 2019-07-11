package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class about_005fus_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<html>\n");
      out.write("<head></head>\n");
      out.write("<body>\n");
      out.write("<!-- Footer -->\n");
      out.write("<footer class=\"page-footer font-small indigo\">\n");
      out.write("\n");
      out.write("    <!-- Footer Links -->\n");
      out.write("    <div class=\"container\">\n");
      out.write("\n");
      out.write("      <!-- Grid row-->\n");
      out.write("      <div class=\"row text-center d-flex justify-content-center pt-5 mb-3\">\n");
      out.write("\n");
      out.write("        <!-- Grid column -->\n");
      out.write("        <div class=\"col-md-2 mb-3\">\n");
      out.write("          <h6 class=\"text-uppercase font-weight-bold\">\n");
      out.write("            <a href=\"#!\">About us</a>\n");
      out.write("          </h6>\n");
      out.write("        </div>\n");
      out.write("        <!-- Grid column -->\n");
      out.write("\n");
      out.write("        <!-- Grid column -->\n");
      out.write("        <div class=\"col-md-2 mb-3\">\n");
      out.write("          <h6 class=\"text-uppercase font-weight-bold\">\n");
      out.write("            <a href=\"#!\">Products</a>\n");
      out.write("          </h6>\n");
      out.write("        </div>\n");
      out.write("        <!-- Grid column -->\n");
      out.write("\n");
      out.write("        <!-- Grid column -->\n");
      out.write("        <div class=\"col-md-2 mb-3\">\n");
      out.write("          <h6 class=\"text-uppercase font-weight-bold\">\n");
      out.write("            <a href=\"#!\">Awards</a>\n");
      out.write("          </h6>\n");
      out.write("        </div>\n");
      out.write("        <!-- Grid column -->\n");
      out.write("\n");
      out.write("        <!-- Grid column -->\n");
      out.write("        <div class=\"col-md-2 mb-3\">\n");
      out.write("          <h6 class=\"text-uppercase font-weight-bold\">\n");
      out.write("            <a href=\"#!\">Help</a>\n");
      out.write("          </h6>\n");
      out.write("        </div>\n");
      out.write("        <!-- Grid column -->\n");
      out.write("\n");
      out.write("        <!-- Grid column -->\n");
      out.write("        <div class=\"col-md-2 mb-3\">\n");
      out.write("          <h6 class=\"text-uppercase font-weight-bold\">\n");
      out.write("            <a href=\"#!\">Contact</a>\n");
      out.write("          </h6>\n");
      out.write("        </div>\n");
      out.write("        <!-- Grid column -->\n");
      out.write("\n");
      out.write("      </div>\n");
      out.write("      <!-- Grid row-->\n");
      out.write("      <hr class=\"rgba-white-light\" style=\"margin: 0 15%;\">\n");
      out.write("\n");
      out.write("      <!-- Grid row-->\n");
      out.write("      <div class=\"row d-flex text-center justify-content-center mb-md-0 mb-4\">\n");
      out.write("\n");
      out.write("        <!-- Grid column -->\n");
      out.write("        <div class=\"col-md-8 col-12 mt-5\">\n");
      out.write("          <p style=\"line-height: 1.7rem\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem\n");
      out.write("            aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\n");
      out.write("            Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur.</p>\n");
      out.write("        </div>\n");
      out.write("        <!-- Grid column -->\n");
      out.write("\n");
      out.write("      </div>\n");
      out.write("      <!-- Grid row-->\n");
      out.write("      <hr class=\"clearfix d-md-none rgba-white-light\" style=\"margin: 10% 15% 5%;\">\n");
      out.write("\n");
      out.write("      <!-- Grid row-->\n");
      out.write("      <div class=\"row pb-3\">\n");
      out.write("\n");
      out.write("        <!-- Grid column -->\n");
      out.write("        <div class=\"col-md-12\">\n");
      out.write("\n");
      out.write("          <div class=\"mb-5 flex-center\">\n");
      out.write("\n");
      out.write("            <!-- Facebook -->\n");
      out.write("            <a class=\"fb-ic\">\n");
      out.write("              <i class=\"fa fa-facebook fa-lg white-text mr-4\"> </i>\n");
      out.write("            </a>\n");
      out.write("            <!-- Twitter -->\n");
      out.write("            <a class=\"tw-ic\">\n");
      out.write("              <i class=\"fa fa-twitter fa-lg white-text mr-4\"> </i>\n");
      out.write("            </a>\n");
      out.write("            <!-- Google +-->\n");
      out.write("            <a class=\"gplus-ic\">\n");
      out.write("              <i class=\"fa fa-google-plus fa-lg white-text mr-4\"> </i>\n");
      out.write("            </a>\n");
      out.write("            <!--Linkedin -->\n");
      out.write("            <a class=\"li-ic\">\n");
      out.write("              <i class=\"fa fa-linkedin fa-lg white-text mr-4\"> </i>\n");
      out.write("            </a>\n");
      out.write("            <!--Instagram-->\n");
      out.write("            <a class=\"ins-ic\">\n");
      out.write("              <i class=\"fa fa-instagram fa-lg white-text mr-4\"> </i>\n");
      out.write("            </a>\n");
      out.write("            <!--Pinterest-->\n");
      out.write("            <a class=\"pin-ic\">\n");
      out.write("              <i class=\"fa fa-pinterest fa-lg white-text\"> </i>\n");
      out.write("            </a>\n");
      out.write("\n");
      out.write("          </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <!-- Grid column -->\n");
      out.write("\n");
      out.write("      </div>\n");
      out.write("      <!-- Grid row-->\n");
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <!-- Footer Links -->\n");
      out.write("\n");
      out.write("    <!-- Copyright -->\n");
      out.write("    <div class=\"footer-copyright text-center py-3\">© 2018 Copyright:\n");
      out.write("      <a href=\"https://mdbootstrap.com/bootstrap-tutorial/\"> MDBootstrap.com</a>\n");
      out.write("    </div>\n");
      out.write("    <!-- Copyright -->\n");
      out.write("\n");
      out.write("  </footer>\n");
      out.write("  <!-- Footer -->\n");
      out.write("</body>\n");
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
