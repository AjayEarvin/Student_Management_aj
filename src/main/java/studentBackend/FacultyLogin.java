package studentBackend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import com.mysql.cj.xdevapi.Statement;

@WebServlet("/FacultyLog")
public class FacultyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String a=request.getParameter("facultyid");
			String b=request.getParameter("pwd");
			
			PrintWriter out=response.getWriter();
			boolean flag=false;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
			java.sql.Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from faculty_login;");
			while(rs.next())
			{
				if((rs.getString(1).equals(a)) && (rs.getString(6).equals(b)))
				{
					flag=true;
				}
			}
			if(flag)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/facultyMainPage.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("/facultylogin.html");
				rd.forward(request, response);
			}
			
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
