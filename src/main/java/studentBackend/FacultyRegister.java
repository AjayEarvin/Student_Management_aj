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

@WebServlet("/facultReg")
public class FacultyRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String id=request.getParameter("facultyid");
		String name=request.getParameter("name");
		String sub=request.getParameter("subject");
		String gmail=request.getParameter("email");
		String ph=request.getParameter("phonenumber");
		String pwd=request.getParameter("pwd");
		long phn=Long.parseLong(ph);
		
		facultyRegisterBean b=new facultyRegisterBean();
		b.setFacultyid(id);
		b.setName(name);
		b.setSubject(sub);
		b.setEmail(gmail);
		b.setPhonenumber(phn);
		b.setPwd(pwd);
		
		String ids=b.getFacultyid();
		String name1=b.getName();
		String sub1=b.getSubject();
		String gmail1=b.getEmail();
		long phn1=b.getPhonenumber();
		String pwd1=b.getPwd();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
			PreparedStatement ps=con.prepareStatement("insert into faculty_login(faculty_id,name,major_subject,email,phone_number,password) values(?,?,?,?,?,?)");
		    ps.setString(1, ids);
		    ps.setString(2, name1);
		    ps.setString(3, sub1);
		    ps.setString(4, gmail1);
		    ps.setLong(5, phn1);
		    ps.setString(6, pwd1);
		    int rs=ps.executeUpdate();
		    if(rs>0)
		    {
		    	RequestDispatcher rd=request.getRequestDispatcher("/facultylogin.html");
		    	rd.forward(request, response);
		    }
		    else
		    {
		    	RequestDispatcher rd=request.getRequestDispatcher("/facultyRegister.html");
		    	rd.forward(request, response);
		    }
		
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
