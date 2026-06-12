<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="com.disha.services.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: black;
    color: #333;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .container {
    width: 90%;
    max-width: 1200px;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  }

  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
  }

  th, td {
    border: 1px solid #ddd;
    padding: 12px;
    text-align: left;
  }

  th {
    background-color: #4CAF50;
    color: white;
  }

  tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  tr:hover {
    background-color: #ddd;
  }

  /* Responsive table */
  @media (max-width: 768px) {
    table, thead, tbody, th, td, tr {
      display: block;
    }
    
    thead tr {
      position: absolute;
      top: -9999px;
      left: -9999px;
    }

    tr {
      border: 1px solid #ddd;
      margin-bottom: 10px;
      display: block;
    }

    td {
      border: none;
      position: relative;
      padding-left: 50%;
      text-align: right;
    }

    td::before {
      content: attr(data-label);
      position: absolute;
      left: 0;
      width: 45%;
      padding-left: 10px;
      font-weight: bold;
      white-space: nowrap;
      text-align: left;
    }
  }
</style>
</head>
<body>
<% 
	try
{
	int cid=GetterSetter.getCid();
	String dob;
	Connection con = ConnectDB.dbCon();
	PreparedStatement ps=con.prepareStatement(" select cdob from child where cid=?");
	ps.setInt(1,cid);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		dob=rs.getString("cdob");
		LocalDate today=LocalDate.now();
		DateTimeFormatter formatter=DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate dateOfBirth=LocalDate.parse(dob,formatter);
		Period per=Period.between(dateOfBirth,today);
		int age=per.getYears()*12+per.getMonths();
		age=age+1;
		PreparedStatement ps1=con.prepareStatement(" select * from vaccine where months=?");
		ps1.setInt(1,age);
		ResultSet rs1=ps1.executeQuery();
		%>
		<table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>Vaccine No</th>
                <th>Vaccine</th>
                <th>Details</th>
                <th>Price</th>
                <th>Month</th>
            </tr>
            <% 
		while(rs1.next())
		{
			%>
				<tr>
	                <td><%= rs1.getInt("vid") %></td>
	                <td><%= rs1.getString("vname") %></td>
	                <td><%= rs1.getString("vdetails") %></td>
	                <td><%= rs1.getString("vprice") %></td>
	                <td><%= rs1.getString("months") %></td>
            </tr>
			<%
		}
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
%></table>
</body>
</html>