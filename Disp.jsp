<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>    
<meta charset="ISO-8859-1">
<title>Tourism Management System</title>
<body style="background-image: url('https://www.twincitysecurityal.com/images/AdobeStock_297026455_1.jpeg'); background-repeat: no-repeat; background-size: cover;">
</head>
<body>
<h2><span style="color: white;">Online Guard Hiring System</span></h2>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/today?characterEncoding=latin1", "root", "Vidhya@123");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM GUARD");
%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr><th>Booking No</th><th>Guard Name</th><th>Gender</th><th>Destination</th><th>Total Cost</th></tr>
<%
    while (rs.next()) {
%>
<TR>
<TD><%=rs.getInt("Booking_No")%></TD>
<TD><%=rs.getString("Customer_Name")%></TD>
<TD><%=rs.getString("Gender")%></TD>
<TD><%=rs.getString("Destination")%></TD>
<TD><%=rs.getFloat("Total_Cost")%></TD>
</TR>
<% 
    }
    // close all the connections.
    rs.close();
    st.close();
    con.close();
} catch (Exception ex) {
%>
<font size="+3" color="red"><b>
<%
    out.println("Unable to connect to database.");
}
%>
</font>
</TABLE>
<TABLE>
<TR>
<TD>
<FORM ACTION="bank.html" method="get" >
<button type="submit"><-- back</button>
</FORM>
</TD>
</TR>
</TABLE>
</body>
</html>

