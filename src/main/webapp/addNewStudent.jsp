<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link href="register.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="main">
  <div class="register">
  <h2>Add Student</h2>
	<form action="adduser" method="post">
	<table>
		<tr>
			<td><label>Student Name</label><br><input class="box" type="text" name="name" id="name" required><br><br></td>
		</tr>
		<tr>
			<td><label>Register Number</label><br><input class="box" type="text" name="regno" id="regno" required><br><br></td>
		</tr>
		<tr>
			<td><label>Department or Class</label><br><input class="box" type="text" name="class1" id="class1" required><br><br></td>
		</tr>
		<tr>
			<td><label>Enter Native Place</label><br><input class="box" type="text" name="place" id="place" required><br><br></td>
		</tr>
		<tr>
			<td><label>Password</label><br><input class="box" type="text" name="pwd" id="pwd" required><br><br></td>
		</tr>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="Submit" id="submit" value="Add Student"></td>
			<td><a href="AdminMainPage.jsp">Back</a></td>
		</tr>
		
	</table>
	</form>
   </div>
</div>
</body>
</html>