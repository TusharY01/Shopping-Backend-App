<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.bean.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="2">
		<tr>
			<th>ID</th>
			<th>NAME</th>
			<th>PRICE</th>
		</tr>
		<%
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		Vector<Product> cart = (Vector) session.getAttribute("cart");
		Product p1 = new Product(id, name, price);
		cart.add(p1);
		float sum = 0;
		for (Product p : cart) {
			out.print("<tr><td>" + p.getId() + "</td><td>" + p.getName() + "</td><td> " + p.getPrice() + "</td></tr>");
			sum = sum + p.getPrice();
		}
		out.print("Total amount= " + sum);
		%>
		<form action="Logout.html">
			<input type="submit" value="logout">
		</form>
		>
	</table>
	>
</body>
</html>

