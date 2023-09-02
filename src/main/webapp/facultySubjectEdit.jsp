<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="register.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body{
		background: url("img/night-925414_1920.jpg");
	}
</style>
</head>
<body>
<%
try{
String reg_no=request.getParameter("reg_no");
session.setAttribute("reg", reg_no);
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
PreparedStatement ps=con.prepareStatement("select * from student_details where reg_no=?");
ps.setString(1, reg_no);
ResultSet rs=ps.executeQuery();
%>
<div class="main">
  <div class="register">
  <h2>ADD FACULTY</h2>
<form action="edit" method=post>
<table>
	<%	
		while(rs.next())
		{
	%>
	<tr>
		<td><label>Enter Class or Department</label><br><input class="box"  type="text" value="<%= rs.getString(3) %>" name="dep" id="dep" required><br><br></td>
	</tr>
	<tr>
		<td><label>Course/Subject </label><br><input class="box"  type="text" value="<%= rs.getString(5) %>" name="sub" id="sub" required><br><br></td>
	</tr>
	<%} %>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="submit" type="submit" value="Save"> </td>
		<td><a href="facultyMainPage.jsp">Back</a></td>
	</tr>
	
</table>
</form>
</div>
</div>
<%}catch(Exception e)
	{
		e.printStackTrace();
	}%>
</body>
</html>