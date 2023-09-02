<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<%
	String reg=request.getParameter("register_no");
	 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
	PreparedStatement ps=con.prepareStatement("delete from student_login where register_no=?");
	ps.setString(1, reg);
	 ps.executeUpdate(); 
	 RequestDispatcher rd=request.getRequestDispatcher("/StudentDetails.jsp");
	 rd.forward(request, response);
	 
	%>
</body>
</html>