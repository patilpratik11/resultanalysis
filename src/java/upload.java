/*@author pRaTiK
*/
import java.sql.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

@WebServlet("/test")
@MultipartConfig(maxFileSize = 16177215)

public class upload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('PDF UPLOADED SUCCESSFULLY');");
            out.println("location='./admin_pages/admin_dashboard.jsp';");
            out.println("</script>");
        } catch (Exception e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('ERROR.....PLEASE UPLOAD AGAIN');");
            out.println("location='./admin_pages/admin_dashboard.jsp';");
            out.println("</script>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/resultanalysis?autoReconnect=true&useSSL=false", "root", "root");
            
            String name=request.getParameter("name");
            String username=request.getParameter("username");
            String college=request.getParameter("college");
            System.out.println(college);
            System.out.println(name);
            
            System.out.println(username);
            ps = con.prepareStatement("INSERT INTO `pdf_details` (name,timestamp,pdf,admin_details_username,admin_details_college_details_id) VALUES ('"+name+"',NOW(),?,'"+username+"',"+college+") ");

                Part filePart = request.getPart("file");
                InputStream is = filePart.getInputStream();
                ps.setBinaryStream(1, is, (int) filePart.getSize());
                
            ps.executeUpdate();

            con.close();
            ps.close();
        } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}