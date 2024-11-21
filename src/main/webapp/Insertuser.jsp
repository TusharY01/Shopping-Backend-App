<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%

	String user=request.getParameter("txtuser");
	String pass=request.getParameter("txtpass");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoping", "root", "");
			PreparedStatement st = con.prepareStatement("select * from costomer");
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				out.print("<tr><td>"+rs.getString(1) + " </td><td> " + rs.getString(2) + "</td></tr> ");
			}

		}
		catch (Exception e) 
		{
    out.print(e.getMessage());
		}
		%>
</body>
</html>