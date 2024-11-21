<%@ page language="java" contentType="text/html; charset=UTF-8"  
pageEncoding="UTF-8" import="java.util.* ,java.sql.*,com.bean.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user =request.getParameter("txtuser");
String pass =request.getParameter("txtpass");
if(user.equals(pass))
{

	out.print("LOGIN SUCESSFULLY");
	session.setAttribute("user", user);
	Vector<Product> cart=new Vector<Product>();
	session.setAttribute("cart", cart);
	response.sendRedirect("Display.jsp");
}
else
{
	out.print("LOGIN FAILED");
}
%>
</body>
</html>