package com.disha.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterUser
 */
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
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
		int cid=0;
		String cname=request.getParameter("cname");
		String pname=request.getParameter("pname");
		String cdob=request.getParameter("cdob");
		String pcontact=request.getParameter("pcontact");
		String address=request.getParameter("address");

		
		try
		{
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps=con.prepareStatement(" insert into child values(?,?,?,?,?,?)");
			ps.setInt(1,cid );
			ps.setString(2,cname);
			ps.setString(3,pname);
			ps.setString(4,cdob);
			ps.setString(5,pcontact);
			ps.setString(6,address);
			int i=ps.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("Dashboard.html");
			}
			else
			{
				response.sendRedirect("Failed.html");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
