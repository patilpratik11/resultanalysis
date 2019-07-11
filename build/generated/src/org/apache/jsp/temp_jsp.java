package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import fusioncharts.FusionCharts;

public final class temp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\n");
      out.write("        <title>FusionCharts | Angular Gauge</title>\n");
      out.write("        <link href=\"../Styles/ChartSampleStyleSheet.css\" rel=\"stylesheet\" />\n");
      out.write("        <script type=\"text/javascript\" src=\"//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h3>Angular Gauge</h3>\n");
      out.write("        <div id=\"gauge\"></div>\n");
      out.write("        <div><span><a href=\"../Index.jsp\">Go Back</a></span></div>\n");
      out.write("        ");

            String jsonData;
            jsonData = "{        \"chart\": {            \"caption\": \"Nordstorm's Customer Satisfaction Score for 2017\",            \"lowerLimit\": \"0\",            \"upperLimit\": \"5\",            \"showValue\": \"1\",            \"numberSuffix\": \" stars\",            \"theme\": \"fusion\",            \"showToolTip\": \"0\", \"editMode\": \"1\"         },        \"colorRange\": {            \"color\": [{                \"minValue\": \"0\",                \"maxValue\": \"2\",                \"code\": \"#F2726F\"            }, {                \"minValue\": \"2\",                \"maxValue\": \"3\",                \"code\": \"#FFC533\"            }, {                \"minValue\": \"3\",                \"maxValue\": \"5\",                \"code\": \"#62B58F\"            }]        },        \"dials\": {            \"dial\": [{                \"value\": \"4.079999923706055\"            }]        }    }";

            FusionCharts gauge = new FusionCharts(
                    "angulargauge",
                    "angular_gauge",
                    "400",
                    "400",
                    "gauge",
                    "json",
                    jsonData
            );
        
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.print(gauge.render());
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
