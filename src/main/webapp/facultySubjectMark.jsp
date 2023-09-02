<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subject</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
<%
	try{
	Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from student_details");
	
%>
<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: brown">
			<div>
				<a href="AdminMainPage.jsp" class="navbar-brand"> Student
					Management Application </a>
			</div>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Student Details</h3>
			<hr>
			<div class="container text-left">
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>STUDENT_NAME</th>
						<th>REGISTER_NO</th>
						<th>DEPARTMENT/CLASS</th>
						<th>PLACE</th>
						<th>MAIN COURSE</th>
						<th>CHANGE_SUBJECT</th>
					</tr>
				</thead>
				<tbody>
				<%
				while(rs.next())
				{
				%>
					<c:forEach>
						
							<td><%= rs.getString(1) %></td>
							<td><%= rs.getString(2) %></td>
							<td><%= rs.getString(3) %></td>
							<td><%= rs.getString(4) %></td>
							<td><%= rs.getString(5) %></td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;<a href="facultySubjectEdit.jsp?reg_no=<%= rs.getString(2) %>">Edit</a>
							</td>
						</tr>
			
					</c:forEach>
					<%}%>
				</tbody>

			</table>
		</div>
	</div>

<% 	}catch(Exception e)
   {
	e.printStackTrace();	
}
	%>
</body>
</html>