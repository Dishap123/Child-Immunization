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
  }

  h1 {
    text-align: center;
    margin-top: 20px;
  }

  form {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin: 20px;
  }

  input[type="text"],
  input[type="submit"] {
    padding: 10px;
    margin: 10px;
    width: 100%;
    max-width: 300px;
  }

  input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #45a049;
  }

  table {
    width: 100%;
    max-width: 800px;
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
    input[type="text"],
    input[type="submit"] {
      width: 90%;
    }

    table, th, td {
      display: block;
      width: 100%;
    }

    th, td {
      text-align: right;
    }

    th {
      background-color: transparent;
      color: black;
      border: none;
    }

    tr {
      margin-bottom: 10px;
      border-bottom: 2px solid #ddd;
    }
  }
</style>
</head>
<body>
<h1>Update Price</h1>
		<form action="increase.jsp">
				<input type="text" name="vname" placeholder=" Enter Vaccine Name ">
				<input type="text" name="increaseamt" placeholder=" Enter amount to increase ">
				<input type="submit" value="Submit">
		</form>
		<%
		try
		{
			String increaseamt=request.getParameter("increaseamt");
			String vname=request.getParameter("vname");
				float vprice=0;
				Connection con = ConnectDB.dbCon();
				PreparedStatement ps=con.prepareStatement(" select * from vaccine where vname=?");
				ps.setString(1,vname);
				ResultSet rs=ps.executeQuery();
				float amt=Float.parseFloat(increaseamt);
				if(rs.next())
				{
					vprice=rs.getFloat("vprice");
				}
				else
				{
					response.sendRedirect("Failed.html");
				}
				if(vprice<0)
				{
					response.sendRedirect("Failed.html");
				}
				else
				{
					vprice=vprice+amt;
				}
				PreparedStatement ps1=con.prepareStatement("update vaccine set vprice=? where vname=?");
				ps1.setFloat(1,vprice);
				ps1.setString(2,vname);
				int i=ps1.executeUpdate();
				if(i>0)
				{
					PreparedStatement ps2=con.prepareStatement(" select * from vccine where vname=?");
					ps2.setString(1,vname);
					ResultSet rs2=ps.executeQuery();
					if(rs2.next())
					{
					%>
					<table border="1" cellpadding="5" cellspacing="0"><tr>
						<th> NO </th>
						<th> Vaccine </th>
						<th> Details</th>
						<th> price</th>
						<th> Months </th>
						</tr>
						<tr>
						<td><%= rs2.getInt("vid") %></td>
						<td><%= rs2.getString("vname") %></td>
						<td><%= rs2.getString("vdetails") %></td>
						<td><%= rs2.getString("vprice") %></td>
						<td><%= rs2.getFloat("months") %></td>
						</tr>
					</table>
					<% }
					
				}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		%>
		<a href="Dashboard.html">Click here to visit menu page</a>

</body>
</html>