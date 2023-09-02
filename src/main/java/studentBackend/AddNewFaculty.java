package studentBackend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/add")
public class AddNewFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try{
			String fid=request.getParameter("fid");
			String name=request.getParameter("name");
			String sub=request.getParameter("sub");
			String email=request.getParameter("email");
			String phn=request.getParameter("phn");
			String pass=request.getParameter("pwd");
			
			Long ph=Long.parseLong(phn);
			
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
			PreparedStatement ps=con.prepareStatement("insert into faculty_login(faculty_id,name,major_subject,email,phone_number,password) values(?,?,?,?,?,?)");
			ps.setString(1, fid);
			ps.setString(2, name);
			ps.setString(3, sub);
			ps.setString(4, email);
			ps.setLong(5, ph);
			ps.setString(6, pass);
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
			catch(Exception e)
			{
				e.printStackTrace();
			}
	}

}
