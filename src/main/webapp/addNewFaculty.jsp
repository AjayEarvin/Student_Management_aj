<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Faculty</title>
<link href="register.css" rel="stylesheet" type="text/css">
<style type="text/css">
	body{
		background: url("img/night-925414_1920.jpg");
	}
</style>
</head>
<body>
<div class="main">
  <div class="register">
  <h2>ADD FACULTY</h2>
<form action="add" method=post>
<table>
	<tr>
		<td><label>Enter new Faculty id</label><br><input class="box" type="text" name="fid" id="fid" required><br><br></td>
	</tr>
	<tr>
		<td><label>Enter name </label><br><input class="box" type="text" name="name" id="name" required><br><br></td>
	</tr>
	<tr>
		<td><label>Enter Major Subject</label><br><input class="box" type="text" name="sub" id="sub" required><br><br></td>
	</tr>
	<tr>
		<td><label>Enter Email</label><br><input class="box" type="text" name="email" id="email" required><br><br></td>
	</tr>
	<tr>
		<td><label>Enter Phone Number</label><br><input class="box" type="text" name="phn" id="phn" required><br><br></td>
	</tr>
	<tr>
		<td><label>Enter Password</label><br><input class="box" type="text" name="pwd" id="pwd" required><br><br></td>
	</tr>
	<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;<input id="submit" type="submit" value="Add Details"> </td>
		<td><a href="AdminMainPage.jsp">Back</a></td>
	</tr>
	
</table>
</form>
</div>
</div>
</body>
</html>