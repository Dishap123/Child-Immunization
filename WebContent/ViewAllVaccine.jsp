<%@ page import="java.sql.*" %>
<%@ page import="com.disha.services.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Vaccine List</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #000;
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        background-color: #333;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
        width: 90%;
        max-width: 800px;
        text-align: center;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #555;
    }

    tr:nth-child(even) {
        background-color: #444;
    }

    a {
        color: #1E90FF;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

    .back-link {
        display: inline-block;
        margin-top: 20px;
        text-decoration: none;
        color: #1E90FF;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #FFD700;
    }
</style>
</head>
<body>
    <div class="container">
        <table border="1" cellpadding="5" cellspacing="0">
            <tr>
                <th>Vaccine No</th>
                <th>Vaccine</th>
                <th>Details</th>
                <th>Price</th>
                <th>Month</th>
                <th>Delete</th>
            </tr>
            <%
            try {
                Connection con = ConnectDB.dbCon();
                PreparedStatement ps = con.prepareStatement("SELECT * FROM vaccine");
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("vid") %></td>
                <td><%= rs.getString("vname") %></td>
                <td><%= rs.getString("vdetails") %></td>
                <td><%= rs.getString("vprice") %></td>
                <td><%= rs.getString("months") %></td>
                <td><a href="DeleteVaccine.jsp?id=<%= rs.getInt("vid") %>">Delete</a></td>
            </tr>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </table>
        <a class="back-link" href="Dashboard.html">Go Back</a>
    </div>
</body>
</html>
