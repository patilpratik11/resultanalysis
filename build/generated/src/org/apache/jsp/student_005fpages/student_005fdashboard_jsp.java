package org.apache.jsp.student_005fpages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import fusioncharts.FusionCharts;
import java.sql.*;

public final class student_005fdashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \" http://www.w3.org/TR/html4/loose.dtd\" >\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student Dashboard</title>\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\n");
      out.write("        <!----------------chart script------------------->\n");
      out.write("        <script type=\"text/javascript\" src=\"../fusioncharts/js/fusioncharts.js\"></script> \n");
      out.write("        <script src=\"../fusioncharts/js/themes/fusioncharts.theme.fusion.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"jumbotron jumbotron-fluid\">\n");
      out.write("            <div class=\"container container-fluid\">\n");
      out.write("                <h1>Student Dashboard</h1>\n");
      out.write("                ");
      out.write("\n");
      out.write("                ");

                    String users_id = (String) session.getAttribute("users_id");
                    ResultSet rs = st.executeQuery("SELECT * FROM resultanalysis.student_details WHERE prn='" + users_id + "'");
                    rs.next();
                    String name = rs.getString("name");
                    String prn = rs.getString("prn");
                    Integer cg_id = rs.getInt("college_details_id");
                    Integer br_id = rs.getInt("branch_details_code");
                    ResultSet rs1 = st.executeQuery("SELECT * FROM resultanalysis.branch_details where code='" + br_id + "'");
                    rs1.next();
                    String br_nm = rs1.getString("name");
                    ResultSet rs2 = st.executeQuery("SELECT * FROM resultanalysis.college_details where id='" + cg_id + "'");
                    rs2.next();
                    String cg_nm = rs2.getString("name");
                
      out.write("\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <p class=\"lead\"><strong>PRN: </strong>");
      out.print(prn);
      out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <strong>NAME: </strong>");
      out.print(name);
      out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("                <strong>BRANCH NAME: </strong>");
      out.print(br_nm);
      out.write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>\n");
      out.write("                <strong>COLLEGE NAME: </strong>");
      out.print(cg_nm);
      out.write("\n");
      out.write("            </p>\n");
      out.write("        </div>\n");
      out.write("    <nav class=\"navbar navbar-expand-sm bg-dark navbar-dark sticky-top\">\n");
      out.write("\n");
      out.write("        <a class=\"navbar-brand p-0\" href=\"../index.jsp\">\n");
      out.write("            <img src=\"../images/c.png\" alt=\"logo\" style=\"width:45px;\">\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("        <ul class=\"navbar-nav \">\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"../student_pages/student_dashboard.jsp\">HOME</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"../process_pages/logout.jsp\">LOG OUT</a>\n");
      out.write("            </li>\n");
      out.write("            <li class=\"nav-item\">\n");
      out.write("                <a class=\"nav-link\" href=\"#\">ABOUT US</a>\n");
      out.write("            </li>\n");
      out.write("        </ul>\n");
      out.write("    </nav>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("    <div id=\"chart\" class=\"mx-auto d-block shadow-lg p-4 mb-4 bg-white w-75\">\n");
      out.write("\n");
      out.write("\n");
      out.write("        ");

            try {
                ResultSet rs3 = st.executeQuery("select *,count(*) AS cnt from resultanalysis.pointer_table where student_details_prn='" + prn + "'");
                Integer count = rs.getInt("cnt");
                out.println(count);
                Integer year[];
                year = new Integer[5];
                Float cgpa[];
                cgpa = new Float[5];
                for (int i = 0; i < 4; i++) {
                    rs3.next();
                    year[i] = rs3.getInt("year");
                    cgpa[i] = rs3.getFloat("cgpa");
                }

                // store chart config name-config value pair
                Map<String, String> chartConfig = new HashMap<String, String>();
                chartConfig.put("caption", "CGPA/SGPA ANALYSIS");
                chartConfig.put("subCaption", "YearWise");
                chartConfig.put("xAxisName", "YEAR");
                chartConfig.put("yAxisName", "CGPA");
                chartConfig.put("numberSuffix", "cgpa");
                chartConfig.put("theme", "fusion");

                //store label-value pair
                Map<Integer, Float> dataValuePair = new HashMap<Integer, Float>();

                //  rs3.next();
                for (int i = 0; i < 4; i++) {
                    dataValuePair.put(year[i], cgpa[i]);
                }

                StringBuilder jsonData = new StringBuilder();
                StringBuilder data = new StringBuilder();

                // json data to use as chart data source
                jsonData.append("{'chart':{");
                for (Map.Entry conf : chartConfig.entrySet()) {
                    jsonData.append("'" + conf.getKey() + "':'" + conf.getValue() + "',");
                }

                jsonData.replace(jsonData.length() - 1, jsonData.length(), "},");

                // build  data object from label-value pair
                data.append("'data':[");

                for (Map.Entry pair : dataValuePair.entrySet()) {
                    data.append("{'label':'" + pair.getKey() + "','value':'" + pair.getValue() + "'},");
                }
                data.replace(data.length() - 1, data.length(), "]");

                jsonData.append(data.toString());
                jsonData.append("}");

                // Create chart instance
                // charttype, chartID, width, height,containerid, data format, data
                FusionCharts firstChart = new FusionCharts(
                        "line",
                        "first_chart",
                        "800",
                        "450",
                        "chart",
                        "json",
                        jsonData.toString()
                );
        
      out.write("\n");
      out.write("\n");
      out.write("        ");
      out.print( firstChart.render());
      out.write("\n");
      out.write("        ");

            } catch (Exception e) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('WAIT FOR A YEAR KID');");
                out.println("location='../login_2.jsp';");
                out.println("</script>");
            }
        
      out.write("\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("    <div class=\"container container-fluid\">\n");
      out.write("        <div class=\"card-deck\">\n");
      out.write("            <div class=\"card d-block shadow p-4 mb-4 bg-white\">\n");
      out.write("                <div class=\"card-body text-center\">\n");
      out.write("                    <img class=\"card-img-top\" src=\"../images/e.png\" alt=\"Card image\" style=\"width:20%\"><br>\n");
      out.write("                    <p class=\"card-text\">VIEW RESULT WITHOUT BACKLOG</p>\n");
      out.write("                    <button type=\"button\" class=\"btn btn-outline-dark\" data-toggle=\"modal\" data-target=\"#myModal\">\n");
      out.write("                        VIEW\n");
      out.write("                    </button>\n");
      out.write("\n");
      out.write("                    <!-- The Modal -->\n");
      out.write("                    <div class=\"modal\" id=\"myModal\">\n");
      out.write("                        <div class=\"modal-dialog\">\n");
      out.write("                            <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                                <!-- Modal Header -->\n");
      out.write("                                <div class=\"modal-header\">\n");
      out.write("                                    <h4 class=\"modal-title\">SELECT SEMESTER </h4>\n");
      out.write("\n");
      out.write("                                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <!-- Modal body -->\n");
      out.write("                                <div class=\"modal-body\">\n");
      out.write("                                    <form action=\"view_student_result.jsp\" method=\"post\" >\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"sel1\" class=\"float-left\">Please Select:</label>\n");
      out.write("                                            <select class=\"form-control\" name=\"sem\">\n");
      out.write("                                                <option value=\"1\">1</option>\n");
      out.write("                                                <option value=\"2\">2</option>\n");
      out.write("                                                <option value=\"3\">3</option>\n");
      out.write("                                                <option value=\"4\">4</option>\n");
      out.write("                                                <option value=\"5\">5</option>\n");
      out.write("                                                <option value=\"6\">6</option>\n");
      out.write("                                                <option value=\"7\">7</option>\n");
      out.write("                                                <option value=\"8\">8</option>\n");
      out.write("                                            </select>\n");
      out.write("                                        </div>\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-outline-danger mx-auto d-block float-right m-3\" data-dismiss=\"modal\">CLOSE</button>\n");
      out.write("                                        <button type=\"submit\" class=\"btn btn-outline-success float-right m-3\">SUBMIT</button>\n");
      out.write("\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <br><br><br>\n");
      out.write("\n");
      out.write("            <div class=\"card d-block shadow p-4 mb-4 bg-white\">\n");
      out.write("                <div class=\"card-body text-center\">\n");
      out.write("                    <img class=\"card-img-top\" src=\"../images/e.png\" alt=\"Card image\" style=\"width:20%\"><br>\n");
      out.write("                    <p class=\"card-text\">VIEW BACKLOG RESULT</p>\n");
      out.write("                    <button type=\"button\" class=\"btn btn-outline-dark\" data-toggle=\"modal\" data-target=\"#myModal1\">\n");
      out.write("                        VIEW\n");
      out.write("                    </button>\n");
      out.write("\n");
      out.write("                    <!-- The Modal -->\n");
      out.write("                    <div class=\"modal\" id=\"myModal1\">\n");
      out.write("                        <div class=\"modal-dialog\">\n");
      out.write("                            <div class=\"modal-content\">\n");
      out.write("\n");
      out.write("                                <!-- Modal Header -->\n");
      out.write("                                <div class=\"modal-header\">\n");
      out.write("                                    <h4 class=\"modal-title\">SELECT SEMESTER </h4>\n");
      out.write("\n");
      out.write("                                    <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n");
      out.write("                                </div>\n");
      out.write("\n");
      out.write("                                <!-- Modal body -->\n");
      out.write("                                <div class=\"modal-body\">\n");
      out.write("                                    <form action=\"student_result_backlogs.jsp\" method=\"post\" >\n");
      out.write("                                        <div class=\"form-group\">\n");
      out.write("                                            <label for=\"sel1\" class=\"float-left\">Please Select:</label>\n");
      out.write("                                            <select class=\"form-control\" name=\"sem\">\n");
      out.write("                                                <option value=\"1\">1</option>\n");
      out.write("                                                <option value=\"2\">2</option>\n");
      out.write("                                                <option value=\"3\">3</option>\n");
      out.write("                                                <option value=\"4\">4</option>\n");
      out.write("                                                <option value=\"5\">5</option>\n");
      out.write("                                                <option value=\"6\">6</option>\n");
      out.write("                                                <option value=\"7\">7</option>\n");
      out.write("                                                <option value=\"8\">8</option>\n");
      out.write("                                            </select>\n");
      out.write("                                        </div>\n");
      out.write("                                        <button type=\"button\" class=\"btn btn-outline-danger mx-auto d-block float-right m-3\" data-dismiss=\"modal\">CLOSE</button>\n");
      out.write("                                        <button type=\"submit\" class=\"btn btn-outline-success float-right m-3\">SUBMIT</button>\n");
      out.write("\n");
      out.write("                                    </form>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <br>\n");
      out.write("    <br>\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
