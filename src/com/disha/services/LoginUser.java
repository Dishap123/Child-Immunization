package com.disha.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginUser
 */
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try
		{
		String cname =request.getParameter("cname");
		String pcontact =request.getParameter("pcontact");
		Connection con = ConnectDB.dbCon();
		PreparedStatement ps = con.prepareStatement("select * from child where cname=? and pcontact=?");
		ps.setString(1, cname);
		ps.setString(2, pcontact);
		ResultSet rs= ps.executeQuery();
	
		if(rs.next())
		{
			
			GetterSetter.setCid(rs.getInt("cid"));
			response.sendRedirect("WelcomeUser.html");
		}
		else
		{
			response.sendRedirect("index.html");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
