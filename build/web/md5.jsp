<%@page contentType="text/html; charset=iso-8859-1" language="java" import="java.security.MessageDigest"%>
<html>
<body>
<%

String passwd = request.getParameter("pwd");
String passwd1 = request.getParameter("pwd1");
out.println("Password recieved: " + passwd + ".<br>");

MessageDigest alg = MessageDigest.getInstance("SHA");

alg.reset();

alg.update(passwd.getBytes());

byte[] digest = alg.digest();

StringBuffer hashedpasswd = new StringBuffer();
String hx;
for (int i=0;i<digest.length;i++){
	hx =  Integer.toHexString(0xFF & digest[i]);
	//0x03 is equal to 0x3, but we need 0x03 for our md5sum
	if(hx.length() == 1){hx = "0" + hx;}
	hashedpasswd.append(hx);
}

out.println("AFTER SHA ENCRYPTION: " + hashedpasswd.toString() + "<br>");
out.println("KR LO COMPARE: " + passwd1 + "<br>");
%>
</body>
</html>
