<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>edit form</title>
<link href="register.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body{
		background: url("img/temple.jpg");
	}
</style>
</head>
<body>
<div class="main">
  <div class="register">
 <h2>Edit Form</h2>
 <%
 	try{
 	String staff_id=request.getParameter("faculty_id");
 	System.out.println(staff_id);
 	session.setAttribute("faculty_id",staff_id);
 	Class.forName("com.mysql.jdbc.Driver");
  	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
  	PreparedStatement st=con.prepareStatement("select * from faculty_login where faculty_id=?");
  	st.setString(1, staff_id);
  	ResultSet rs=st.executeQuery();
  	
  	while(rs.next())
  	{
 %>
 <form action="FacultyEdit" method="post">
 <table>
  
 	<tr>
 		<td><label>Faculty Name</label><br><input class="box" type="text" value="<%= rs.getString("name") %>" name="fname" id="fname" required><br><br></td>
 	</tr>
 	<tr>
 		<td><label>Major Subject</label><br><input class="box" type="text" value="<%= rs.getString("major_subject") %>" name="fsub" id="fsub" required><br><br></td>
 	</tr>
 	<tr>
 		<td><label>Email</label><br><input class="box" type="text" value="<%= rs.getString("email") %>" name="email" id="fmail" required><br><br></td>
 	</tr>
 	<tr>
 		<td><label>Phone Number</label><br><input class="box" type="text" value="<%= rs.getString("phone_number") %>" name="phn" id="phn" required><br><br></td>
 	</tr>
 	<tr>
 		<td><label>Password</label><br><input class="box" type="text" value="<%= rs.getString("password") %>" name="pwd" id="pwd" required><br><br></td>
 	</tr>
 	<tr>
 		<td><input type="submit" id="submit" value="Save"></td>
 		<td><a href="AdminMainPage.jsp">Back</a></td>
 	</tr>
 	
 </table>
 </form>
    <%}
 	}
 	catch(Exception e)
 	{
 		e.printStackTrace();
 	}
 
  	%>
  	</div>
  </div>
</body>
</html>