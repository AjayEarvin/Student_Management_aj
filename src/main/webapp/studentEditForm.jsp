<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>edit form</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
 	String reg=request.getParameter("register_no");
 	System.out.println(reg);
 	session.setAttribute("register_no",reg);
 	Class.forName("com.mysql.jdbc.Driver");
  	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
  	PreparedStatement st=con.prepareStatement("select * from student_login where register_no=?");
  	st.setString(1, reg);
  	ResultSet rs=st.executeQuery();
  	
  	while(rs.next())
  	{
 %>
 <form action="StudentEditDetails" method="post">
 <table>
  
 	<tr>
 		<td><label>Name</label><br><input class="box" type="text" value="<%= rs.getString("student_name") %>" name="sname" id="sname" required><br><br></td>
 	</tr>
 	<tr>
 		<td><label>Class</label><br><input class="box" type="text" value="<%= rs.getString("department_or_class") %>" name="sclass" id="sclass" required><br><br></td>
 	</tr>
 	<tr>
 		<td><label>Place</label><br><input class="box" type="text" value="<%= rs.getString("place") %>" name="splace" id="splace" required><br><br></td>
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