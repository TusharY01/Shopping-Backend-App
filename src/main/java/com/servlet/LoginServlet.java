package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.cert.TrustAnchor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class LoginServlet extends HttpServlet 
{
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out=resp.getWriter();
		//out.print("hello java");
		String user=req.getParameter("txtuser");
		String add=req.getParameter("txtpass");
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoping","root","");
			PreparedStatement st=con.prepareStatement("select * from customer where user=? and add=?");
			st.setString(1,user);
			st.setString(2,add);
			ResultSet rs=st.executeQuery();

			if(rs.next())
			{
				out.print("LOGIN SUCESSFULLY");
				resp.sendRedirect("Display.java");
				
			}
			else
			{
				out.print("LOGIN FAILED");
				resp.sendRedirect("Login.html");
				
			}
		}
		catch(Exception e1)
		{
			System.out.println(e1.getMessage());
		}
	}
}

