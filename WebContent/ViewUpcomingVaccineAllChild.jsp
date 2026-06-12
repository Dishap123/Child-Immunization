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
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
        color: #333;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
    }
    caption {
        font-size: 1.5em;
        margin: 10px;
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
	PreparedStatement ps=con.prepareStatement(" select * from child");
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		dob=rs.getString("cdob");
		String cname=rs.getString("cname"); 
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
			<th> No</th>
			<th> child name  </th>
			<th> parent name</th>
			<th> date of birth</th>
			<th> parent contact.</th>
			<th>address</th>
			<th>Delete</th>
		</tr>
		<td><%= rs.getInt("cid") %></td>
					<td><%= rs.getString("cname") %></td>
					<td><%= rs.getString("pname") %></td>
					<td><%= rs.getString("cdob") %></td>
					<td><%= rs.getString("pcontact") %></td>
					<td><%= rs.getString("address") %></td>
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
	
}
catch(Exception e)
{
	e.printStackTrace();
	}
%></table>

</body>
</html>