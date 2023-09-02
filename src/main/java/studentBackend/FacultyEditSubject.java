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
import java.sql.SQLException;

@WebServlet("/edit")
public class FacultyEditSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String a=request.getParameter("dep");
		String b=request.getParameter("sub");
		HttpSession session=request.getSession();
		String reg_n=(String)session.getAttribute("reg");
		
		try
		{
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
			PreparedStatement ps=con.prepareStatement("update student_details set class_department=?,subject=? where reg_no=?;");
			ps.setString(1, a);
			ps.setString(2, b);
			ps.setString(3, reg_n);
			int rs=ps.executeUpdate();
			if(rs>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/facultySubjectMark.jsp");
				rd.forward(request, response);
				
			}
			else
			{
				response.sendRedirect("/error.jsp");
			}
		} 
		catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		
	}

}
