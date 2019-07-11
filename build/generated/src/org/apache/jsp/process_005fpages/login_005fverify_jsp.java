package org.apache.jsp.process_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class login_005fverify_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title></title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write('\n');
      out.write('\n');

    String uid = request.getParameter("uid");
    String pwd = request.getParameter("pwd");
    String dd = request.getParameter("dd");
    ResultSet rs = null;
    try {
        if (dd.equals("pl")) {
            response.sendRedirect("./other_pages/invalid.jsp");
        } else if (dd.equals("faculty")) {
            rs = st.executeQuery("select * from resultanalysis.faculty_details where eid='" + uid + "'");
        } else if (dd.equals("admin")) {
            rs = st.executeQuery("select * from resultanalysis.admin_details where username='" + uid + "'");
            
        }

    } catch (Exception e) {
        out.println(e);
    }
    
    if (rs.next()) {

        if (dd.equals("faculty")) {

            if (pwd.equals(rs.getString("password"))) {
                session.setAttribute("users_id", rs.getString("eid"));
                response.sendRedirect("../faculty_pages/faculty_dashboard.jsp");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ENTER VALID CREDENTIALS');");
                out.println("location='./index.jsp';");
                out.println("</script>");
            }
        }    
        else if (dd.equals("admin")) {
            
                if (pwd.equals(rs.getString("password"))) {
                    session.setAttribute("users_id", rs.getString("username"));
                    response.sendRedirect("../admin_pages/admin_dashboard.jsp");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('ENTER VALID CREDENTIALS');");
                    out.println("location='./index.jsp';");
                    out.println("</script>");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('ENTER VALID CREDENTIALS');");
                out.println("location='./index.jsp';");
                out.println("</script>");
            }
    }

      out.write("\n");
      out.write("\n");
      out.write("        <h1>PLEASE TRY AGAIN.</h1>\n");
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
