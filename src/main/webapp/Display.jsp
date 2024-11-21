<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,com.bean.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="2">
<tr><th>ID</th><th>NAME</th><th>PRICE</th></tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoping", "root", "");
	PreparedStatement st = con.prepareStatement("select * from product");
	ResultSet rs = st.executeQuery();
	while (rs.next()) {
		out.print("<tr><td>"+rs.getInt(1) + " </td><td> " + rs.getString(2) + "</td><td> "+rs.getFloat(3)+"</td><td><a href= 'Addtocart.jsp?id="+rs.getInt(1)+"&name="+rs.getString(2)+"&price="+rs.getFloat(3)+"'>Add to cart</a></td></tr>");
}
}
catch(Exception e)
{
	e.getMessage();
}
%>
</table>
</body>
</html>