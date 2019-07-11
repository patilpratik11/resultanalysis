<%-- 
    Document   : verify_result
    Created on : Oct 13, 2018, 3:15:57 PM
    Author     : pRaTiK
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.security.MessageDigest"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="../images/c.png" />
        <title>loading...</title>
    </head>
    <body>
        <%!
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
        %>

        <%

            try {
                String temp = (String) session.getAttribute("login");
                String users_id = (String) session.getAttribute("users_id");

                if (temp.equals("true")) {
                    // String users_id = (String) session.getAttribute("users_id");
                    ResultSet rs = st.executeQuery("select * from resultanalysis.faculty_details where eid='" + users_id + "'");

                    rs.next();
                    Integer cid = rs.getInt("college_details_id");
                    String bid = rs.getString("branch_details_code");
                    out.println(cid);
                    out.println(bid);
                    String prn = request.getParameter("prn");
                    String exam_no = request.getParameter("exam_no");
                    String year = request.getParameter("year");
                    String sem_no = request.getParameter("sem");
                    int sem = Integer.parseInt(sem_no);

                    String code = request.getParameter("code");
                    int subject_code = Integer.parseInt(code);

                    String t_mark = request.getParameter("th");
                    int th = Integer.parseInt(t_mark);

                    String o_mark = request.getParameter("oe");
                    int oe = Integer.parseInt(o_mark);

                    String i_mark = request.getParameter("in");
                    int in = Integer.parseInt(i_mark);

                    String or_mark = request.getParameter("or");
                    int or = Integer.parseInt(or_mark);

                    String pr_mark = request.getParameter("pr");
                    int pr = Integer.parseInt(pr_mark);

                    String tw_mark = request.getParameter("tw");
                    int tw = Integer.parseInt(tw_mark);

                    String th_to = request.getParameter("th_total");
                    int th_total = Integer.parseInt(th_to);

                    String to_mrk = request.getParameter("total_marks");
                    int total_marks = Integer.parseInt(to_mrk);

                    String earned_credit = request.getParameter("e_credit");
                    int ec = Integer.parseInt(earned_credit);

                    String credit_pt = request.getParameter("c_pts");
                    int cp = Integer.parseInt(credit_pt);

                    String grade_pt = request.getParameter("g_pts");
                    int gp = Integer.parseInt(grade_pt);

                    String grade = request.getParameter("grade");

                    String total_per = request.getParameter("t_per");
                    String ordinance = request.getParameter("ord");
                    String status = request.getParameter("status");

                    
                        ResultSet rs1 = st.executeQuery("select * from resultanalysis.student_details where college_details_id='" + cid + "' and branch_details_code='" + bid + "'");
                        while (rs1.next()) {
                            if (prn.equals(rs1.getString("prn"))) {
                                try{
                                PreparedStatement ps = con.prepareStatement("INSERT INTO resultanalysis.result_marks (`exam_seat_no`, `th`, `oe`, `in`, `or`, `pr`,`tw`,`total_marks`,`sem_no`,`th_total`) VALUES (?,?,?,?,?,?,?,?,?,?)");
                                ps.setString(1, exam_no);
                                ps.setInt(2, th);
                                ps.setInt(3, oe);
                                ps.setInt(4, in);
                                ps.setInt(5, or);
                                ps.setInt(6, pr);
                                ps.setInt(7, tw);
                                ps.setInt(8, total_marks);
                                ps.setInt(9, sem);
                                ps.setInt(10, th_total);

                                ps.executeUpdate();
                                
                                ResultSet rs2=st1.executeQuery("SELECT * FROM resultanalysis.result_marks ORDER BY id DESC LIMIT 1 ");
                                rs2.next();
                                int id =rs2.getInt("id");
                                
                                PreparedStatement ps1 = con.prepareStatement("INSERT INTO resultanalysis.result_log (`exam_seat_no`, `year_attempting`, `earned_credit`,`credit_points` ,`grade_points`, `grade`, `total_percentage`,`status`,`ordinance`,`sem_no`,`student_details_prn`,`student_details_college_details_id`,`student_details_branch_details_code`,`subject_marks_details_subject_code`,`result_marks_id`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
                                ps1.setString(1, exam_no);
                                ps1.setString(2, year);
                                ps1.setInt(3, ec);
                                ps1.setInt(4,cp);
                                ps1.setInt(5, gp);
                                ps1.setString(6, grade);
                                ps1.setString(7, total_per);
                                ps1.setString(8, status);
                                ps1.setString(9, ordinance);
                                ps1.setInt(10, sem);
                                ps1.setString(11, prn);
                                ps1.setInt(12, cid);
                                ps1.setString(13, bid);
                                ps1.setString(14, code);
                                ps1.setInt(15, id);
                                ps1.executeUpdate();
                                out.println("<script type=\"text/javascript\">");
                            out.println("alert('JHAL REEEEEEE!!!!!!!!');");
                            out.println("location='../faculty_pages/faculty_dashboard.jsp';");
                            out.println("</script>");
                                
                            }catch (Exception e) {
                            out.println(e);
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('ERROR INSERTING DATA PLEASE TRY AGAIN');");
                            out.println("location='../faculty_pages/update_result.jsp';");
                            out.println("</script>");

                        }
                       
                        }
                           
                        } 
                        

                }
            } catch (Exception e) {
                out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('SESSION EXPIRED PLEASE LOGIN AGAIN');");
                //out.println("location='../login_1.jsp';");
                out.println("</script>");
            }

        %>
    </body>
</html>
