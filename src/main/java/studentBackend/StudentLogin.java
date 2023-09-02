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
import java.sql.ResultSet;


@WebServlet("/studentlog")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String a=request.getParameter("regno");
		String b=request.getParameter("pwd");
		boolean flag=false;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
			java.sql.Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from student_login");
			while(rs.next())
			{
				if(rs.getString(2).equals(a) && rs.getString(5).equals(b));
				{
					flag=true;
				}
			}
			if(flag)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/studentMainPage.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("/studentlogin.html");
				rd.forward(request, response);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
