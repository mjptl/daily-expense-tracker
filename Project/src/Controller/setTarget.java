package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.transaction;
import model.userDetails;

@WebServlet("/setTargets")
public class setTarget extends HttpServlet {

	public void init() {
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		
		System.out.println("Post --> setTargets");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.01:3306/project","root","root");
			
			HttpSession session = request.getSession();
			
			String sql1 = "update userdetails set salery = ?,target = ? where username = ?;";
			PreparedStatement stm = con.prepareStatement(sql1);
			
			stm.setInt(1, Integer.parseInt(request.getParameter("salery")));
			stm.setInt(2, Integer.parseInt(request.getParameter("target")));
			stm.setString(3, (String)session.getAttribute("username"));
			
			stm.execute();
			ServletContext sc = request.getServletContext();
			sc.getRequestDispatcher("/setTargets.jsp").forward(request, response);
		}catch (Exception e) {
			System.out.println("Exeption in setTarget.Post" + e);
		}
		
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {	
		ServletContext sc = request.getServletContext();
		sc.getRequestDispatcher("/setTargets.jsp").forward(request, response);
	}
}
