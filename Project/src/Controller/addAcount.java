package Controller;

import java.io.IOException;
import java.sql.SQLData;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.userDetails;

@WebServlet("/addAccount")
public class addAcount extends HttpServlet {

	public void init() {
		
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		System.out.println("Post --> addAcount");
		userDetails user = new userDetails();
		
		if(!user.isExist(request.getParameter("username"),request.getParameter("password"))) {
		
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setMobile(request.getParameter("mobile"));
			
			user.insert(user);
			ServletContext sc = request.getServletContext();
			sc.getRequestDispatcher("/Login").forward(request, response);
		}
		else {
			ServletContext sc = request.getServletContext();
			sc.getRequestDispatcher("/Login").forward(request, response);
		}
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {	
		System.out.println("Get --> addAcount");
		try {
			Cookie ck[] = request.getCookies();
			
			String username = ck[0].getValue();
			String password = ck[1].getValue();
			
			userDetails user = new userDetails();
			
			if(user.isExist(username,password)) {
				System.out.println("Coockies Found --> Login as " + username);
				ServletContext sc = request.getServletContext();
				sc.getRequestDispatcher("/Home.jsp").forward(request, response);
			}	
		}catch(Exception e) {
			System.out.println("Coockies Not Found");
			ServletContext sc = request.getServletContext();
			sc.getRequestDispatcher("/Registration.html").forward(request, response);
		}
	}
}
