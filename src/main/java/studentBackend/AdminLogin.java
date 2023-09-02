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

@WebServlet("/admin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String a=request.getParameter("email");
		String b=request.getParameter("pwd");
		boolean flag=false;
		
		AdminBean j=new AdminBean();
		j.setEmail(a);
		j.setPWD(b);
		String email1=j.getEmail();
		String pwd1=j.getPWD();
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
			java.sql.Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from admin_login;");
			while(rs.next())
			{
				if(rs.getString(1).equals(email1) && (rs.getString(2).equals(pwd1)))
				{
					flag=true;
				}
			}
			if(flag)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/AdminMainPage.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("/administrationlogin.html");
				rd.forward(request, response);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
