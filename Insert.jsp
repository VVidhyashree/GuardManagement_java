<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tourism Management System</title>
<style>
    body {
        background-image: url('https://www.twincitysecurityal.com/images/AdobeStock_297026455_1.jpeg');
        background-repeat: no-repeat;
        background-size: cover;
        font-family: Arial, sans-serif;
        color: white;
    }
    .container {
        background-color: rgba(0, 0, 0, 0.7);
        padding: 20px;
        border-radius: 10px;
        width: 40%;
        margin: auto;
        margin-top: 50px;
    }
    table {
        width: 100%;
        margin-bottom: 20px;
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        width: 50%;
    }
    input[type="text"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border-radius: 5px;
        border: none;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    .message {
        text-align: center;
        font-size: 1.2em;
        background-color: #E3E4FA;
        color: black;
        border: 1px solid #ddd;
        padding: 10px;
        border-radius: 5px;
        margin-top: 20px;
    }
</style>
</head>
<body>
<div class="container">
    <center><h2>Online Guard hiring  System</h2></center>
    <form action="Insert.jsp" method="post">
        <table>
            <tr>
                <th>Booking No:</th>
                <td><input type="text" name="Booking_No"></td>
            </tr>
            <tr>
                <th>Guard Name:</th>
                <td><input type="text" name="Customer_Name"></td>
            </tr>
            <tr>
                <th>Gender:</th>
                <td><input type="text" name="Gender"></td>
            </tr>
            <tr>
                <th>from:</th>
                <td><input type="text" name="from"></td>
            </tr>
            <tr>
                <th>Destination:</th>
                <td><input type="text" name="Destination"></td>
            </tr>
            <tr>
                <th>Total Cost:</th>
                <td><input type="text" name="Total_Cost"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Submit"></td>
            </tr>
        </table>
    </form>

</center>

<%
int uq=0;
try {
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/today?characterEncoding=latin1", "root", "Vidhya@123");
PreparedStatement pstatement = con.prepareStatement("INSERT INTO GUARD VALUES (?, ?, ?, ?, ?)");
pstatement.setInt(1, Integer.valueOf(request.getParameter("Booking_No")));
pstatement.setString(2, request.getParameter("Customer_Name"));
pstatement.setString(3, request.getParameter("Gender"));
pstatement.setString(4, request.getParameter("Destination"));
pstatement.setFloat(5, Float.valueOf(request.getParameter("Total_Cost")));



uq=pstatement.executeUpdate();
pstatement.close();
con.close();
}
catch(Exception ex) { 
//out.println("Unable to connect to database.");
}
if (uq != 0) {
%>
<br>
<center>
<TABLE style="background-color: #E3E4FA;" 
WIDTH="30%" border="1">
<tr><th style="background-color: black">Data is inserted successfully in database.</th></tr>
</center>
</table>
<%
} %> 
</form> 
</body>
</html>
