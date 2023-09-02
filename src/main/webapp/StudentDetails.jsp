<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Details</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
                <%try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery("Select * from student_login");
                
				%>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: fuchsia">
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
			<h3 class="text-center">List of Students Users</h3>
			<hr>
			<div class="container text-left">

				<a href="addNewStudent.jsp" class="btn btn-success">Add
					New Student</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>STUDENT_NAME</th>
						<th>REGISTER_NO</th>
						<th>DEPARTMENT/CLASS</th>
						<th>PLACE</th>
						<th>PASSWORD</th>
						<th>CHANGE/DELETE</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach>
						<% while(rs.next())
						{
							String regno=rs.getString(2);
						%>
						<tr>
							<td><%= rs.getString(1)%></td>
							<td><%= rs.getString(2)%></td>
							<td><%= rs.getString(3)%></td>
							<td><%= rs.getString(4)%></td>
							<td><%= rs.getString(5)%></td>
							<td><a href="studentEditForm.jsp?register_no=<%= rs.getString(2) %> ">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
							 <a href="studentDetailsDelete.jsp?register_no=<%= rs.getString(2) %>">Delete</a></td>
						</tr>
						<% } %>
             
					</c:forEach>
		
				</tbody>

			</table>
		</div>
	</div>
           <% }
                catch(Exception e)
                {
                	e.printStackTrace();
                }
			%>

</body>
</html>