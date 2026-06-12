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
    background-color: black;
  }

  table {
    width: 100%;
    max-width: 1000px;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: white;
  }

  th, td {
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }

  th {
    background-color: #4CAF50;
    color: white;
  }

  tr:hover {
    background-color: #f5f5f5;
  }

  a {
    display: block;
    text-align: center;
    margin: 20px;
    text-decoration: none;
    color: #4CAF50;
  }

  /* Responsive layout */
  @media (max-width: 600px) {
    table, thead, tbody, th, td, tr {
      display: block;
      width: 100%;
    }

    th {
      text-align: right;
      padding-right: 10px;
      background-color: transparent;
      color: black;
      border: none;
    }

    tr {
      margin-bottom: 10px;
      border-bottom: 2px solid #ddd;
    }

    td {
      text-align: right;
      padding-right: 10px;
      position: relative;
    }

    td:before {
      content: attr(data-label);
      position: absolute;
      left: 0;
      width: 50%;
      padding-left: 10px;
      font-weight: bold;
      text-align: left;
    }

    a {
      display: block;
      margin: 10px 0;
    }
  }
</style>

</head>
<body>
<table border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th> No</th>
			<th> child name  </th>
			<th> parent name</th>
			<th> date of birth</th>
			<th> parent contact.</th>
			<th>address</th>
			<th>Delete</th>
		</tr>
			<%
			try
			{
				
				Connection con = ConnectDB.dbCon();
				PreparedStatement ps=con.prepareStatement(" select * from child ");
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{%>
				<tr>
					<td><%= rs.getInt("cid") %></td>
					<td><%= rs.getString("cname") %></td>
					<td><%= rs.getString("pname") %></td>
					<td><%= rs.getString("cdob") %></td>
					<td><%= rs.getString("pcontact") %></td>
					<td><%= rs.getString("address") %></td>
					<td><a href="Deletechild.jsp?id=<%=rs.getInt("cid")%>">Delete</a></td>
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
		<a href="Dashboard.html"> Go Back</a>
</body>
</html>