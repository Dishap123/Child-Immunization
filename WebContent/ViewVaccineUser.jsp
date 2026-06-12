<%@ page import="java.sql.*" %>
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
    background-color: #f4f4f4;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #333;
  }

  .container {
    width: 90%;
    max-width: 1200px;
    margin: 20px auto;
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
    
    th {
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
<table border="1" cellpadding="5" cellspacing="0">
		<tr>	
		<th> Vaccine No </th>
		<th> Vaccine  </th>
		<th> Details</th>
		<th> Price.</th>
		<th> Month </th>
		</tr>
			<%
			try
			{
				
				Connection con = ConnectDB.dbCon();
				PreparedStatement ps=con.prepareStatement(" select * from vaccine ");
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{%>
				<tr>
					<td><%= rs.getInt("vid") %></td>
					<td><%= rs.getString("vname") %></td>
					<td><%= rs.getString("vdetails") %></td>
					<td><%= rs.getString("vprice") %></td>
					<td><%= rs.getString("months") %></td>
				</tr>
				<% 
				}
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			%>
		</table>
		


</body>
</html>