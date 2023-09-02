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

@WebServlet("/FacultyEdit")
public class FacultyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String faculty_id=(String)session.getAttribute("faculty_id");
		
		String name=request.getParameter("fname");
		String subject=request.getParameter("fsub");
		String email=request.getParameter("email");
		String pho=request.getParameter("phn");
		String password=request.getParameter("pwd");
		
		Long ph=Long.parseLong(pho); 
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
			PreparedStatement ps=con.prepareStatement("update faculty_login set name=?,major_subject=?,email=?,phone_number=?,password=? where faculty_id=?;");
			ps.setString(1, name);
			ps.setString(2, subject);
			ps.setString(3, email);
			ps.setLong(4, ph);
			ps.setString(5, password);
			ps.setString(6, faculty_id);
			int rs=ps.executeUpdate();
			if(rs>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/facultyDetails.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("/error.jsp");
				rd.forward(request, response);
			}
		} 
		catch (Exception e)
		{
			
		}
	}

}
