<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Teacher Details</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
             <%
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("select * from faculty_login");
					
				%>
<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: red">
			<div>
				<a href="index.html" class="navbar-brand"> Student
					Management Application </a>
			</div>
		</nav>
	</header>
	<br>

	<div class="row">
		<div class="container">
			<h3 class="text-center">List of Faculty Users</h3>
			<hr>
			<div class="container text-left">

				<a href="addNewFaculty.jsp" class="btn btn-success">Add
					New Faculty</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>FACULTY ID</th>
						<th>STAFF NAME</th>
						<th>MAJOR SUBJECT</th>
						<th>EMAIL</th>
						<th>PHONE NUMBER</th>
						<th>PASSWORD</th>
						<th>CHANGE/DELETE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach>
					<%
					while(rs.next())
					{
					%>
						<tr>
							<td><%= rs.getString(1) %></td>
							<td><%= rs.getString(2) %></td>
							<td><%= rs.getString(3) %></td>
							<td><%= rs.getString(4) %></td>
							<td><%= rs.getString(5) %></td>
							<td><%= rs.getString(6) %></td>
							<td><a href="facultyDetailsEdit.jsp?faculty_id=<%= rs.getString(1) %> ">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
							 <a href="#">Delete</a></td>
						</tr>
             		<%}%>
					</c:forEach>
				 <%
				con.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				%>
				</tbody>

			</table>
		</div>
	</div>

</body>
</html>