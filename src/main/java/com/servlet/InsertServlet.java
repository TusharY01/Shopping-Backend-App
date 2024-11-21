package com.servlet;

import java.awt.event.ActionEvent;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class InsertServlet extends HttpServlet
{
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out=resp.getWriter();
		String user=req.getParameter("txtuser");
		String add=req.getParameter("txtpass");
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shoping","root","");
			PreparedStatement st=con.prepareStatement("insert into customer values(?,?)");
			st.setString(1, user);
			st.setString(2, add);
			st.executeUpdate();
			out.print("Inserted SUCESSFULLY");
			resp.sendRedirect("Login.html");
			
			
			
		}
		catch(Exception e1)
		{
			System.out.println(e1.getMessage());
		}
	}
}
