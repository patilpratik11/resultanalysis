package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import fusioncharts.FusionCharts;

public final class temp1_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write(" \n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<title>FusionCharts | Export Chart As Image (client-side)</title>\n");
      out.write("<link href=\"./scripts/ChartSampleStyleSheet.css\" rel=\"stylesheet\" />\n");
      out.write("<script type=\"text/javascript\" src=\"//cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js\"></script>\n");
      out.write("   <script type=\"text/javascript\" src=\"//cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js\"></script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<h3>Export Chart As Image (client-side)</h3>\n");
      out.write("<div id=\"export_enabled_chart\"></div>\n");
      out.write("<div><span><a href=\"../Index.jsp\">Go Back</a></span></div>\n");

        String jsonData;
        jsonData = "{'chart':{'caption':'Countries With Most Oil Reserves [2017-18]','subCaption':'In MMbbl = One Million barrels','xAxisName':'Country','yAxisName':'Reserves (MMbbl)','numberSuffix':'K','theme':'fusion','exportEnabled':'1'},'data':[{'label':'Venezuela','value':'290'},{'label':'Saudi','value':'260'},{'label':'Canada','value':'180'},{'label':'Iran','value':'140'},{'label':'Russia','value':'115'},{'label':'UAE','value':'100'},{'label':'US','value':'30'},{'label':'China','value':'30'}]}";
    	
        FusionCharts column_chart = new FusionCharts(
      			  "column2d",
     		      "column_chart",
     		      "700", 
     		      "400",
     		      "export_enabled_chart",
     		      "json",
     		      jsonData      		      
      			);
        
      out.write("\n");
      out.write("   \n");
      out.write("\t\t");
      out.print(column_chart.render());
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
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
