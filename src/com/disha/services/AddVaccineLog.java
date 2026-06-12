package com.disha.services;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddVaccineLog
 */
public class AddVaccineLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddVaccineLog() {
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
		int vlid=0;
		int cid=Integer.parseInt(request.getParameter("cid"));
		String vname=request.getParameter("vname");
		String date=request.getParameter("date");
		int agemonths=Integer.parseInt(request.getParameter("agemonths"));
		
		try
		{
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps=con.prepareStatement(" insert into vaccinelogs values(?,?,?,?,?)");
			ps.setInt(1,vlid );
			ps.setInt(2,cid);
			ps.setString(3,vname);
			ps.setString(4,date);
			ps.setInt(5, agemonths);
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
