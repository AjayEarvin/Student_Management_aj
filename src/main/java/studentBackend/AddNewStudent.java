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

@WebServlet("/adduser")
public class AddNewStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String a1=request.getParameter("name");
		String b1=request.getParameter("regno");
		String c1=request.getParameter("class1");
		String d1=request.getParameter("place");
		String e1=request.getParameter("pwd");
		
		StudentRegisterBean b=new StudentRegisterBean();
		b.setName(a1);
		b.setRegno(b1);
		b.setClass1(c1);
		b.setPlace(d1);
		b.setPwd(e1);
		
		String name1=b.getName();
		String regno1=b.getRegno();
		String class2=b.getClass1();
		String place1=b.getPlace();
		String pwd1=b.getPwd();
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student_management","root","9751");
			PreparedStatement ps=con.prepareStatement("insert into student_login(student_name,register_no,department_or_class,place,password) values(?,?,?,?,?);");
			ps.setString(1, name1);
			ps.setString(2, regno1);
			ps.setString(3,class2);
			ps.setString(4, place1);
			ps.setString(5, pwd1);
			int rs=ps.executeUpdate();
			if(rs>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("/StudentDetails.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd=request.getRequestDispatcher("/addNewStudent.jsp");
				rd.forward(request, response);
			}
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
