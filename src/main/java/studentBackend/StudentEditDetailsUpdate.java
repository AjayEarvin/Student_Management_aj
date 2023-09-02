package studentBackend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/StudentEditDetails")
public class StudentEditDetailsUpdate extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String name=request.getParameter("sname");
			String class1=request.getParameter("sclass");
			String place=request.getParameter("splace");
			String pwd=request.getParameter("pwd");
			HttpSession session=request.getSession();
			String r=(String)session.getAttribute("register_no");
			System.out.println(r);
			System.out.println(name);
			System.out.println(class1);
			System.out.println(place);
		  	Class.forName("com.mysql.jdbc.Driver");
		  	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
		  	PreparedStatement ps=con.prepareStatement("update student_login set student_name=?,department_or_class=?,place=?,password=? where register_no=?");
		  	ps.setString(1, name);
		  	ps.setString(2, class1);
		  	ps.setString(3, place);
		  	ps.setString(4, pwd);
		  	ps.setString(5, r);
		  	
		  	int rs=ps.executeUpdate();
		  	if(rs>0)
		  	{
		  		response.sendRedirect("StudentDetails.jsp");
		  	}
		  	else
		  	{
		  		response.sendRedirect("error.jsp");
		  	}
		  	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
