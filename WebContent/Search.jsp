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
<form action="Search.jsp">
	<input type ="text" name="vname" placeholder=" Enter Vaccine Name ">
	<br>
	<br>	
	<input type="submit" value="Search">
	</form>
	<%
	try
	{
		String searchkey=request.getParameter("vname");
		if(searchkey!=null)
		{
			Connection con = ConnectDB.dbCon();
			PreparedStatement ps=con.prepareStatement(" select * from vaccine where vname=?");
			ps.setString(1,searchkey);
			ResultSet rs=ps.executeQuery();
			%>
			<table border="1" cellpadding="5" cellspacing="0">
			<tr>	
				<th> No</th>
				<th> Vaccine </th>
				<th> Details</th>
				<th> price</th>
				<th> Month </th>
			</tr><%
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
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	%></table>
</body>
</html>