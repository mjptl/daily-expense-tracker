package Controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.connector.Request;

import model.userDetails;

@WebServlet("/Login")
public class doLogin extends HttpServlet {
	
	public void init() {
	
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		System.out.println("Post --> doLogin");
		userDetails user = new userDetails();
		
		if(user.isExist(request.getParameter("username"),request.getParameter("password"))) {
			
			HttpSession session = request.getSession();
			session.setAttribute("status", "Y");
			session.setAttribute("username", request.getParameter("username"));
			
			ServletContext sc = request.getServletContext();
			sc.getRequestDispatcher("/Home").forward(request, response);
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("status", "N");
			
			ServletContext sc = request.getServletContext();
			sc.getRequestDispatcher("/index.html").include(request, response);
		}
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException {
		System.out.println("Get --> doLogin");
		
		ServletContext sc = request.getServletContext();
		sc.getRequestDispatcher("/index.html").forward(request, response);
	}
}
