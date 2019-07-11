/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;

/**
 *


 * @author pRaTiK





 */import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import verify.VerifyRecaptcha;
/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = -6506682026701304964L;
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//hardcoded user name and password
		String userID = "jinu" ;
		String password = "jawad";
		// get request parameters for userID and password
		String user = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		// get reCAPTCHA request param
		String gRecaptchaResponse = request
				.getParameter("g-recaptcha-response");
		System.out.println(gRecaptchaResponse);
		boolean verify = VerifyRecaptcha.verify(gRecaptchaResponse);
		// get servlet config init params
		// logging example
		System.out.println("User=" + user + "::password=" + pwd + "::Captcha Verify"+verify);
		if (userID.equals(user) && password.equals(pwd) && verify) {
			response.sendRedirect("LoginSuccess.jsp");
		} else {
			RequestDispatcher rd = getServletContext().getRequestDispatcher(
					"/login.html");
			PrintWriter out = response.getWriter();
			if (verify) {
				out.println("<font color=red>Either user name or password is wrong.</font>");
			} else {
				out.println("<font color=red>You missed the Captcha.</font>");
			}
			rd.include(request, response);
		}
	}
}